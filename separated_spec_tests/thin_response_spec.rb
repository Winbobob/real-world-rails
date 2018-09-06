require 'spec_helper'

describe Response do
  before do
    @response = Response.new
    @response.headers['Content-Type'] = 'text/html'
    @response.headers['Content-Length'] = '0'
    @response.body = ''
  end
  
  it 'should output headers' 

  
  it 'should include server name header' 

  
  it 'should output head' 

  
  it 'should allow duplicates in headers' 

  
  it 'should parse simple header values' 

  
  it 'should parse multiline header values in several headers' 


  it 'should ignore nil headers' 

  
  it 'should output body' 

    
  it 'should output String body' 

    
  it "should not be persistent by default" 

  
  it "should not be persistent when no Content-Length" 


  it "should ignore Content-Length case" 


  it "should be persistent when the status code implies it should stay open" 

  
  it "should be persistent when specified" 

  
  it "should be closeable" 

end

