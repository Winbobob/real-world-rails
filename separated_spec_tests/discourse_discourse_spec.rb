require 'rails_helper'
require 'discourse'

describe Discourse do

  before do
    RailsMultisite::ConnectionManagement.stubs(:current_hostname).returns('foo.com')
  end

  context 'current_hostname' do

    it 'returns the hostname from the current db connection' 


  end

  context 'running_in_rack' do
    after do
      ENV.delete("DISCOURSE_RUNNING_IN_RACK")
    end

    it 'should not be running in rack' 

  end

  context 'base_url' do
    context 'when https is off' do
      before do
        SiteSetting.force_https = false
      end

      it 'has a non https base url' 

    end

    context 'when https is on' do
      before do
        SiteSetting.force_https = true
      end

      it 'has a non-ssl base url' 

    end

    context 'with a non standard port specified' do
      before do
        SiteSetting.port = 3000
      end

      it "returns the non standart port in the base url" 

    end
  end

  context '#site_contact_user' do

    let!(:admin) { Fabricate(:admin) }
    let!(:another_admin) { Fabricate(:admin) }

    it 'returns the user specified by the site setting site_contact_username' 


    it 'returns the system user otherwise' 


  end

  context "#store" do

    it "returns LocalStore by default" 


    it "returns S3Store when S3 is enabled" 


  end

  context 'readonly mode' do
    let(:readonly_mode_key) { Discourse::READONLY_MODE_KEY }
    let(:readonly_mode_ttl) { Discourse::READONLY_MODE_KEY_TTL }
    let(:user_readonly_mode_key) { Discourse::USER_READONLY_MODE_KEY }

    after do
      $redis.del(readonly_mode_key)
      $redis.del(user_readonly_mode_key)
    end

    def assert_readonly_mode(message, key, ttl = -1)
      expect(message.channel).to eq(Discourse.readonly_channel)
      expect(message.data).to eq(true)
      expect($redis.get(key)).to eq("1")
      expect($redis.ttl(key)).to eq(ttl)
    end

    def assert_readonly_mode_disabled(message, key)
      expect(message.channel).to eq(Discourse.readonly_channel)
      expect(message.data).to eq(false)
      expect($redis.get(key)).to eq(nil)
    end

    def get_readonly_message
      messages = MessageBus.track_publish do
        yield
      end

      messages.find { |m| m.channel == Discourse.readonly_channel }
    end

    describe ".enable_readonly_mode" do
      it "adds a key in redis and publish a message through the message bus" 


      context 'user enabled readonly mode' do
        it "adds a key in redis and publish a message through the message bus" 

      end
    end

    describe ".disable_readonly_mode" do
      it "removes a key from redis and publish a message through the message bus" 


      context 'user disabled readonly mode' do
        it "removes readonly key in redis and publish a message through the message bus" 

      end
    end

    describe ".readonly_mode?" do
      it "is false by default" 


      it "returns true when the key is present in redis" 


      it "returns true when Discourse is recently read only" 


      it "returns true when user enabled readonly mode key is present in redis" 

    end

    describe ".received_readonly!" do
      it "sets the right time" 

    end
  end

  context "#handle_exception" do

    class TempSidekiqLogger < Sidekiq::ExceptionHandler::Logger
      attr_accessor :exception, :context
      def call(ex, ctx)
        self.exception = ex
        self.context = ctx
      end
    end

    let!(:logger) { TempSidekiqLogger.new }

    before do
      Sidekiq.error_handlers.clear
      Sidekiq.error_handlers << logger
    end

    it "should not fail when called" 


    it "correctly passes extra context" 

  end

end

