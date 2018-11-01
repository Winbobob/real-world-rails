require 'spec_helper'
include Controllers

describe Cluster, "with host and port" do
  before do
    @cluster = Cluster.new(:chdir => '/rails_app',
                           :address => '0.0.0.0',
                           :port => 3000, 
                           :servers => 3,
                           :timeout => 10,
                           :log => 'thin.log',
                           :pid => 'thin.pid'
                          )
  end
    
  it 'should include port number in file names' 

  
  it 'should call each server' 

    
  it 'should start on each port' 


  it 'should stop on each port' 

  
  private
    def options_for_port(port)
      { :daemonize => true, :log => "thin.#{port}.log", :timeout => 10, :address => "0.0.0.0", :port => port, :pid => "thin.#{port}.pid", :chdir => "/rails_app" }
    end
end

describe Cluster, "with UNIX socket" do
  before do
    @cluster = Cluster.new(:chdir => '/rails_app',
                           :socket => '/tmp/thin.sock',
                           :address => '0.0.0.0',
                           :port => 3000,
                           :servers => 3,
                           :timeout => 10,
                           :log => 'thin.log',
                           :pid => 'thin.pid'
                          )
  end
  
  it 'should include socket number in file names' 

  
  it "should exclude :address and :port options" 

  
  it 'should call each server' 

  
  it 'should start each server' 


  it 'should stop each server' 

  
  
  private
    def options_for_socket(number)
      { :daemonize => true, :log => "thin.#{number}.log", :timeout => 10, :socket => "/tmp/thin.#{number}.sock", :pid => "thin.#{number}.pid", :chdir => "/rails_app" }
    end
end

describe Cluster, "controlling only one server" do
  before do
    @cluster = Cluster.new(:chdir => '/rails_app',
                           :address => '0.0.0.0',
                           :port => 3000, 
                           :servers => 3,
                           :timeout => 10,
                           :log => 'thin.log',
                           :pid => 'thin.pid',
                           :only => 3001
                          )
  end
  
  it 'should call only specified server' 

  
  it "should start only specified server" 

  
  private
    def options_for_port(port)
      { :daemonize => true, :log => "thin.#{port}.log", :timeout => 10, :address => "0.0.0.0", :port => port, :pid => "thin.#{port}.pid", :chdir => "/rails_app" }
    end
end

describe Cluster, "controlling only one server with UNIX socket" do
  before do
    @cluster = Cluster.new(:chdir => '/rails_app',
                           :socket => '/tmp/thin.sock',
                           :address => '0.0.0.0',
                           :port => 3000,
                           :servers => 3,
                           :timeout => 10,
                           :log => 'thin.log',
                           :pid => 'thin.pid',
                           :only => 1
                          )
  end
  
  it 'should call only specified server' 

end

describe Cluster, "controlling only one server, by sequence number" do
  before do
    @cluster = Cluster.new(:chdir => '/rails_app',
                           :address => '0.0.0.0',
                           :port => 3000, 
                           :servers => 3,
                           :timeout => 10,
                           :log => 'thin.log',
                           :pid => 'thin.pid',
                           :only => 1
                          )
  end
  
  it 'should call only specified server' 

  
  it "should start only specified server" 

  
  private
    def options_for_port(port)
      { :daemonize => true, :log => "thin.#{port}.log", :timeout => 10, :address => "0.0.0.0", :port => port, :pid => "thin.#{port}.pid", :chdir => "/rails_app" }
    end
end

describe Cluster, "with Swiftiply" do
  before do
    @cluster = Cluster.new(:chdir => '/rails_app',
                           :address => '0.0.0.0',
                           :port => 3000, 
                           :servers => 3,
                           :timeout => 10,
                           :log => 'thin.log',
                           :pid => 'thin.pid',
                           :swiftiply => true
                          )
  end
  
  it 'should call each server' 

  
  it 'should start each server' 


  it 'should stop each server' 

  
  private
    def options_for_swiftiply(number)
      { :address => '0.0.0.0', :port => 3000, :daemonize => true, :log => "thin.#{number}.log", :timeout => 10, :pid => "thin.#{number}.pid", :chdir => "/rails_app", :swiftiply => true }
    end
end

describe Cluster, "rolling restart" do
  before do
    @cluster = Cluster.new(:chdir => '/rails_app',
                           :address => '0.0.0.0',
                           :port => 3000, 
                           :servers => 2,
                           :timeout => 10,
                           :log => 'thin.log',
                           :pid => 'thin.pid',
                           :onebyone => true,
                           :wait => 30
                          )
  end
  
  it "should restart servers one by one" 

  
  private
    def options_for_port(port)
      { :daemonize => true, :log => "thin.#{port}.log", :timeout => 10, :address => "0.0.0.0", :port => port, :pid => "thin.#{port}.pid", :chdir => "/rails_app" }
    end
end

