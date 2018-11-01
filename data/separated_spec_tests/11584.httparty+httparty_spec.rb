RSpec.describe HTTParty do
  before(:each) do
    @klass = Class.new
    @klass.instance_eval { include HTTParty }
  end

  describe "pem" do
    it 'should set the pem content' 


    it "should set the password to nil if it's not provided" 


    it 'should set the password' 

  end

  describe "pkcs12" do
    it 'should set the p12 content' 


    it 'should set the password' 

  end

  describe 'ssl_version' do
    it 'should set the ssl_version content' 

  end

  describe 'ciphers' do
    it 'should set the ciphers content' 

  end

  describe 'http_proxy' do
    it 'should set the address' 


    it 'should set the proxy user and pass when they are provided' 

  end

  describe "base uri" do
    before(:each) do
      @klass.base_uri('api.foo.com/v1')
    end

    it "should have reader" 


    it 'should have writer' 


    it 'should not modify the parameter during assignment' 

  end

  describe ".disable_rails_query_string_format" do
    it "sets the query string normalizer to HTTParty::Request::NON_RAILS_QUERY_STRING_NORMALIZER" 

  end

  describe ".normalize_base_uri" do
    it "should add http if not present for non ssl requests" 


    it "should add https if not present for ssl requests" 


    it "should not remove https for ssl requests" 


    it 'should not modify the parameter' 


    it "should not treat uri's with a port of 4430 as ssl" 

  end

  describe "headers" do
    def expect_headers(header = {})
      expect(HTTParty::Request).to receive(:new) \
        .with(anything, anything, hash_including({ headers: header })) \
        .and_return(double("mock response", perform: nil))
    end

    it "does not modify default_options when no arguments are passed" 


    it "should default to empty hash" 


    it "should be able to be updated" 


    it "should be able to accept block as header value" 


    it "uses the class headers when sending a request" 


    it "merges class headers with request headers" 


    it 'overrides class headers with request headers' 


    context "with cookies" do
      it 'utilizes the class-level cookies' 


      it 'adds cookies to the headers' 


      it 'doesnt modify default headers' 


      it 'adds optional cookies to the optional headers' 

    end

    context 'when posting file' do
      let(:boundary) { '------------------------c772861a5109d5ef' }
      let(:headers) do
        { 'Content-Type'=>"multipart/form-data; boundary=#{boundary}" }
      end

      before do
        expect(HTTParty::Request::MultipartBoundary).to receive(:generate).and_return(boundary)
      end

      it 'changes content-type headers to multipart/form-data' 

    end
  end

  describe "cookies" do
    def expect_cookie_header(s)
      expect(HTTParty::Request).to receive(:new) \
        .with(anything, anything, hash_including({ headers: { "cookie" => s } })) \
        .and_return(double("mock response", perform: nil))
    end

    it "should not be in the headers by default" 


    it "should raise an ArgumentError if passed a non-Hash" 


    it "should allow a cookie to be specified with a one-off request" 


    describe "when a cookie is set at the class level" do
      before(:each) do
        @klass.cookies({ type: "snickerdoodle" })
      end

      it "should include that cookie in the request" 


      it "should pass the proper cookies when requested multiple times" 


      it "should allow the class defaults to be overridden" 

    end

    describe "in a class with multiple methods that use different cookies" do
      before(:each) do
        @klass.instance_eval do
          def first_method
            get("first_method", cookies: { first_method_cookie: "foo" })
          end

          def second_method
            get("second_method", cookies: { second_method_cookie: "foo" })
          end
        end
      end

      it "should not allow cookies used in one method to carry over into other methods" 

    end
  end

  describe "default params" do
    it "should default to empty hash" 


    it "should be able to be updated" 

  end

  describe "default timeout" do
    it "should default to nil" 


    it "should support updating" 


    it "should support floats" 

  end

  describe "debug_output" do
    it "stores the given stream as a default_option" 


    it "stores the $stderr stream by default" 

  end

  describe "basic http authentication" do
    it "should work" 

  end

  describe "digest http authentication" do
    it "should work" 

  end

  describe "parser" do
    class CustomParser
      def self.parse(body)
        {sexy: true}
      end
    end

    let(:parser) do
      proc { |data, format| CustomParser.parse(data) }
    end

    it "should set parser options" 


    it "should be able parse response with custom parser" 


    it "raises UnsupportedFormat when the parser cannot handle the format" 


    it 'does not validate format whe custom parser is a proc' 

  end

  describe "uri_adapter" do

    require 'forwardable'
    class CustomURIAdaptor
      extend Forwardable
      def_delegators :@uri, :userinfo, :relative?, :query, :query=, :scheme, :path, :host, :port

      def initialize uri
        @uri = uri
      end

      def self.parse uri
        new URI.parse uri
      end
    end

    let(:uri_adapter) { CustomURIAdaptor }

    it "should set the uri_adapter" 


    it "should raise an ArgumentError if uri_adapter doesn't implement parse method" 



    it "should process a request with a uri instance parsed from the uri_adapter" 


  end

  describe "connection_adapter" do
    let(:uri) { 'http://google.com/api.json' }
    let(:connection_adapter) { double('CustomConnectionAdapter') }

    it "should set the connection_adapter" 


    it "should set the connection_adapter_options when provided" 


    it "should not set the connection_adapter_options when not provided" 


    it "should process a request with a connection from the adapter" 

  end

  describe "format" do
    it "should allow xml" 


    it "should allow csv" 


    it "should allow json" 


    it "should allow plain" 


    it 'should not allow funky format' 


    it 'should only print each format once with an exception' 


    it 'sets the default parser' 


    it 'does not reset parser to the default parser' 

  end

  describe "#no_follow" do
    it "sets no_follow to false by default" 


    it "sets the no_follow option to true" 

  end

  describe "#maintain_method_across_redirects" do
    it "sets maintain_method_across_redirects to true by default" 


    it "sets the maintain_method_across_redirects option to false" 

  end

  describe "#resend_on_redirect" do
    it "sets resend_on_redirect to true by default" 


    it "sets resend_on_redirect option to false" 

  end

  describe ".follow_redirects" do
    it "sets follow redirects to true by default" 


    it "sets the follow_redirects option to false" 

  end

  describe ".query_string_normalizer" do
    it "sets the query_string_normalizer option" 

  end

  describe ".raise_on" do
    context 'when parameters is an array' do
      it 'sets raise_on option' 

    end

    context 'when parameters is a fixnum' do
      it 'sets raise_on option' 

    end
  end

  describe "with explicit override of automatic redirect handling" do
    before do
      @request = HTTParty::Request.new(Net::HTTP::Get, 'http://api.foo.com/v1', format: :xml, no_follow: true)
      @redirect = stub_response 'first redirect', 302
      @redirect['location'] = 'http://foo.com/bar'
      allow(HTTParty::Request).to receive_messages(new: @request)
    end

    it "should fail with redirected GET" 


    it "should fail with redirected POST" 


    it "should fail with redirected PATCH" 


    it "should fail with redirected DELETE" 


    it "should fail with redirected MOVE" 


    it "should fail with redirected COPY" 


    it "should fail with redirected PUT" 


    it "should fail with redirected HEAD" 


    it "should fail with redirected OPTIONS" 


    it "should fail with redirected MKCOL" 

  end

  describe "head requests should follow redirects requesting HEAD only" do
    before do
      allow(HTTParty::Request).to receive(:new).
        and_return(double("mock response", perform: nil))
    end

    it "should remain HEAD request across redirects, unless specified otherwise" 


  end

  describe "#ensure_method_maintained_across_redirects" do
    it "should set maintain_method_across_redirects option if unspecified" 


    it "should not set maintain_method_across_redirects option if value is present" 

  end

  describe "with multiple class definitions" do
    before(:each) do
      @klass.instance_eval do
        base_uri "http://first.com"
        default_params one: 1
      end

      @additional_klass = Class.new
      @additional_klass.instance_eval do
        include HTTParty
        base_uri "http://second.com"
        default_params two: 2
      end
    end

    it "should not run over each others options" 

  end

  describe "two child classes inheriting from one parent" do
    before(:each) do
      @parent = Class.new do
        include HTTParty
        def self.name
          "Parent"
        end
      end

      @child1 = Class.new(@parent)
      @child2 = Class.new(@parent)
    end

    it "does not modify each others inherited attributes" 


    it "inherits default_options from the superclass" 


    it "doesn't modify the parent's default options" 


    it "doesn't modify hashes in the parent's default options" 


    it "works with lambda values" 


    it 'should dup the proc on the child class' 


    it "inherits default_cookies from the parent class" 


    it "doesn't modify the parent's default cookies" 

  end

  describe "grand parent with inherited callback" do
    before do
      @grand_parent = Class.new do
        def self.inherited(subclass)
          subclass.instance_variable_set(:@grand_parent, true)
        end
      end
      @parent = Class.new(@grand_parent) do
        include HTTParty
      end
    end
    it "continues running the #inherited on the parent" 

  end

  describe "#get" do
    it "should be able to get html" 


    it "should be able to get chunked html" 


    it "should return an empty body if stream_body option is turned on" 


    it "should be able parse response type json automatically" 


    it "should be able parse response type xml automatically" 


    it "should be able parse response type csv automatically" 


    it "should not get undefined method add_node for nil class for the following xml" 


    it "should parse empty response fine" 


    it "should accept http URIs" 


    it "should accept https URIs" 


    it "should accept webcal URIs" 


    it "should raise an InvalidURIError on URIs that can't be parsed at all" 

  end
end

