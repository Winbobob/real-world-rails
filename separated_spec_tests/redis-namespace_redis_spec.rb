# encoding: utf-8

require File.dirname(__FILE__) + '/spec_helper'

describe "redis" do
  @redis_version = Gem::Version.new(Redis.current.info["redis_version"])
  let(:redis_client) { @redis.respond_to?(:_client) ? @redis._client : @redis.client}

  before(:all) do
    # use database 15 for testing so we dont accidentally step on your real data
    @redis = Redis.new :db => 15
  end

  before(:each) do
    @namespaced = Redis::Namespace.new(:ns, :redis => @redis)
    @redis.flushdb
    @redis.set('foo', 'bar')
  end

  after(:each) do
    @redis.flushdb
  end

  after(:all) do
    @redis.quit
  end

  # redis-rb 3.3.4+
  it "should inject :namespace into connection info" 


  it "proxies `client` to the _client and deprecated" 


  it "proxies `_client` to the _client" 


  it "should be able to use a namespace" 


  context 'when sending capital commands (issue 68)' do
    it 'should be able to use a namespace' 

  end

  it "should be able to use a namespace with bpop" 


  it "should be able to use a namespace with del" 


  it "should be able to use a namespace with unlink" 


  it 'should be able to use a namespace with append' 


  it 'should be able to use a namespace with brpoplpush' 


  it 'should be able to use a namespace with getbit' 


  it 'should be able to use a namespace with getrange' 


  it 'should be able to use a namespace with linsert' 


  it 'should be able to use a namespace with lpushx' 


  it 'should be able to use a namespace with rpushx' 


  it 'should be able to use a namespace with setbit' 


  it 'should be able to use a namespace with setrange' 


  it "should be able to use a namespace with mget" 


  it "should be able to use a namespace with mset" 


  it "should be able to use a namespace with msetnx" 


  it "should be able to use a namespace with mapped_msetnx" 


  it "should be able to use a namespace with hashes" 


  it "should properly intersect three sets" 


  it "should properly union two sets" 


  it "should properly union two sorted sets with options" 


  it "should properly union two sorted sets without options" 


  it "should properly intersect two sorted sets without options" 


  it "should properly intersect two sorted sets with options" 


  it "should add namespace to sort" 


  it "should yield the correct list of keys" 


  it "should add namepsace to multi blocks" 


  it "should pass through multi commands without block" 


  it 'should return futures without attempting to remove namespaces' 


  it "should add namespace to pipelined blocks" 


  it "should returned response array from pipelined block" 


  it "should add namespace to strlen" 


  it "should not add namespace to echo" 


  it 'should not add namespace to disconnect!' 


  it "can change its namespace" 


  it "can accept a temporary namespace" 


  it "should respond to :namespace=" 


  it "should respond to :warning=" 


  it "should raise an exception when an unknown command is passed" 


  # Redis 2.6 RC reports its version as 2.5.
  if @redis_version >= Gem::Version.new("2.5.0")
    describe "redis 2.6 commands" do
      it "should namespace bitcount" 


      it "should namespace bitop" 


      it "should namespace dump and restore" 


      it "should namespace hincrbyfloat" 


      it "should namespace incrbyfloat" 


      it "should namespace object" 


      it "should namespace persist" 


      it "should namespace pexpire" 


      it "should namespace pexpireat" 


      it "should namespace psetex" 


      it "should namespace pttl" 


      it "should namespace eval keys passed in as array args" 


      it "should namespace eval keys passed in as hash args" 


      it "should namespace eval keys passed in as hash args unmodified" 


      context '#evalsha' do
        let!(:sha) do
          @redis.script(:load, "return {KEYS[1], KEYS[2]}")
        end

        it "should namespace evalsha keys passed in as array args" 


        it "should namespace evalsha keys passed in as hash args" 


        it "should namespace evalsha keys passed in as hash args unmodified" 

      end

      context "in a nested namespace" do
        let(:nested_namespace) { Redis::Namespace.new(:nest, :redis => @namespaced) }
        let(:sha) { @redis.script(:load, "return {KEYS[1], KEYS[2]}") }

        it "should namespace eval keys passed in as hash args" 

        it "should namespace evalsha keys passed in as hash args" 

      end
    end
  end

  # Redis 2.8 RC reports its version as 2.7.
  if @redis_version >= Gem::Version.new("2.7.105")
    describe "redis 2.8 commands" do
      context 'keyspace scan methods' do
        let(:keys) do
          %w(alpha ns:beta gamma ns:delta ns:epsilon ns:zeta:one ns:zeta:two ns:theta)
        end
        let(:namespaced_keys) do
          keys.map{|k| k.dup.sub!(/\Ans:/,'') }.compact.sort
        end
        before(:each) do
          keys.each do |key|
            @redis.set(key, key)
          end
        end
        let(:matching_namespaced_keys) do
          namespaced_keys.select{|k| k[/\Azeta:/] }.compact.sort
        end

        context '#scan' do
          context 'when :match supplied' do
            it 'should retrieve the proper keys' 

          end
          context 'without :match supplied' do
            it 'should retrieve the proper keys' 

          end
        end if Redis.current.respond_to?(:scan)

        context '#scan_each' do
          context 'when :match supplied' do
            context 'when given a block' do
              it 'should yield unnamespaced' 

            end
            context 'without a block' do
              it 'should return an Enumerator that un-namespaces' 

            end
          end
          context 'without :match supplied' do
            context 'when given a block' do
              it 'should yield unnamespaced' 

            end
            context 'without a block' do
              it 'should return an Enumerator that un-namespaces' 

            end
          end
        end if Redis.current.respond_to?(:scan_each)
      end

      context 'hash scan methods' do
        before(:each) do
          @redis.mapped_hmset('hsh', {'zeta:wrong:one' => 'WRONG', 'wrong:two' => 'WRONG'})
          @redis.mapped_hmset('ns:hsh', hash)
        end
        let(:hash) do
          {'zeta:one' => 'OK', 'zeta:two' => 'OK', 'three' => 'OKAY'}
        end
        let(:hash_matching_subset) do
          # select is not consistent from 1.8.7 -> 1.9.2 :(
          hash.reject {|k,v| !k[/\Azeta:/] }
        end
        context '#hscan' do
          context 'when supplied :match' do
            it 'should retrieve the proper keys' 

          end
          context 'without :match supplied' do
            it 'should retrieve all hash keys' 

          end
        end if Redis.current.respond_to?(:hscan)

        context '#hscan_each' do
          context 'when :match supplied' do
            context 'when given a block' do
              it 'should yield the correct hash keys unchanged' 

            end
            context 'without a block' do
              it 'should return an Enumerator that yields the correct hash keys unchanged' 

            end
          end
          context 'without :match supplied' do
            context 'when given a block' do
              it 'should yield all hash keys unchanged' 

            end
            context 'without a block' do
              it 'should return an Enumerator that yields all keys unchanged' 

            end
          end
        end if Redis.current.respond_to?(:hscan_each)
      end

      context 'set scan methods' do
        before(:each) do
          set.each { |elem| @namespaced.sadd('set', elem) }
          @redis.sadd('set', 'WRONG')
        end
        let(:set) do
          %w(zeta:one zeta:two three)
        end
        let(:matching_subset) do
          set.select { |e| e[/\Azeta:/] }
        end

        context '#sscan' do
          context 'when supplied :match' do
            it 'should retrieve the matching set members from the proper set' 

          end
          context 'without :match supplied' do
            it 'should retrieve all set members from the proper set' 

          end
        end if Redis.current.respond_to?(:sscan)

        context '#sscan_each' do
          context 'when :match supplied' do
            context 'when given a block' do
              it 'should yield the correct hset elements unchanged' 

            end
            context 'without a block' do
              it 'should return an Enumerator that yields the correct set elements unchanged' 

            end
          end
          context 'without :match supplied' do
            context 'when given a block' do
              it 'should yield all set elements unchanged' 

            end
            context 'without a block' do
              it 'should return an Enumerator that yields all set elements unchanged' 

            end
          end
        end if Redis.current.respond_to?(:sscan_each)
      end

      context 'zset scan methods' do
        before(:each) do
          hash.each {|member, score| @namespaced.zadd('zset', score, member)}
          @redis.zadd('zset', 123.45, 'WRONG')
        end
        let(:hash) do
          {'zeta:one' => 1, 'zeta:two' => 2, 'three' => 3}
        end
        let(:hash_matching_subset) do
          # select is not consistent from 1.8.7 -> 1.9.2 :(
          hash.reject {|k,v| !k[/\Azeta:/] }
        end
        context '#zscan' do
          context 'when supplied :match' do
            it 'should retrieve the matching set elements and their scores' 

          end
          context 'without :match supplied' do
            it 'should retrieve all set elements and their scores' 

          end
        end if Redis.current.respond_to?(:zscan)

        context '#zscan_each' do
          context 'when :match supplied' do
            context 'when given a block' do
              it 'should yield the correct set elements and scores unchanged' 

            end
            context 'without a block' do
              it 'should return an Enumerator that yields the correct set elements and scoresunchanged' 

            end
          end
          context 'without :match supplied' do
            context 'when given a block' do
              it 'should yield all set elements and scores unchanged' 

            end
            context 'without a block' do
              it 'should return an Enumerator that yields all set elements and scores unchanged' 

            end
          end
        end if Redis.current.respond_to?(:zscan_each)
      end
    end
  end

  if @redis_version >= Gem::Version.new("2.8.9")
    it 'should namespace pfadd' 


    it 'should namespace pfcount' 


    it 'should namespace pfmerge' 

  end
end

