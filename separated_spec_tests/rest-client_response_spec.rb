require_relative '_lib'

describe RestClient::Response, :include_helpers do
  before do
    @net_http_res = res_double(to_hash: {'Status' => ['200 OK']}, code: '200', body: 'abc')
    @example_url = 'http://example.com'
    @request = request_double(url: @example_url, method: 'get')
    @response = response_from_res_double(@net_http_res, @request, duration: 1)
  end

  it "behaves like string" 


  it "accepts nil strings and sets it to empty for the case of HEAD" 


  describe 'header processing' do
    it "test headers and raw headers" 


    it 'handles multiple headers by joining with comma' 

  end

  describe "cookie processing" do
    it "should correctly deal with one Set-Cookie header with one cookie inside" 


    it "should correctly deal with multiple cookies [multiple Set-Cookie headers]" 


    it "should correctly deal with multiple cookies [one Set-Cookie header with multiple cookies]" 

  end

  describe "exceptions processing" do
    it "should return itself for normal codes" 


    it "should throw an exception for other codes" 


  end

  describe "redirection" do

    it "follows a redirection when the request is a get" 


    it "keeps redirection history" 


    it "follows a redirection and keep the parameters" 


    it "follows a redirection and keep the cookies" 


    it 'respects cookie domains on redirect' 


    it "doesn't follow a 301 when the request is a post" 


    it "doesn't follow a 302 when the request is a post" 


    it "doesn't follow a 307 when the request is a post" 


    it "doesn't follow a redirection when the request is a put" 


    it "follows a redirection when the request is a post and result is a 303" 


    it "follows a redirection when the request is a head" 


    it "handles redirects with relative paths" 


    it "handles redirects with relative path and query string" 


    it "follow a redirection when the request is a get and the response is in the 30x range" 


    it "follows no more than 10 redirections before raising error" 


    it "follows no more than max_redirects redirections, if specified" 


    it "allows for manual following of redirects" 

  end

  describe "logging" do
    it "uses the request's logger" 

  end
end

