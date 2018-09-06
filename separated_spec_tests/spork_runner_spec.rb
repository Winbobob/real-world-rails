require 'spec_helper'

describe Spork::Runner do
  def use_test_server(klass = Spork::TestFramework::RSpec)
    @test_framework = klass.new
    Spork::TestFramework.stub!(:factory).and_return(@test_framework)
  end

  before(:each) do
    @out, @err = StringIO.new, StringIO.new
  end
  
  it "finds a matching server with a prefix" 

  
  it "shows an error message if no matching server was found" 

  
  it "bootstraps a server when -b is passed in" 

  
  it "aborts if it can't preload" 

  
  it "runs the server if all is well" 

  
  it "outputs a list of supported servers, along with supported asterisk" 

end

