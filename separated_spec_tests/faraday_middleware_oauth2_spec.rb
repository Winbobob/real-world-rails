require 'helper'
require 'uri'
require 'faraday_middleware/request/oauth2'
require 'faraday/utils'

describe FaradayMiddleware::OAuth2 do

  def query_params(env)
    Faraday::Utils.parse_query env[:url].query
  end

  def auth_header(env)
    env[:request_headers]['Authorization']
  end

  def perform(params = {}, headers = {})
    env = {
      :url => URI('http://example.com/?' + Faraday::Utils.build_query(params)),
      :request_headers => Faraday::Utils::Headers.new.update(headers)
    }
    app = make_app
    app.call(faraday_env(env))
  end

  def make_app
    described_class.new(lambda{|env| env}, *Array(options))
  end

  context "no token configured" do
    let(:options) { [nil, {:token_type => :param}] }

    it "doesn't add params" 


    it "doesn't add headers" 


    it "creates header for explicit token" 


    context "bearer token type configured" do
      let(:options) { [nil, {:token_type => :bearer}] }

      it "doesn't add headers" 


      it "adds header for explicit token" 

    end
  end

  context "default token configured" do
    let(:options) { ['XYZ', {:token_type => :param}] }

    it "adds token param" 


    it "adds token header" 


    it "overrides default with explicit token" 


    it "clears default with empty explicit token" 


    context "bearer token type configured" do
      let(:options) { ['XYZ', {:token_type => :bearer}] }

      it "adds token header" 


      it "overrides default with explicit token" 


      it "clears default with empty explicit token" 

    end
  end

  context "existing Authorization header" do
    let(:options) { ['XYZ', {:token_type => :param}] }
    subject { perform({:q => 'hello'}, 'Authorization' => 'custom') }

    it "adds token param" 


    it "doesn't override existing header" 


    context "bearer token type configured" do
      let(:options) { ['XYZ', {:token_type => :bearer}] }
      subject { perform({:q => 'hello'}, 'Authorization' => 'custom') }

      it "doesn't override existing header" 

    end
  end

  context "custom param name configured" do
    let(:options) { ['XYZ', {:token_type => :param, :param_name => :oauth}] }

    it "adds token param" 


    it "overrides default with explicit token" 

  end

  context "options without token configuration" do
    let(:options) { [{:token_type => :param, :param_name => :oauth}] }

    it "doesn't add param" 


    it "overrides default with explicit token" 

  end

  context "invalid param name configured" do
    let(:options) { ['XYZ', {:token_type => :param, :param_name => nil}] }

    it "raises error" 

  end
end

