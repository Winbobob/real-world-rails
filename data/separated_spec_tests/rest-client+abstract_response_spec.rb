require_relative '_lib'

describe RestClient::AbstractResponse, :include_helpers do

  # Sample class implementing AbstractResponse used for testing.
  class MyAbstractResponse

    include RestClient::AbstractResponse

    attr_accessor :size

    def initialize(net_http_res, request)
      response_set_vars(net_http_res, request, Time.now - 1)
    end

  end

  before do
    @net_http_res = res_double()
    @request = request_double(url: 'http://example.com', method: 'get')
    @response = MyAbstractResponse.new(@net_http_res, @request)
  end

  it "fetches the numeric response code" 


  it "has a nice description" 


  describe '.beautify_headers' do
    it "beautifies the headers by turning the keys to symbols" 


    it "beautifies the headers by turning the values to strings instead of one-element arrays" 


    it 'joins multiple header values by comma' 


    it 'leaves set-cookie headers as array' 

  end

  it "fetches the headers" 


  it "extracts cookies from response headers" 


  it "extract strange cookies" 


  it "doesn't escape cookies" 


  describe '.cookie_jar' do
    it 'extracts cookies into cookie jar' 


    it 'handles cookies when URI scheme is implicit' 

  end

  it "can access the net http result directly" 


  describe "#return!" do
    it "should return the response itself on 200-codes" 


    it "should raise RequestFailed on unknown codes" 


    it "should raise an error on a redirection after non-GET/HEAD requests" 


    it "should follow 302 redirect" 


    it "should gracefully handle 302 redirect with no location header" 

  end
end

