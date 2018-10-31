require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper'))

RSpec.describe HTTParty::Request do
  before do
    @request = HTTParty::Request.new(Net::HTTP::Get, 'http://api.foo.com/v1', format: :xml)
  end

  describe "::NON_RAILS_QUERY_STRING_NORMALIZER" do
    let(:normalizer) { HTTParty::Request::NON_RAILS_QUERY_STRING_NORMALIZER }

    it "doesn't modify strings" 


    context "when the query is an array" do
      it "doesn't include brackets" 


      it "URI encodes array values" 

    end

    context "when the query is a hash" do
      it "correctly handles nil values" 

    end
  end

  describe "::JSON_API_QUERY_STRING_NORMALIZER" do
    let(:normalizer) { HTTParty::Request::JSON_API_QUERY_STRING_NORMALIZER }

    it "doesn't modify strings" 


    context "when the query is an array" do
      it "doesn't include brackets" 


      it "URI encodes array values" 

    end

    context "when the query is a hash" do
      it "correctly handles nil values" 

    end
  end

  describe "initialization" do
    it "sets parser to HTTParty::Parser" 


    it "sets parser to the optional parser" 


    it "sets connection_adapter to HTTPParty::ConnectionAdapter" 


    it "sets connection_adapter to the optional connection_adapter" 


    context "when using a query string" do
      context "and it has an empty array" do
        it "sets correct query string" 

      end

      context "when sending an array with only one element" do
        it "sets correct query" 

      end
    end

    context "when basic authentication credentials provided in uri" do
      context "when basic auth options wasn't set explicitly" do
        it "sets basic auth from uri" 

      end

      context "when basic auth options was set explicitly" do
        it "uses basic auth from url anyway" 

      end
    end
  end

  describe "#format" do
    context "request yet to be made" do
      it "returns format option" 


      it "returns nil format" 

    end

    context "request has been made" do
      it "returns format option" 


      it "returns the content-type from the last response when the option is not set" 

    end
  end

  context "options" do
    it "should use basic auth when configured" 


    context 'digest_auth' do
      before do
        response_sequence = [
          {
            status: ['401', 'Unauthorized' ], headers: {
              www_authenticate: 'Digest realm="Log Viewer", qop="auth", nonce="2CA0EC6B0E126C4800E56BA0C0003D3C", opaque="5ccc069c403ebaf9f0171e9517f40e41", stale=false',
              set_cookie: 'custom-cookie=1234567'
            }
          },
          { status: ['200', 'OK'] }
        ]
        stub_request(:get, 'http://api.foo.com/v1').to_return(response_sequence)
      end

      it 'should not send credentials more than once' 


      it 'should not be used when configured and the response is 200' 


      it "should be used when configured and the response is 401" 


      it 'should maintain cookies returned from a 401 response' 


      it 'should merge cookies from request and a 401 response' 

    end

    it 'should use body_stream when configured' 


    it 'should normalize base uri when specified as request option' 

  end

  describe "#uri" do
    context "redirects" do
      it "returns correct path when the server sets the location header to a filename" 


      context "location header is an absolute path" do
        it "returns correct path when location has leading slash" 


        it "returns the correct path when location has no leading slash" 

      end
      it "returns correct path when the server sets the location header to a full uri" 


      it "returns correct path when the server sets the location header to a network-path reference" 

    end

    context "query strings" do
      it "does not add an empty query string when default_params are blank" 


      it "respects the query string normalization proc" 


      it "does not append an ampersand when queries are embedded in paths" 


      it "does not duplicate query string parameters when uri is called twice" 


      context "when representing an array" do
        it "returns a Rails style query string" 

      end
    end
  end

  describe "#setup_raw_request" do
    context "when query_string_normalizer is set" do
      it "sets the body to the return value of the proc" 

    end

    context "when body is multipart" do
      it "sets header Content-Type: multipart/form-data; boundary=" 


      context "and header Content-Type is provided" do
        it "overwrites the header to: multipart/form-data; boundary=" 

      end
    end
  end

  describe 'http' do
    it "should get a connection from the connection_adapter" 

  end

  describe '#format_from_mimetype' do
    it 'should handle text/xml' 


    it 'should handle application/xml' 


    it 'should handle text/json' 


    it 'should handle application/vnd.api+json' 


    it 'should handle application/hal+json' 


    it 'should handle application/json' 


    it 'should handle text/csv' 


    it 'should handle application/csv' 


    it 'should handle text/comma-separated-values' 


    it 'should handle text/javascript' 


    it 'should handle application/javascript' 


    it "returns nil for an unrecognized mimetype" 


    it "returns nil when using a default parser" 

  end

  describe 'parsing responses' do
    it 'should handle xml automatically' 


    it 'should handle utf-8 bom in xml' 


    it 'should handle csv automatically' 


    it 'should handle json automatically' 


    it 'should handle utf-8 bom in json' 


    it "should include any HTTP headers in the returned response" 


    if "".respond_to?(:encoding)

      let(:response_charset) {
        @request.send(:get_charset)
      }

      it "should process charset in content type properly" 


      it "should process charset in content type properly if it has a different case" 


      it "should process quoted charset in content type properly" 


      it "should process response with a nil body" 


      it "should process utf-16 charset with little endian bom correctly" 


      it "should process utf-16 charset with big endian bom correctly" 


      it "should assume utf-16 little endian if options has been chosen" 


      it "should perform no encoding if the charset is not available" 


      it "should perform no encoding if the content type is specified but no charset is specified" 

    end

    describe 'with non-200 responses' do
      context "3xx responses" do
        it 'returns a valid object for 304 not modified' 


        it "redirects if a 300 contains a location header" 


        it "calls block given to perform with each redirect" 


        it "redirects if a 300 contains a relative location header" 


        it "handles multiple redirects and relative location headers on different hosts" 


        it "raises an error if redirect has duplicate location header" 


        it "returns the HTTParty::Response when the 300 does not contain a location header" 


        it "redirects including port" 

      end

      it 'should return a valid object for 4xx response' 


      it 'should return a valid object for 5xx response' 


      it "parses response lazily so codes can be checked prior" 

    end
  end

  it "should not attempt to parse empty responses" 


  it "should not fail for missing mime type" 


  [300, 301, 302, 305].each do |code|
    describe "a request that #{code} redirects" do
      before(:each) do
        @redirect = stub_response("", code)
        @redirect['location'] = '/foo'

        @ok = stub_response('<hash><foo>bar</foo></hash>', 200)
      end

      describe "once" do
        before(:each) do
          allow(@http).to receive(:request).and_return(@redirect, @ok)
        end

        it "should be handled by GET transparently" 


        it "should be handled by POST transparently" 


        it "should be handled by DELETE transparently" 


        it "should be handled by MOVE transparently" 


        it "should be handled by COPY transparently" 


        it "should be handled by PATCH transparently" 


        it "should be handled by PUT transparently" 


        it "should be handled by HEAD transparently" 


        it "should be handled by OPTIONS transparently" 


        it "should be handled by MKCOL transparently" 


        it "should keep track of cookies between redirects" 


        it 'should update cookies with redirects' 


        it 'should keep cookies between redirects' 


        it "should handle multiple Set-Cookie headers between redirects" 


        it 'should make resulting request a get request if it not already' 


        it 'should not make resulting request a get request if options[:maintain_method_across_redirects] is true' 


        it 'should log the redirection' 

      end

      describe "infinitely" do
        before(:each) do
          allow(@http).to receive(:request).and_return(@redirect)
        end

        it "should raise an exception" 

      end
    end
  end

  describe "a request that 303 redirects" do
    before(:each) do
      @redirect = stub_response("", 303)
      @redirect['location'] = '/foo'

      @ok = stub_response('<hash><foo>bar</foo></hash>', 200)
    end

    describe "once" do
      before(:each) do
        allow(@http).to receive(:request).and_return(@redirect, @ok)
      end

      it "should be handled by GET transparently" 


      it "should be handled by POST transparently" 


      it "should be handled by DELETE transparently" 


      it "should be handled by MOVE transparently" 


      it "should be handled by COPY transparently" 


      it "should be handled by PATCH transparently" 


      it "should be handled by PUT transparently" 


      it "should be handled by HEAD transparently" 


      it "should be handled by OPTIONS transparently" 


      it "should be handled by MKCOL transparently" 


      it "should keep track of cookies between redirects" 


      it 'should update cookies with redirects' 


      it 'should keep cookies between redirects' 


      it "should handle multiple Set-Cookie headers between redirects" 


      it 'should make resulting request a get request if it not already' 


      it 'should make resulting request a get request if options[:maintain_method_across_redirects] is false' 


      it 'should make resulting request a get request if options[:maintain_method_across_redirects] is true but options[:resend_on_redirect] is false' 


      it 'should not make resulting request a get request if options[:maintain_method_across_redirects] and options[:resend_on_redirect] is true' 


      it 'should log the redirection' 

    end

    describe "infinitely" do
      before(:each) do
        allow(@http).to receive(:request).and_return(@redirect)
      end

      it "should raise an exception" 

    end
  end

  describe "a request that returns 304" do
    before(:each) do
      @redirect = stub_response("", 304)
      @redirect['location'] = '/foo'
    end

    before(:each) do
      allow(@http).to receive(:request).and_return(@redirect)
    end

    it "should report 304 with a GET request" 


    it "should report 304 with a POST request" 


    it "should report 304 with a DELETE request" 


    it "should report 304 with a MOVE request" 


    it "should report 304 with a COPY request" 


    it "should report 304 with a PATCH request" 


    it "should report 304 with a PUT request" 


    it "should report 304 with a HEAD request" 


    it "should report 304 with a OPTIONS request" 


    it "should report 304 with a MKCOL request" 


    it 'should not log the redirection' 

  end

  [307, 308].each do |code|
    describe "a request that #{code} redirects" do
      before(:each) do
        @redirect = stub_response("", code)
        @redirect['location'] = '/foo'

        @ok = stub_response('<hash><foo>bar</foo></hash>', 200)
      end

      describe "once" do
        before(:each) do
          allow(@http).to receive(:request).and_return(@redirect, @ok)
        end

        it "should be handled by GET transparently" 


        it "should be handled by POST transparently" 


        it "should be handled by DELETE transparently" 


        it "should be handled by MOVE transparently" 


        it "should be handled by COPY transparently" 


        it "should be handled by PATCH transparently" 


        it "should be handled by PUT transparently" 


        it "should be handled by HEAD transparently" 


        it "should be handled by OPTIONS transparently" 


        it "should be handled by MKCOL transparently" 


        it "should keep track of cookies between redirects" 


        it 'should update cookies with redirects' 


        it 'should keep cookies between redirects' 


        it "should handle multiple Set-Cookie headers between redirects" 


        it 'should maintain method in resulting request' 


        it 'should maintain method in resulting request if options[:maintain_method_across_redirects] is false' 


        it 'should maintain method in resulting request if options[:maintain_method_across_redirects] is true' 


        it 'should log the redirection' 

      end

      describe "infinitely" do
        before(:each) do
          allow(@http).to receive(:request).and_return(@redirect)
        end

        it "should raise an exception" 

      end
    end
  end

  describe "#send_authorization_header?" do
    context "basic_auth" do
      before do
        @credentials = { username: "username", password: "password" }
        @authorization = "Basic dXNlcm5hbWU6cGFzc3dvcmQ="
        @request.options[:basic_auth] = @credentials
        @redirect = stub_response("", 302)
        @ok = stub_response('<hash><foo>bar</foo></hash>', 200)
      end

      before(:each) do
        allow(@http).to receive(:request).and_return(@redirect, @ok)
      end

      it "should not send Authorization header when redirecting to a different host" 


      it "should send Authorization header when redirecting to a relative path" 


      it "should send Authorization header when redirecting to the same host" 


      it "should send Authorization header when redirecting to a different port on the same host" 

    end
  end

  context "with POST http method" do
    it "should raise argument error if query is not a hash" 

  end

  describe "argument validation" do
    it "should raise argument error if basic_auth and digest_auth are both present" 


    it "should raise argument error if basic_auth is not a hash" 


    it "should raise argument error if digest_auth is not a hash" 


    it "should raise argument error if headers is not a hash" 


    it "should raise argument error if options method is not http accepted method" 


    it "should raise argument error if http method is post and query is not hash" 


    it "should raise RedirectionTooDeep error if limit is negative" 

  end

  context 'with Accept-Encoding header' do
    it 'should disable content decoding if present' 


    it 'should disable content decoding if present and lowercase' 


    it 'should disable content decoding if present' 

  end
end

