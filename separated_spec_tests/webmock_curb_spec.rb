require 'spec_helper'
require 'acceptance/webmock_shared'

unless RUBY_PLATFORM =~ /java/
  require 'acceptance/curb/curb_spec_helper'

  shared_examples_for "Curb" do
    include CurbSpecHelper

    include_examples "with WebMock"

    describe "when doing PUTs" do
      it "should stub them" 

    end
  end

  describe "Curb features" do
    before(:each) do
      WebMock.disable_net_connect!
      WebMock.reset!
    end

    describe "callbacks" do
      before(:each) do
        @curl = Curl::Easy.new
        @curl.url = "http://example.com"
      end

      describe 'on_debug' do
        it "should call on_debug" 

      end

      it "should call on_success with 2xx response" 


      it "should call on_missing with 4xx response" 


      it "should call on_failure with 5xx response" 


      it "should call on_body when response body is read" 


      it "should call on_body for each chunk with chunked response" 


      it "should call on_header when response headers are read" 


      it "should call on_complete when request is complete" 


      it "should call on_progress when portion of response body is read" 


      it "should call callbacks in correct order on successful request" 


      it "should call callbacks in correct order on failed request" 


      it "should call callbacks in correct order on missing request" 

    end

    describe '#last_effective_url' do
      before(:each) do
        @curl = Curl::Easy.new
        @curl.url = "http://example.com"
      end

      context 'when not following redirects' do
        before { @curl.follow_location = false }

        it 'should be the same as #url even with a location header' 

      end

      context 'when following redirects' do
        before { @curl.follow_location = true }

        it 'should be the same as #url when no location header is present' 


        it 'should be the value of the location header when present' 


        it 'should work with more than one redirect' 


        it 'should maintain the original url' 


        it 'should have the redirected-to attrs (body, response code)' 


        it 'should follow more than one redirect' 

      end
    end

    describe "#content_type" do
      before(:each) do
        @curl = Curl::Easy.new
        @curl.url = "http://example.com"
      end

      context "when response includes Content-Type header" do
        it "returns correct content_type" 

      end

      context "when response does not include Content-Type header" do
        it "returns nil for content_type" 

      end
    end

    describe "#chunked_response?" do
      before(:each) do
        @curl = Curl::Easy.new
        @curl.url = "http://example.com"
      end

      it "is true when Transfer-Encoding is 'chunked' and body responds to each" 


      it "is false when Transfer-Encoding is not 'chunked'" 


      it "is false when Transfer-Encoding is 'chunked' but body does not respond to each" 

    end
  end

  describe "Webmock with Curb" do
    describe "using #http for requests" do
      it_should_behave_like "Curb"
      include CurbSpecHelper::DynamicHttp

      it "should work with uppercase arguments" 


      it "should alias body to body_str" 


      it "supports array headers passed to Curl::Easy" 


      describe 'match request body' do
        it 'for post' 


        it 'for patch' 


        it 'for put' 

      end
    end

    describe "using #http_* methods for requests" do
      it_should_behave_like "Curb"
      include CurbSpecHelper::NamedHttp

      it "should work with blank arguments for post" 


      it "should work with several body arguments for post using the class method" 


      it "should work with blank arguments for put" 


      it "should work with multiple arguments for post" 


    end

    describe "using #perform for requests" do
      it_should_behave_like "Curb"
      include CurbSpecHelper::Perform
    end

    describe "using .http_* methods for requests" do
      it_should_behave_like "Curb"
      include CurbSpecHelper::ClassNamedHttp
    end

    describe "using .perform for requests" do
      it_should_behave_like "Curb"
      include CurbSpecHelper::ClassPerform
    end

    describe "using .reset" do
      before do
        @curl = Curl::Easy.new
        @curl.url = "http://example.com"
        body = "on_success fired"
        stub_request(:any, "example.com").to_return(body: body)
        @curl.http_get
      end

      it "should clear the body_str" 

    end
  end
end

