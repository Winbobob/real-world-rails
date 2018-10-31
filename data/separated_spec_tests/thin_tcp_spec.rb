require 'spec_helper'

describe Server, 'on TCP socket' do
  before do
    start_server do |env|
      body = env.inspect + env['rack.input'].read
      [200, { 'Content-Type' => 'text/html' }, body]
    end
  end
  
  it 'should GET from Net::HTTP' 

  
  it 'should GET from TCPSocket' 

  
  it 'should return empty string on incomplete headers' 

  
  it 'should return empty string on incorrect Content-Length' 

  
  it 'should POST from Net::HTTP' 

  
  it 'should handle big POST' 

  
  it "should retreive remote address" 

  
  after do
    stop_server
  end
end

