require 'rails_helper'

describe DiscourseRedis do
  let(:slave_host) { 'testhost' }
  let(:slave_port) { 1234 }

  let(:config) do
    DiscourseRedis.config.dup.merge(slave_host: 'testhost', slave_port: 1234, connector: DiscourseRedis::Connector)
  end

  let(:fallback_handler) { DiscourseRedis::FallbackHandler.instance }

  it "ignore_readonly returns nil from a pure exception" 


  describe 'redis commands' do
    let(:raw_redis) { Redis.new(DiscourseRedis.config) }

    before do
      raw_redis.flushall
    end

    after do
      raw_redis.flushall
    end

    describe 'when namespace is enabled' do
      let(:redis) { DiscourseRedis.new }

      it 'should append namespace to the keys' 

    end

    describe 'when namespace is disabled' do
      let(:redis) { DiscourseRedis.new(nil, namespace: false) }

      it 'should not append any namespace to the keys' 


      it 'should noop a readonly redis' 

    end
  end

  context '.slave_host' do
    it 'should return the right config' 

  end

  context 'when redis connection is to a slave redis server' do
    it 'should check the status of the master server' 

  end

  describe DiscourseRedis::Connector do
    let(:connector) { DiscourseRedis::Connector.new(config) }

    it 'should return the master config when master is up' 


    class BrokenRedis
      def initialize(error)
        @error = error
      end

      def call(*args)
        raise @error
      end

      def disconnect
      end
    end

    it 'should return the slave config when master is down' 


    it "should return the slave config when master's hostname cannot be resolved" 


    it "should return the slave config when master is still loading data" 


    it "should raise the right error" 

  end

  describe DiscourseRedis::FallbackHandler do
    after do
      fallback_handler.master = true
      MessageBus.keepalive_interval = -1
    end

    describe '#initiate_fallback_to_master' do
      it 'should return the right value if the master server is still down' 


      it 'should fallback to the master server once it is up' 

    end
  end
end

