# This class fakes some behavior of
# ActiveSupport::HashWithIndifferentAccess.
# It dosen't convert recursively.
class FakeHashWithIndifferentAccess < Hash
  class << self
    def from_hash(hsh)
      new_hsh = new
      hsh.each do |key, value|
        new_hsh[key] = value
      end
      new_hsh
    end
  end

  def [](key)
    super(key.to_s)
  end

  def []=(key, value)
    super(key.to_s, value)
  end

  def key?(key)
    super(key.to_s)
  end

  def to_hash
    new_hsh = ::Hash.new
    each do |key, value|
      new_hsh[key] = value
    end
    new_hsh
  end
end

RSpec.describe "#include matcher" do
  it "is diffable" 


  shared_examples_for "a Hash target" do
    def build_target(hsh)
      hsh
    end

    def use_string_keys_in_failure_message?
      false
    end

    def convert_key(key)
      use_string_keys_in_failure_message? ? "\"#{key}\"" : ":#{key}"
    end

    it 'passes if target has the expected as a key' 


    it "fails if target does not include expected" 


    it "fails if target doesn't have a key and we expect nil" 


    it 'works even when an entry in the hash overrides #send' 


    it 'provides a valid diff' 

  end

  describe "expect(...).to include(with_one_arg)" do
    it_behaves_like "an RSpec matcher", :valid_value => [1, 2], :invalid_value => [1] do
      let(:matcher) { include(2) }
    end

    context "for an object that does not respond to `include?`" do
      it 'fails gracefully' 

    end

    context "for an arbitrary object that responds to `include?`" do
      it 'delegates to `include?`' 

    end

    context "for an arbitrary object that responds to `include?` and `to_hash`" do
      it "delegates to `include?`" 

    end

    context "for a string target" do
      it "passes if target includes expected" 


      it "fails if target does not include expected" 


      it "includes a diff when actual is multiline" 


      it "includes a diff when actual is multiline and there are multiple expecteds" 


      it "does not diff when lines match but are not an exact match" 

    end

    context "for an array target" do
      it "passes if target includes expected" 


      it "fails if target does not include expected" 


      it 'fails when given differing null doubles' 


      it 'passes when given the same null double' 

    end

    context "for a hash target" do
      it_behaves_like "a Hash target"
    end

    context "for a target that subclasses Hash to treat string/symbol keys interchangeably, but returns a raw hash from #to_hash" do
      it_behaves_like "a Hash target" do
        undef :build_target # to prevent "method redefined" warning
        def build_target(hsh)
          FakeHashWithIndifferentAccess.from_hash(hsh)
        end

        undef :use_string_keys_in_failure_message? # to prevent "method redefined" warning
        def use_string_keys_in_failure_message?
          true
        end
      end
    end

    context "for a target that can pass for a hash" do
      def build_target(hsh)
        PseudoHash.new(hsh)
      end

      around do |example|
        in_sub_process_if_possible do
          require 'delegate'

          class PseudoHash < SimpleDelegator
          end

          example.run
        end
      end

      it_behaves_like "a Hash target"
    end
  end

  describe "expect(...).to include(with, multiple, args)" do
    it "has a description" 

    context "for a string target" do
      it "passes if target includes all items" 


      it "fails if target does not include one of the items" 


      it "fails if target does not include two of the items" 


      it "fails if target does not include many of the items" 

    end

    context "for an array target" do
      it "passes if target includes all items" 


      it "fails if target does not include one of the items" 


      it "fails if target does not include two of the items" 


      it "fails if target does not include many of the items" 


      it 'correctly diffs lists of hashes' 

    end

    context "for a hash target" do
      it 'passes if target includes all items as keys' 


      it 'fails if target does not include one of the items as a key' 


      it "fails if target does not include two of the items as keys" 


      it "fails if target does not include many of the items as keys" 

    end
  end

  describe "expect(...).not_to include(expected)" do
    context "for an object that does not respond to `include?`" do
      it 'fails gracefully' 

    end

    context "for an arbitrary object that responds to `include?`" do
      it 'delegates to `include?`' 

    end

    context "for a string target" do
      it "passes if target does not include expected" 


      it "fails if target includes expected" 

    end

    context "for an array target" do
      it "passes if target does not include expected" 


      it "fails if target includes expected" 


      it 'passes when given differing null doubles' 


      it 'fails when given the same null double' 

    end

    context "for a hash target" do
      it 'passes if target does not have the expected as a key' 


      it "fails if target includes expected key" 

    end

  end

  describe "expect(...).not_to include(with, multiple, args)" do
    context "for a string target" do
      it "passes if the target does not include any of the expected" 


      it "fails if the target includes all of the expected" 


      it "fails if the target includes one (but not all) of the expected" 


      it "fails if the target includes two (but not all) of the expected" 


      it "fails if the target includes many (but not all) of the expected" 

    end

    context "for a hash target" do
      it "passes if it does not include any of the expected keys" 


      it "fails if the target includes all of the expected keys" 


      it "fails if the target includes one (but not all) of the expected keys" 


      it "fails if the target includes two (but not all) of the expected keys" 


      it "fails if the target includes many (but not all) of the expected keys" 

    end

    context "for an array target" do
      it "passes if the target does not include any of the expected" 


      it "fails if the target includes all of the expected" 


      it "fails if the target includes one (but not all) of the expected" 


      it "fails if the target includes two (but not all) of the expected" 


      it "fails if the target includes many (but not all) of the expected" 

    end
  end

  describe "expect(...).to include(:key => value)" do
    context 'for a hash target' do
      it "passes if target includes the key/value pair" 


      it "passes if target includes the key/value pair among others" 


      it "fails if target has a different value for key" 


      it "fails if target has a different key" 

    end

    context 'for a non-hash target' do
      it "fails if the target does not contain the given hash" 


      it "passes if the target contains the given hash" 

    end
  end

  describe "expect(...).not_to include(:key => value)" do
    context 'for a hash target' do
      it "fails if target includes the key/value pair" 


      it "fails if target includes the key/value pair among others" 


      it "passes if target has a different value for key" 


      it "passes if target has a different key" 

    end

    context "for a non-hash target" do
      it "passes if the target does not contain the given hash" 


      it "fails if the target contains the given hash" 

    end
  end

  describe "expect(...).to include(:key1 => value1, :key2 => value2)" do
    context 'for a hash target' do
      it "passes if target includes the key/value pairs" 


      it "passes if target includes the key/value pairs among others" 


      it "fails if target has a different value for one of the keys" 


      it "fails if target has a different value for both of the keys" 


      it "fails if target lacks one of the keys" 


      it "fails if target lacks both of the keys" 


      it "fails if target lacks one of the keys and has a different value for another" 

    end

    context 'for a non-hash target' do
      it "fails if the target does not contain the given hash" 


      it "passes if the target contains the given hash" 

    end
  end

  describe "expect(...).not_to include(:key1 => value1, :key2 => value2)" do
    context 'for a hash target' do
      it "fails if target includes the key/value pairs" 


      it "fails if target includes the key/value pairs among others" 


      it "fails if target has a different value for one of the keys" 


      it "passes if target has a different value for both of the keys" 


      it "fails if target lacks one of the keys" 


      it "passes if target lacks both of the keys" 

    end

    context 'for a non-hash target' do
      it "passes if the target does not contain the given hash" 


      it "fails if the target contains the given hash" 

    end
  end

  describe "Composing matchers with `include`" do
    RSpec::Matchers.define :a_string_containing do |expected|
      match do |actual|
        actual.include?(expected)
      end

      description do
        "a string containing '#{expected}'"
      end
    end

    describe "expect(array).to include(matcher)" do
      it "passes when the matcher matches one of the values" 


      it 'provides a description' 


      it 'fails with a clear message when the matcher matches none of the values' 


      it 'works with comparison matchers' 


      it 'does not treat an object that only implements #matches? as a matcher' 

    end

    describe "expect(array).to include(multiple, matcher, arguments)" do
      it "passes if target includes items satisfying all matchers" 


      it "fails if target does not include an item satisfying any one of the items" 

    end

    describe "expect(hash).to include(key => matcher)" do
      it "passes when the matcher matches" 


      it 'provides a description' 


      it "fails with a clear message when the matcher does not match" 

    end

    describe "expect(hash).to include(key_matcher)" do
      it "passes when the matcher matches a key", :if => (RUBY_VERSION.to_f > 1.8) do
        expect(:drink => "water", :food => "bread").to include(a_string_matching(/foo/))
      end

      it 'provides a description' 


      it 'fails with a clear message when the matcher does not match', :if => (RUBY_VERSION.to_f > 1.8) do
        expect {
          expect(:drink => "water", :food => "bread").to include(a_string_matching(/bar/))
        }.to fail_matching('expected {:drink => "water", :food => "bread"} to include (a string matching /bar/)')
      end
    end

    describe "expect(array).not_to include(multiple, matcher, arguments)" do
      it "passes if none of the target values satisfies any of the matchers" 


      it 'fails if all of the matchers are satisfied by one of the target values' 


      it 'fails if the some (but not all) of the matchers are satisifed' 

    end
  end

  # `fail_including` uses the `include` matcher internally, and using a matcher
  # to test itself is potentially problematic, so just for this spec file we
  # use `fail_matching` instead, which converts to a regex instead.
  def fail_matching(message)
    raise_error(RSpec::Expectations::ExpectationNotMetError, /#{Regexp.escape(message)}/)
  end
end

