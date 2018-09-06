Thread.abort_on_exception = true

module ThreadSafe
  describe Cache do
    before(:each) do
      @cache = described_class.new
    end

    it 'concurrency' 


    it 'retrieval' 


    it '#put_if_absent' 


    describe '#compute_if_absent' do
      it 'common' 


      it 'with return' 


      it 'exception' 


      it 'atomicity' 

    end

    describe '#compute_if_present' do
      it 'common' 


      it 'with return' 


      it 'exception' 

    end

    describe '#compute' do
      it 'common' 


      it 'with return' 


      it 'exception' 

    end

    describe '#merge_pair' do
      it 'common' 


      it 'with return' 


      it 'exception' 

    end

    it 'updates dont block reads' 


    specify 'collision resistance' do
      expect_collision_resistance(
        (0..1000).map { |i| ThreadSafe::Test::HashCollisionKey(i, 1) }
      )
    end

    specify 'collision resistance with arrays' do
      special_array_class = Class.new(Array) do
        def key # assert_collision_resistance expects to be able to call .key to get the "real" key
          first.key
        end
      end
      # Test collision resistance with a keys that say they responds_to <=>, but then raise exceptions
      # when actually called (ie: an Array filled with non-comparable keys).
      # See https://github.com/headius/thread_safe/issues/19 for more info.
      expect_collision_resistance(
        (0..100).map do |i|
          special_array_class.new(
            [ThreadSafe::Test::HashCollisionKeyNonComparable.new(i, 1)]
          )
        end
      )
    end

    it '#replace_pair' 


    it '#replace_if_exists' 


    it '#get_and_set' 


    it '#key' 


    it '#key?' 


    it '#value?' 


    it '#delete' 


    it '#delete_pair' 


    specify 'default proc' do
      @cache = cache_with_default_proc(1)
      expect_no_size_change do
        expect(false).to eq @cache.key?(:a)
      end
      expect_size_change(1) do
        expect(1).to     eq @cache[:a]
        expect(true).to  eq @cache.key?(:a)
      end
    end

    specify 'falsy default proc' do
      @cache = cache_with_default_proc(nil)
      expect_no_size_change do
        expect(false).to eq @cache.key?(:a)
      end
      expect_size_change(1) do
        expect(nil).to   eq @cache[:a]
        expect(true).to  eq @cache.key?(:a)
      end
    end

    describe '#fetch' do
      it 'common' 


      it 'falsy' 


      it 'with return' 

    end

    describe '#fetch_or_store' do
      it 'common' 


      it 'falsy' 


      it 'with return' 

    end

    it '#clear' 


    describe '#each_pair' do
      it 'common' 


      it 'pair iterator' 


      it 'allows modification' 

    end

    it '#keys' 


    it '#values' 


    it '#each_key' 


    it '#each_value' 


    it '#empty' 


    it 'options validation' 


    it 'initial capacity options validation' 


    it 'load factor options validation' 


    it '#size' 


    it '#get_or_default' 


    it '#dup,#clone' 


    it 'is unfreezable' 


    it 'marshal dump load' 


    it 'marshal dump doesnt work with default proc' 


    private

    def with_or_without_default_proc(&block)
      block.call(false)
      @cache = ThreadSafe::Cache.new { |h, k| h[k] = :default_value }
      block.call(true)
    end

    def cache_with_default_proc(default_value = 1)
      ThreadSafe::Cache.new { |cache, k| cache[k] = default_value }
    end

    def expect_size_change(change, cache = @cache, &block)
      start = cache.size
      block.call
      expect(change).to eq cache.size - start
    end

    def expect_valid_option(option_name, value)
      expect_valid_options(option_name => value)
    end

    def expect_valid_options(options)
      c = ThreadSafe::Cache.new(options)
      expect(c).to be_an_instance_of ThreadSafe::Cache
    end

    def expect_invalid_option(option_name, value)
      expect_invalid_options(option_name => value)
    end

    def expect_invalid_options(options)
      expect { ThreadSafe::Cache.new(options) }.to raise_error(ArgumentError)
    end

    def expect_no_size_change(cache = @cache, &block) 
      expect_size_change(0, cache, &block)
    end

    def expect_handles_return_lambda(method, key, *args)
      before_had_key   = @cache.key?(key)
      before_had_value = before_had_key ? @cache[key] : nil

      returning_lambda = lambda do
        @cache.send(method, key, *args) { return :direct_return }
      end

      expect_no_size_change do
        expect(:direct_return).to   eq returning_lambda.call
        expect(before_had_key).to   eq @cache.key?(key)
        expect(before_had_value).to eq @cache[key] if before_had_value
      end
    end

    class TestException < Exception; end
    def expect_handles_exception(method, key, *args)
      before_had_key   = @cache.key?(key)
      before_had_value = before_had_key ? @cache[key] : nil

      expect_no_size_change do
        expect { @cache.send(method, key, *args) { raise TestException, '' } }.
          to raise_error(TestException)

        expect(before_had_key).to   eq @cache.key?(key)
        expect(before_had_value).to eq @cache[key] if before_had_value
      end
    end

    def expect_compute(key, expected_old_value, expected_result, &block)
      result = @cache.compute(:a) do |old_value|
        expect(expected_old_value).to eq old_value
        block.call
      end
      expect(expected_result).to eq result
    end

    def expect_merge_pair(key, value, expected_old_value, expected_result, &block)
      result = @cache.merge_pair(key, value) do |old_value|
        expect(expected_old_value).to eq old_value
        block.call
      end
      expect(expected_result).to eq result
    end

    def expect_collision_resistance(keys)
      keys.each { |k| @cache[k] = k.key }
      10.times do |i|
        size = keys.size
        while i < size
          k = keys[i]
          expect(k.key == @cache.delete(k) && 
                 !@cache.key?(k) && 
                 (@cache[k] = k.key; @cache[k] == k.key)).to be_truthy
          i += 10
        end
      end
      expect(keys.all? { |k| @cache[k] == k.key }).to be_truthy
    end

    # Took out for compatibility with Rubinius, see https://github.com/rubinius/rubinius/issues/1312
    def fetch_with_return
      lambda do
        @cache.fetch(:a) { return 10 }
      end.call
    end

    # Took out for compatibility with Rubinius, see https://github.com/rubinius/rubinius/issues/1312
    def fetch_or_store_with_return
      lambda do
        @cache.fetch_or_store(:a) { return 10 }
      end.call
    end

  end
end

