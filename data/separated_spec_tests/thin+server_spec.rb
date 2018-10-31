require 'spec_helper'

describe Server do
  before do
    @server = Server.new('0.0.0.0', 3000)
  end
  
  it "should set maximum_connections size" 


  it "should set lower maximum_connections size when too large" 

  
  it "should default to non-threaded" 

  
  it "should set backend to threaded" 


  it "should set the threadpool" 

end

describe Server, "initialization" do
  it "should set host and port" 


  it "should set socket" 

  
  it "should set host, port and app" 


  it "should set socket and app" 


  it "should set socket, nil and app" 

  
  it "should set host, port and backend" 


  it "should set host, port, app and backend" 

  
  it "should set port as string" 

  
  it "should not register signals w/ :signals => false" 

end

