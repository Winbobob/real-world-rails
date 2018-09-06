require 'spec_helper'
include Controllers

describe Service do
  before(:all) do
    silence_warnings do
      Service::INITD_PATH          = 'tmp/sandbox' + Service::INITD_PATH
      Service::DEFAULT_CONFIG_PATH = 'tmp/sandbox' + Service::DEFAULT_CONFIG_PATH
    end
  end

  before do
    Thin.stub!(:linux?).and_return(true)
    FileUtils.mkdir_p 'tmp/sandbox'

    @service = Service.new(:all => 'spec/configs')
  end

  it "should call command for each config file" 


  it "should create /etc/init.d/thin file when calling install" 


  it "should create /etc/thin dir when calling install" 


  it "should include specified path in /etc/init.d/thin script" 


  after do
    FileUtils.rm_rf 'tmp/sandbox'
  end
end

