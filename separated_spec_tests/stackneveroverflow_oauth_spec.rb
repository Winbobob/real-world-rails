require "helper"

describe "OmniAuth::Strategies::OAuth" do
  class MyOAuthProvider < OmniAuth::Strategies::OAuth
    uid { access_token.token }
    info { {"name" => access_token.token} }
  end

  def app
    Rack::Builder.new do
      use OmniAuth::Test::PhonySession
      use OmniAuth::Builder do
        provider MyOAuthProvider, "abc", "def", :client_options => {:site => "https://api.example.org"}, :name => "example.org"
        provider MyOAuthProvider, "abc", "def", :client_options => {:site => "https://api.example.org"}, :authorize_params => {:abc => "def"}, :name => "example.org_with_authorize_params"
        provider MyOAuthProvider, "abc", "def", :client_options => {:site => "https://api.example.org"}, :request_params => {:scope => "http://foobar.example.org"}, :name => "example.org_with_request_params"
      end
      run lambda { |env| [404, {"Content-Type" => "text/plain"}, [env.key?("omniauth.auth").to_s]] }
    end.to_app
  end

  def session
    last_request.env["rack.session"]
  end

  before do
    stub_request(:post, "https://api.example.org/oauth/request_token").
      to_return(:body => "oauth_token=yourtoken&oauth_token_secret=yoursecret&oauth_callback_confirmed=true")
  end

  it "should add a camelization for itself" 


  describe "/auth/{name}" do
    context "successful" do
      before do
        get "/auth/example.org"
      end

      it "should redirect to authorize_url" 


      it "should redirect to authorize_url with authorize_params when set" 


      it "should set appropriate session variables" 


      it "should pass request_params to get_request_token" 

    end

    context "unsuccessful" do
      before do
        stub_request(:post, "https://api.example.org/oauth/request_token").
          to_raise(::Net::HTTPFatalError.new('502 "Bad Gateway"', nil))
        get "/auth/example.org"
      end

      it "should call fail! with :service_unavailable" 


      context "SSL failure" do
        before do
          stub_request(:post, "https://api.example.org/oauth/request_token").
            to_raise(::OpenSSL::SSL::SSLError.new("SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed"))
          get "/auth/example.org"
        end

        it "should call fail! with :service_unavailable" 

      end
    end
  end

  describe "/auth/{name}/callback" do
    before do
      stub_request(:post, "https://api.example.org/oauth/access_token").
        to_return(:body => "oauth_token=yourtoken&oauth_token_secret=yoursecret")
      get "/auth/example.org/callback", {:oauth_verifier => "dudeman"}, "rack.session" => {"oauth" => {"example.org" => {"callback_confirmed" => true, "request_token" => "yourtoken", "request_secret" => "yoursecret"}}}
    end

    it "should exchange the request token for an access token" 


    it "should call through to the master app" 


    context "bad gateway (or any 5xx) for access_token" do
      before do
        stub_request(:post, "https://api.example.org/oauth/access_token")  .
          to_raise(::Net::HTTPFatalError.new('502 "Bad Gateway"', nil))
        get "/auth/example.org/callback", {:oauth_verifier => "dudeman"}, "rack.session" => {"oauth" => {"example.org" => {"callback_confirmed" => true, "request_token" => "yourtoken", "request_secret" => "yoursecret"}}}
      end

      it "should call fail! with :service_unavailable" 

    end

    context "SSL failure" do
      before do
        stub_request(:post, "https://api.example.org/oauth/access_token")  .
          to_raise(::OpenSSL::SSL::SSLError.new("SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed"))
        get "/auth/example.org/callback", {:oauth_verifier => "dudeman"}, "rack.session" => {"oauth" => {"example.org" => {"callback_confirmed" => true, "request_token" => "yourtoken", "request_secret" => "yoursecret"}}}
      end

      it "should call fail! with :service_unavailable" 

    end
  end

  describe "/auth/{name}/callback with expired session" do
    before do
      stub_request(:post, "https://api.example.org/oauth/access_token").
        to_return(:body => "oauth_token=yourtoken&oauth_token_secret=yoursecret")
      get "/auth/example.org/callback", {:oauth_verifier => "dudeman"}, "rack.session" => {}
    end

    it "should call fail! with :session_expired" 

  end
end

