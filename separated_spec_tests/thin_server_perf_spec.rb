require 'spec_helper'

describe Server, 'performance' do
  before do
    start_server do |env|
      body = env.inspect + env['rack.input'].read
      [200, { 'Content-Length' => body.size.to_s }, body]
    end
  end
  
  it "should handle GET in less then #{get_request_time = 0.0045} RubySecond" 

  
  it "should handle POST in less then #{post_request_time = 0.007} RubySecond" 

  
  after do
    stop_server
  end
end

describe Server, 'UNIX socket performance' do
  before do
    start_server('/tmp/thin_test.sock') do |env|
      body = env.inspect + env['rack.input'].read
      [200, { 'Content-Length' => body.size.to_s }, body]
    end
  end
  
  it "should handle GET in less then #{get_request_time = 0.002} RubySecond" 

  
  after do
    stop_server
  end
end

