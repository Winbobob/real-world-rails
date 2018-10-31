# frozen_string_literal: true

RSpec.describe Bundler::Fetcher::Downloader do
  let(:connection)     { double(:connection) }
  let(:redirect_limit) { 5 }
  let(:uri)            { URI("http://www.uri-to-fetch.com/api/v2/endpoint") }
  let(:options)        { double(:options) }

  subject { described_class.new(connection, redirect_limit) }

  describe "fetch" do
    let(:counter)      { 0 }
    let(:httpv)        { "1.1" }
    let(:http_response) { double(:response) }

    before do
      allow(subject).to receive(:request).with(uri, options).and_return(http_response)
      allow(http_response).to receive(:body).and_return("Body with info")
    end

    context "when the # requests counter is greater than the redirect limit" do
      let(:counter) { redirect_limit + 1 }

      it "should raise a Bundler::HTTPError specifying too many redirects" 

    end

    context "logging" do
      let(:http_response) { Net::HTTPSuccess.new("1.1", 200, "Success") }

      it "should log the HTTP response code and message to debug" 

    end

    context "when the request response is a Net::HTTPRedirection" do
      let(:http_response) { Net::HTTPRedirection.new(httpv, 308, "Moved") }

      before { http_response["location"] = "http://www.redirect-uri.com/api/v2/endpoint" }

      it "should try to fetch the redirect uri and iterate the # requests counter" 


      context "when the redirect uri and original uri are the same" do
        let(:uri) { URI("ssh://username:password@www.uri-to-fetch.com/api/v2/endpoint") }

        before { http_response["location"] = "ssh://www.uri-to-fetch.com/api/v1/endpoint" }

        it "should set the same user and password for the redirect uri" 

      end
    end

    context "when the request response is a Net::HTTPSuccess" do
      let(:http_response) { Net::HTTPSuccess.new("1.1", 200, "Success") }

      it "should return the response body" 

    end

    context "when the request response is a Net::HTTPRequestEntityTooLarge" do
      let(:http_response) { Net::HTTPRequestEntityTooLarge.new("1.1", 413, "Too Big") }

      it "should raise a Bundler::Fetcher::FallbackError with the response body" 

    end

    context "when the request response is a Net::HTTPUnauthorized" do
      let(:http_response) { Net::HTTPUnauthorized.new("1.1", 401, "Unauthorized") }

      it "should raise a Bundler::Fetcher::AuthenticationRequiredError with the uri host" 

    end

    context "when the request response is a Net::HTTPNotFound" do
      let(:http_response) { Net::HTTPNotFound.new("1.1", 404, "Not Found") }

      it "should raise a Bundler::Fetcher::FallbackError with Net::HTTPNotFound" 

    end

    context "when the request response is some other type" do
      let(:http_response) { Net::HTTPBadGateway.new("1.1", 500, "Fatal Error") }

      it "should raise a Bundler::HTTPError with the response class and body" 

    end
  end

  describe "request" do
    let(:net_http_get) { double(:net_http_get) }
    let(:response)     { double(:response) }

    before do
      allow(Net::HTTP::Get).to receive(:new).with("/api/v2/endpoint", options).and_return(net_http_get)
      allow(connection).to receive(:request).with(uri, net_http_get).and_return(response)
    end

    it "should log the HTTP GET request to debug" 


    context "when there is a user provided in the request" do
      context "and there is also a password provided" do
        context "that contains cgi escaped characters" do
          let(:uri) { URI("http://username:password%24@www.uri-to-fetch.com/api/v2/endpoint") }

          it "should request basic authentication with the username and password" 

        end

        context "that is all unescaped characters" do
          let(:uri) { URI("http://username:password@www.uri-to-fetch.com/api/v2/endpoint") }
          it "should request basic authentication with the username and proper cgi compliant password" 

        end
      end

      context "and there is no password provided" do
        let(:uri) { URI("http://username@www.uri-to-fetch.com/api/v2/endpoint") }

        it "should request basic authentication with just the user" 

      end

      context "that contains cgi escaped characters" do
        let(:uri) { URI("http://username%24@www.uri-to-fetch.com/api/v2/endpoint") }

        it "should request basic authentication with the proper cgi compliant password user" 

      end
    end

    context "when the request response causes a NoMethodError" do
      before { allow(connection).to receive(:request).with(uri, net_http_get) { raise NoMethodError.new(message) } }

      context "and the error message is about use_ssl=" do
        let(:message) { "undefined method 'use_ssl='" }

        it "should raise a LoadError about openssl" 

      end

      context "and the error message is not about use_ssl=" do
        let(:message) { "undefined method 'undefined_method_call'" }

        it "should raise the original NoMethodError" 

      end
    end

    context "when the request response causes a OpenSSL::SSL::SSLError" do
      before { allow(connection).to receive(:request).with(uri, net_http_get) { raise OpenSSL::SSL::SSLError.new } }

      it "should raise a LoadError about openssl" 

    end

    context "when the request response causes an error included in HTTP_ERRORS" do
      let(:message) { nil }
      let(:error)   { RuntimeError.new(message) }

      before do
        stub_const("Bundler::Fetcher::HTTP_ERRORS", [RuntimeError])
        allow(connection).to receive(:request).with(uri, net_http_get) { raise error }
      end

      it "should trace log the error" 


      context "when error message is about the host being down" do
        let(:message) { "host down: http://www.uri-to-fetch.com" }

        it "should raise a Bundler::Fetcher::NetworkDownError" 

      end

      context "when error message is about getaddrinfo issues" do
        let(:message) { "getaddrinfo: nodename nor servname provided for http://www.uri-to-fetch.com" }

        it "should raise a Bundler::Fetcher::NetworkDownError" 

      end

      context "when error message is about neither host down or getaddrinfo" do
        let(:message) { "other error about network" }

        it "should raise a Bundler::HTTPError" 


        context "when the there are credentials provided in the request" do
          let(:uri) { URI("http://username:password@www.uri-to-fetch.com/api/v2/endpoint") }
          before do
            allow(net_http_get).to receive(:basic_auth).with("username", "password")
          end

          it "should raise a Bundler::HTTPError that doesn't contain the password" 

        end
      end

      context "when error message is about no route to host" do
        let(:message) { "Failed to open TCP connection to www.uri-to-fetch.com:443 " }

        it "should raise a Bundler::Fetcher::HTTPError" 

      end
    end
  end
end

