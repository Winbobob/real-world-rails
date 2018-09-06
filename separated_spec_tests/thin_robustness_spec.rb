require 'spec_helper'

describe Server, 'robustness' do
  before do
    start_server do |env|
      body = 'hello!'
      [200, { 'Content-Type' => 'text/html' }, body]
    end
  end
  
  it "should not crash when header too large" 

  
  after do
    stop_server
  end
end

