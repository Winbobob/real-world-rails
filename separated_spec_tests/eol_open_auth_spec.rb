require File.dirname(__FILE__) + '/../../spec_helper'

describe EOL::OpenAuth do

  describe '#self.config_file' do

    it 'should load YAML configuration file' 


  end

  describe '#self.init' do

    before :each do
      stub_oauth_requests
      @oauth1_consumer = OAuth::Consumer.new(
        "key",
        "secret",
        { site: "http://fake.oauth1.provider",
          request_token_path: "/example/request_token",
          access_token_path: "/example/access_token",
          authorize_path: "/example/authorize" })
    end

    it 'should create instance of EOL::OpenAuth::Facebook' 


    it 'should create instance of EOL::OpenAuth::Google' 


    it 'should create instance of EOL::OpenAuth::Twitter' 


    it 'should create instance of EOL::OpenAuth::Yahoo' 


  end
end


