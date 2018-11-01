require 'spec_helper'

RSpec.describe HTTParty::Response do
  before do
    @last_modified = Date.new(2010, 1, 15).to_s
    @content_length = '1024'
    @request_object = HTTParty::Request.new Net::HTTP::Get, '/'
    @response_object = Net::HTTPOK.new('1.1', 200, 'OK')
    allow(@response_object).to receive_messages(body: "{foo:'bar'}")
    @response_object['last-modified'] = @last_modified
    @response_object['content-length'] = @content_length
    @parsed_response = lambda { {"foo" => "bar"} }
    @response = HTTParty::Response.new(@request_object, @response_object, @parsed_response)
  end

  describe ".underscore" do
    it "works with one capitalized word" 


    it "works with titlecase" 


    it "works with all caps" 

  end

  describe "initialization" do
    it "should set the Net::HTTP Response" 


    it "should set body" 


    it "should set code" 


    it "should set code as an Integer" 


    context 'when raise_on is supplied' do
      let(:request) { HTTParty::Request.new(Net::HTTP::Get, '/', raise_on: [404]) }

      context "and response's status code is in range" do
        let(:body)     { 'Not Found' }
        let(:response) { Net::HTTPNotFound.new('1.1', 404, body) }

        before do
          allow(response).to receive(:body).and_return(body)
        end

        subject { described_class.new(request, response, @parsed_response) }

        it 'throws exception' 

      end

      context "and response's status code is not in range" do
        subject { described_class.new(request, @response_object, @parsed_response) }

        it 'does not throw exception' 

      end
    end
  end

  it 'does raise an error about itself when using #method' 


  it 'does raise an error about itself when invoking a method that does not exist' 


  it "returns response headers" 


  it "should send missing methods to delegate" 


  it "response to request" 


  it "responds to response" 


  it "responds to body" 


  it "responds to headers" 


  it "responds to parsed_response" 


  it "responds to predicates" 


  it "responds to anything parsed_response responds to" 


  context 'response is array' do
    let(:response_value) { [{'foo' => 'bar'}, {'foo' => 'baz'}] }
    let(:response) { HTTParty::Response.new(@request_object, @response_object, lambda { response_value }) }
    it "should be able to iterate" 


    it 'should respond to array methods' 


    it 'should equal the string response object body' 


    it 'should display the same as an array' 

  end

  it "allows headers to be accessed by mixed-case names in hash notation" 


  it "returns a comma-delimited value when multiple values exist" 


  # Backwards-compatibility - previously, #headers returned a Hash
  it "responds to hash methods" 


  describe "#is_a?" do
    subject { HTTParty::Response.new(@request_object, @response_object, @parsed_response) }

    it { is_expected.to respond_to(:is_a?).with(1).arguments }
    it { expect(subject.is_a?(HTTParty::Response)).to be_truthy }
    it { expect(subject.is_a?(Object)).to be_truthy }
  end

  describe "#kind_of?" do
    subject { HTTParty::Response.new(@request_object, @response_object, @parsed_response) }

    it { is_expected.to respond_to(:kind_of?).with(1).arguments }
    it { expect(subject.kind_of?(HTTParty::Response)).to be_truthy }
    it { expect(subject.kind_of?(Object)).to be_truthy }
  end

  describe "semantic methods for response codes" do
    def response_mock(klass)
      response = klass.new('', '', '')
      allow(response).to receive(:body)
      response
    end

    context "major codes" do
      it "is information" 


      it "is success" 


      it "is redirection" 


      it "is client error" 


      it "is server error" 

    end

    context "for specific codes" do
      SPECIFIC_CODES = {
        accepted?:                        Net::HTTPAccepted,
        bad_gateway?:                     Net::HTTPBadGateway,
        bad_request?:                     Net::HTTPBadRequest,
        conflict?:                        Net::HTTPConflict,
        continue?:                        Net::HTTPContinue,
        created?:                         Net::HTTPCreated,
        expectation_failed?:              Net::HTTPExpectationFailed,
        forbidden?:                       Net::HTTPForbidden,
        found?:                           Net::HTTPFound,
        gateway_time_out?:                Net::HTTPGatewayTimeOut,
        gone?:                            Net::HTTPGone,
        internal_server_error?:           Net::HTTPInternalServerError,
        length_required?:                 Net::HTTPLengthRequired,
        method_not_allowed?:              Net::HTTPMethodNotAllowed,
        moved_permanently?:               Net::HTTPMovedPermanently,
        multiple_choice?:                 Net::HTTPMultipleChoice,
        no_content?:                      Net::HTTPNoContent,
        non_authoritative_information?:   Net::HTTPNonAuthoritativeInformation,
        not_acceptable?:                  Net::HTTPNotAcceptable,
        not_found?:                       Net::HTTPNotFound,
        not_implemented?:                 Net::HTTPNotImplemented,
        not_modified?:                    Net::HTTPNotModified,
        ok?:                              Net::HTTPOK,
        partial_content?:                 Net::HTTPPartialContent,
        payment_required?:                Net::HTTPPaymentRequired,
        precondition_failed?:             Net::HTTPPreconditionFailed,
        proxy_authentication_required?:   Net::HTTPProxyAuthenticationRequired,
        request_entity_too_large?:        Net::HTTPRequestEntityTooLarge,
        request_time_out?:                Net::HTTPRequestTimeOut,
        request_uri_too_long?:            Net::HTTPRequestURITooLong,
        requested_range_not_satisfiable?: Net::HTTPRequestedRangeNotSatisfiable,
        reset_content?:                   Net::HTTPResetContent,
        see_other?:                       Net::HTTPSeeOther,
        service_unavailable?:             Net::HTTPServiceUnavailable,
        switch_protocol?:                 Net::HTTPSwitchProtocol,
        temporary_redirect?:              Net::HTTPTemporaryRedirect,
        unauthorized?:                    Net::HTTPUnauthorized,
        unsupported_media_type?:          Net::HTTPUnsupportedMediaType,
        use_proxy?:                       Net::HTTPUseProxy,
        version_not_supported?:           Net::HTTPVersionNotSupported
      }

      # Ruby 2.0, new name for this response.
      if RUBY_VERSION >= "2.0.0" && ::RUBY_PLATFORM != "java"
        SPECIFIC_CODES[:multiple_choices?] = Net::HTTPMultipleChoices
      end

      SPECIFIC_CODES.each do |method, klass|
        it "responds to #{method}" 

      end
    end
  end

  describe "headers" do
    let (:empty_headers) { HTTParty::Response::Headers.new }
    let (:some_headers_hash) do
      {'Cookie' => 'bob',
      'Content-Encoding' => 'meow'}
    end
    let (:some_headers) do
      HTTParty::Response::Headers.new.tap do |h|
        some_headers_hash.each_pair do |k,v|
          h[k] = v
        end
      end
    end
    it "can initialize without headers" 


    it 'always equals itself' 


    it 'does not equal itself when not equivalent' 


    it 'does equal a hash' 

  end

  describe "#tap" do
    it "is possible to tap into a response" 

  end

  describe "#inspect" do
    it "works" 

  end
end

