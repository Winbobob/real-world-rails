require 'spec_helper'

describe Backends::UnixServer do
  before do
    @backend = Backends::UnixServer.new('/tmp/thin-test.sock')
  end
  
  it "should connect" 

  
  it "should disconnect" 

  
  it "should remove socket file on close" 

end

describe UnixConnection do
  before do
    @connection = UnixConnection.new(nil)
  end
  
  it "should return 127.0.0.1 as remote_address" 

end

