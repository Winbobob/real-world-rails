require "spec_helper"

describe Rack::Test::Session do
  describe "initialization" do
    it "supports being initialized with a Rack::MockSession app" 


    it "supports being initialized with an app" 

  end

  describe "#request" do
    it "requests the URI using GET by default" 


    it "returns a response" 


    it "uses the provided env" 


    it "allows HTTP_HOST to be set" 


    it "sets HTTP_HOST with port for non-default ports" 


    it "sets HTTP_HOST without port for default ports" 


    it "defaults to GET" 


    it "defaults the REMOTE_ADDR to 127.0.0.1" 


    it "sets rack.test to true in the env" 


    it "defaults to port 80" 


    it "defaults to example.org" 


    it "yields the response to a given block" 


    it "supports sending :params" 


    it "doesn't follow redirects by default" 


    it "allows passing :input in for POSTs" 


    it "converts method names to a uppercase strings" 


    it "prepends a slash to the URI path" 


    it "accepts params and builds query strings for GET requests" 


    it "parses query strings with repeated variable names correctly" 


    it "accepts raw input in params for GET requests" 


    it "does not rewrite a GET query string when :params is not supplied" 


    it "accepts params and builds url encoded params for POST requests" 


    it "accepts raw input in params for POST requests" 


    context "when the response body responds_to?(:close)" do
      class CloseableBody
        def initialize
          @closed = false
        end

        def each
          return if @closed
          yield "Hello, World!"
        end

        def close
          @closed = true
        end
      end

      it "closes response's body" 


      it "closes response's body after iteration" 

    end

    context "when input is given" do
      it "sends the input" 


      it "does not send a multipart request" 

    end

    context "for a POST specified with :method" do
      it "uses application/x-www-form-urlencoded as the CONTENT_TYPE" 

    end

    context "for a POST specified with REQUEST_METHOD" do
      it "uses application/x-www-form-urlencoded as the CONTENT_TYPE" 

    end

    context "when CONTENT_TYPE is specified in the env" do
      it "does not overwrite the CONTENT_TYPE" 

    end

    context "when the URL is https://" do
      it "sets rack.url_scheme to https" 


      it "sets SERVER_PORT to 443" 


      it "sets HTTPS to on" 

    end

    context "for a XHR" do
      it "sends XMLHttpRequest for the X-Requested-With header" 

    end
  end

  describe "#header" do
    it "sets a header to be sent with requests" 


    it "sets a Content-Type to be sent with requests" 


    it "sets a Host to be sent with requests" 


    it "persists across multiple requests" 


    it "overwrites previously set headers" 


    it "can be used to clear a header" 


    it "is overridden by headers sent during the request" 

  end

  describe "#env" do
    it "sets the env to be sent with requests" 


    it "persists across multiple requests" 


    it "overwrites previously set envs" 


    it "can be used to clear a env" 


    it "is overridden by envs sent during the request" 

  end

  describe "#authorize" do
    it "sets the HTTP_AUTHORIZATION header" 


    it "includes the header for subsequent requests" 

  end

  describe "follow_redirect!" do
    it "follows redirects" 


    it "does not include params when following the redirect" 


    it "raises an error if the last_response is not set" 


    it "raises an error if the last_response is not a redirect" 

  end

  describe "#last_request" do
    it "returns the most recent request" 


    it "raises an error if no requests have been issued" 

  end

  describe "#last_response" do
    it "returns the most recent response" 


    it "raises an error if no requests have been issued" 

  end

  describe "after_request" do
    it "runs callbacks after each request" 


    it "runs multiple callbacks" 

  end

  describe "#get" do
    it_should_behave_like "any #verb methods"

    def verb
      "get"
    end

    it "uses the provided params hash" 


    it "sends params with parens in names" 


    it "supports params with encoding sensitive names" 


    it "supports params with nested encoding sensitive names" 


    it "accepts params in the path" 

  end

  describe "#head" do
    it_should_behave_like "any #verb methods"

    def verb
      "head"
    end
  end

  describe "#post" do
    it_should_behave_like "any #verb methods"

    def verb
      "post"
    end

    it "uses the provided params hash" 


    it "supports params with encoding sensitive names" 


    it "uses application/x-www-form-urlencoded as the CONTENT_TYPE" 


    it "accepts a body" 


    context "when CONTENT_TYPE is specified in the env" do
      it "does not overwrite the CONTENT_TYPE" 

    end
  end

  describe "#put" do
    it_should_behave_like "any #verb methods"

    def verb
      "put"
    end

    it "accepts a body" 

  end

  describe "#patch" do
    it_should_behave_like "any #verb methods"

    def verb
      "patch"
    end

    it "accepts a body" 

  end

  describe "#delete" do
    it_should_behave_like "any #verb methods"

    def verb
      "delete"
    end
  end

  describe "#options" do
    it_should_behave_like "any #verb methods"

    def verb
      "options"
    end
  end
end

