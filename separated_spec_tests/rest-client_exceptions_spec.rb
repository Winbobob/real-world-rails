require_relative '_lib'

describe RestClient::Exception do
  it "returns a 'message' equal to the class name if the message is not set, because 'message' should not be nil" 


  it "returns the 'message' that was set" 


  it "sets the exception message to ErrorMessage" 


  it "contains exceptions in RestClient" 

end

describe RestClient::ServerBrokeConnection do
  it "should have a default message of 'Server broke connection'" 

end

describe RestClient::RequestFailed do
  before do
    @response = double('HTTP Response', :code => '502')
  end

  it "stores the http response on the exception" 


  it "http_code convenience method for fetching the code as an integer" 


  it "http_body convenience method for fetching the body (decoding when necessary)" 


  it "shows the status code in the message" 

end

describe RestClient::ResourceNotFound do
  it "also has the http response attached" 


  it 'stores the body on the response of the exception' 

end

describe "backwards compatibility" do
  it 'aliases RestClient::NotFound as ResourceNotFound' 


  it 'aliases old names for HTTP 413, 414, 416' 


  it 'subclasses NotFound from RequestFailed, ExceptionWithResponse' 


  it 'subclasses timeout from RestClient::RequestTimeout, RequestFailed, EWR' 


end

