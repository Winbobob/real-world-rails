require 'spec_helper'

describe Backends::SwiftiplyClient do
  before do
    @backend = Backends::SwiftiplyClient.new('0.0.0.0', 3333)
    @backend.server = mock('server').as_null_object
  end
  
  it "should connect" 

  
  it "should disconnect" 

end

describe SwiftiplyConnection do
  before do
    @connection = SwiftiplyConnection.new(nil)
    @connection.backend = Backends::SwiftiplyClient.new('0.0.0.0', 3333)
    @connection.backend.server = mock('server').as_null_object
  end
  
  it do
    @connection.should be_persistent
  end
  
  it "should send handshake on connection_completed" 

  
  it "should reconnect on unbind" 

  
  it "should not reconnect when not running" 

  
  it "should have a host_ip" 

  
  it "should generate swiftiply_handshake based on key" 

end

