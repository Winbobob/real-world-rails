require 'spec_helper'

describe Spork::Server do
  describe "a fake server" do
    before(:each) do
      @fake_run_strategy = FakeRunStrategy.new
      @server = Spork::Server.new(:run_strategy => @fake_run_strategy)
    end
    
    it "accepts a port" 

  end
end

