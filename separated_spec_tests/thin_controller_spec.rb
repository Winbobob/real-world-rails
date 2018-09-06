require 'spec_helper'
require 'ostruct'
include Controllers

describe Controller, 'start' do
  before do
    @controller = Controller.new(:address              => '0.0.0.0',
                                 :port                 => 3000,
                                 :pid                  => 'thin.pid',
                                 :log                  => 'thin.log',
                                 :timeout              => 60,
                                 :max_conns            => 2000,
                                 :max_persistent_conns => 1000,
                                 :adapter              => 'rails')
    
    @server = OpenStruct.new
    @adapter = OpenStruct.new
    
    Server.should_receive(:new).with('0.0.0.0', 3000, @controller.options).and_return(@server)
    @server.should_receive(:config)
    Rack::Adapter::Rails.stub!(:new).and_return(@adapter)
  end
  
  it "should configure server" 

  
  it "should start as daemon" 

  
  it "should configure Rails adapter" 

  
  it "should mount app under :prefix" 


  it "should mount Stats adapter under :stats" 

  
  it "should load app from Rack config" 


  it "should load app from ruby file" 


  it "should throwup if rackup is not a .ru or .rb file" 

  
  it "should set server as threaded" 

  
  it "should set RACK_ENV" 

    
end

describe Controller do
  before do
    @controller = Controller.new(:pid => 'thin.pid', :timeout => 10)
    @controller.stub!(:wait_for_file)
  end
  
  it "should stop" 

  
  it "should restart" 

  
  it "should write configuration file" 

end

