require 'helper'

describe OmniAuth::FailureEndpoint do
  subject { OmniAuth::FailureEndpoint }

  context 'raise-out environment' do
    before do
      @rack_env = ENV['RACK_ENV']
      ENV['RACK_ENV'] = 'test'

      @default = OmniAuth.config.failure_raise_out_environments
      OmniAuth.config.failure_raise_out_environments = ['test']
    end

    it 'raises out the error' 


    it 'raises out an OmniAuth::Error if no omniauth.error is set' 


    after do
      ENV['RACK_ENV'] = @rack_env
      OmniAuth.config.failure_raise_out_environments = @default
    end
  end

  context 'non-raise-out environment' do
    let(:env) do
      {'omniauth.error.type' => 'invalid_request', 'omniauth.error.strategy' => ExampleStrategy.new({})}
    end

    it 'is a redirect' 


    it 'includes the SCRIPT_NAME' 


    it 'respects the configured path prefix' 


    it 'includes the origin (escaped) if one is provided' 

  end
end

