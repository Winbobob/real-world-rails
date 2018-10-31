require 'spec_helper'

class TestServer
  include Logging # Daemonizable should include this?
  include Daemonizable
  
  def stop
  end
  
  def name
    'Thin test server'
  end
end

describe 'Daemonizing' do
  before :all do
    @logfile = File.dirname(__FILE__) + '/../log/daemonizing_test.log'
    @pidfile = 'test.pid'
    File.delete(@logfile) if File.exist?(@logfile)
    File.delete(@pidfile) if File.exist?(@pidfile)
  end
  
  before :each do
    @server = TestServer.new
    @server.log_file = @logfile
    @server.pid_file = @pidfile
    @pid = nil
  end
  
  it 'should have a pid file' 

  
  it 'should create a pid file' 

  
  it 'should redirect stdio to a log file' 

  
  it 'should change privilege' 

  
  it 'should kill process in pid file' 

  
  it 'should force kill process in pid file' 

  
  it 'should send kill signal if timeout' 

  
  it "should restart" 

  
  it "should ignore if no restart block specified" 

  
  it "should not restart when not running" 

  
  it "should exit and raise if pid file already exist" 

  
  it "should raise if no pid file" 

  
  it "should should delete pid file if stale" 

  
  after do
    Process.kill(9, @pid.to_i) if @pid && Process.running?(@pid.to_i)
    Process.kill(9, @server.pid) if @server.pid && Process.running?(@server.pid)
    File.delete(@server.pid_file) rescue nil
  end
  
  private
    def server_should_start_in_less_then(sec=10)
      proc { sleep 0.1 until File.exist?(@server.pid_file) }.should take_less_then(10)
    end
end

