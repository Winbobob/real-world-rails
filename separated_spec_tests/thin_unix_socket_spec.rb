require 'spec_helper'

describe Server, "on UNIX domain socket" do
  before do
    start_server('/tmp/thin_test.sock') do |env|
      [200, { 'Content-Type' => 'text/html' }, [env.inspect]]
    end
  end
  
  it "should accept GET request" 

  
  it "should retreive remote address" do    
    get('/').should include('"REMOTE_ADDR"=>"127.0.0.1"')
  end
  
  it "should remove socket file after server stops" 

  
  after do
    stop_server
  end
end

