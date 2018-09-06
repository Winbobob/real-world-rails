require_relative '_lib'

describe RestClient::RawResponse do
  before do
    @tf = double("Tempfile", :read => "the answer is 42", :open => true, :rewind => true)
    @net_http_res = double('net http response')
    @request = double('restclient request', :redirection_history => nil)
    @response = RestClient::RawResponse.new(@tf, @net_http_res, @request)
  end

  it "behaves like string" 


  it "exposes a Tempfile" 


  it "includes AbstractResponse" 

end

