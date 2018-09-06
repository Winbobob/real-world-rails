require 'spec_helper'

if SWIFTIPLY_PATH.empty?
  warn "Ignoring Server on Swiftiply specs, gem install swiftiply to run"
else
  describe Server, 'on Swiftiply' do
    before do
      @swiftiply = fork do
        exec "#{SWIFTIPLY_PATH} -c #{File.dirname(__FILE__)}/swiftiply.yml"
      end
      wait_for_socket('0.0.0.0', 3333)
      sleep 2 # HACK ooh boy, I wish I knew how to make those specs more stable...
      start_server('0.0.0.0', 5555, :backend => Backends::SwiftiplyClient, :wait_for_socket => false) do |env|
        body = env.inspect + env['rack.input'].read
        [200, { 'Content-Type' => 'text/html' }, body]
      end
    end
    
    it 'should GET from Net::HTTP' 

  
    it 'should POST from Net::HTTP' 

  
    after do
      stop_server
      Process.kill(9, @swiftiply)
    end
  end
end

