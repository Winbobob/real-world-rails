require 'spec_helper'

describe Server, "stopping" do
  before do
    start_server do |env|
      [200, { 'Content-Type' => 'text/html' }, ['ok']]
    end
    @done = false
  end
  
  it "should wait for current requests before soft stopping" 

  
  it "should not accept new requests when soft stopping" 

  
  it "should drop current requests when hard stopping" 

  
  after do
    stop_server
  end
end

