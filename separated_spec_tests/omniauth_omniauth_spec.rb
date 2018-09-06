require 'helper'

describe OmniAuth do
  describe '.strategies' do
    it 'increases when a new strategy is made' 

  end

  context 'configuration' do
    describe '.defaults' do
      it 'is a hash of default configuration' 

    end

    it 'is callable from .configure' 


    before do
      @old_path_prefix           = OmniAuth.config.path_prefix
      @old_on_failure            = OmniAuth.config.on_failure
      @old_before_callback_phase = OmniAuth.config.before_callback_phase
      @old_before_options_phase  = OmniAuth.config.before_options_phase
      @old_before_request_phase  = OmniAuth.config.before_request_phase
    end

    after do
      OmniAuth.configure do |config|
        config.path_prefix           = @old_path_prefix
        config.on_failure            = @old_on_failure
        config.before_callback_phase = @old_before_callback_phase
        config.before_options_phase  = @old_before_options_phase
        config.before_request_phase  = @old_before_request_phase
      end
    end

    it 'is able to set the path' 


    it 'is able to set the on_failure rack app' 


    it 'is able to set hook on option_call' 


    it 'is able to set hook on request_call' 


    it 'is able to set hook on callback_call' 


    describe 'mock auth' do
      before do
        @auth_hash = {:uid => '12345', :info => {:name => 'Joe', :email => 'joe@example.com'}}
        @original_auth_hash = @auth_hash.dup

        OmniAuth.config.add_mock(:facebook, @auth_hash)
      end
      it 'default is AuthHash' 

      it 'facebook is AuthHash' 

      it 'sets facebook attributes' 

      it 'does not mutate given auth hash' 

    end
  end

  describe '.logger' do
    it 'calls through to the configured logger' 

  end

  describe '::Utils' do
    describe '.deep_merge' do
      it 'combines hashes' 

    end

    describe '.camelize' do
      it 'works on normal cases' 


      it 'works in special cases that have been added' 

    end
  end
end

