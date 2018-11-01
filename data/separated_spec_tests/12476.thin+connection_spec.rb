require 'spec_helper'

describe Connection do
  before do
    EventMachine.stub(:send_data)
    @connection = Connection.new(mock('EM').as_null_object)
    @connection.post_init
    @connection.backend = mock("backend", :ssl? => false)
    @connection.app = proc do |env|
      [200, {}, ['body']]
    end
  end
  
  it "should parse on receive_data" 


  it "should make a valid response on bad request" 


  it "should close connection on InvalidRequest error in receive_data" 


  it "should process when parsing complete" 


  it "should process" 


  it "should rescue error in process" 


  it "should make response on error" 


  it "should not close persistent connection on error" 


  it "should rescue Timeout error in process" 

  
  it "should not return HTTP_X_FORWARDED_FOR as remote_address" 

  
  it "should return nil on error retreiving remote_address" 

  
  it "should return nil on nil get_peername" 

  
  it "should return nil on empty get_peername" 

  
  it "should return remote_address" 

  
  it "should not be persistent" 


  it "should be persistent when response is and allowed" 


  it "should not be persistent when response is but not allowed" 

  
  it "should return empty body on HEAD request" 

  
  it "should set request env as rack.multithread" 

  
  it "should set as threaded when app.deferred? is true" 

  
  it "should not set as threaded when app.deferred? is false" 


  it "should not set as threaded when app do not respond to deferred?" 

end

