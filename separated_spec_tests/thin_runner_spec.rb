require 'spec_helper'

describe Runner do
  it "should parse options" 


  it "should parse specified command" 


  it "should abort on unknow command" 


  it "should exit on empty command" 


  it "should use Controller when controlling a single server" 


  it "should use Cluster controller when controlling multiple servers" 


  it "should default to single server controller" 


  it "should consider as a cluster with :servers option" 


  it "should consider as a cluster with :only option" 


  it "should warn when require a rack config file" 


  it "should require file" 


  it "should remember requires" 


  it "should remember debug options" 


  it "should default debug, silent and trace to false" 

end

describe Runner, 'with config file' do
  before :each do
    @runner = Runner.new(%w(start --config spec/configs/cluster.yml))
  end

  it "should load options from file with :config option" 


  it "should load options from file using an ERB template" 


  it "should change directory after loading config" 

end

describe Runner, "service" do
  before do
    Thin.stub!(:linux?).and_return(true)

    @controller = mock('service')
    Controllers::Service.stub!(:new).and_return(@controller)
  end

  it "should use Service controller when controlling all servers" 


  it "should call install with arguments" 


  it "should call install without arguments" 

end

