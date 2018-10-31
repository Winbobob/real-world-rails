require 'helper'
require 'faraday_middleware/request/oauth'
require 'uri'
require 'forwardable'

describe FaradayMiddleware::OAuth do
  def auth_header(env)
    env[:request_headers]['Authorization']
  end

  def auth_values(env)
    if auth = auth_header(env)
      raise "invalid header: #{auth.inspect}" unless auth.sub!('OAuth ', '')
      Hash[*auth.split(/, |=/)]
    end
  end

  def perform(oauth_options = {}, headers = {}, params = {})
    env = {
      :url => URI('http://example.com/'),
      :request_headers => Faraday::Utils::Headers.new.update(headers),
      :request => {},
      :body => params
    }
    unless oauth_options.is_a? Hash and oauth_options.empty?
      env[:request][:oauth] = oauth_options
    end
    app = make_app
    app.call(faraday_env(env))
  end

  def make_app
    described_class.new(lambda{|env| env}, *Array(options))
  end

  context "invalid options" do
    let(:options) { nil }

    it "errors out" 

  end

  context "empty options" do
    let(:options) { [{}] }

    it "signs request" 

  end

  context "configured with consumer and token" do
    let(:options) do
      [{ :consumer_key => 'CKEY', :consumer_secret => 'CSECRET',
         :token => 'TOKEN', :token_secret => 'TSECRET'
      }]
    end

    it "adds auth info to the header" 


    it "doesn't override existing header" 


    it "can override oauth options per-request" 


    it "can turn off oauth signing per-request" 

  end

  context "configured without token" do
    let(:options) { [{ :consumer_key => 'CKEY', :consumer_secret => 'CSECRET' }] }

    it "adds auth info to the header" 

  end

  context "handling body parameters" do
    let(:options) { [{ :consumer_key => 'CKEY',
                       :consumer_secret => 'CSECRET',
                       :nonce => '547fed103e122eecf84c080843eedfe6',
                       :timestamp => '1286830180'}] }

    let(:value) { {'foo' => 'bar'} }

    let(:type_json) { {'Content-Type' => 'application/json'} }
    let(:type_form) { {'Content-Type' => 'application/x-www-form-urlencoded'} }

    extend Forwardable
    query_method = :build_nested_query
    query_module = ::Faraday::Utils.respond_to?(query_method) ? 'Faraday::Utils' : 'Rack::Utils'
    def_delegator query_module, query_method

    it "does not include the body for JSON" 


    it "includes the body parameters with form Content-Type" 


    it "includes the body parameters with an unspecified Content-Type" 


    it "includes the body parameters for form type with string body" 


  end

end

