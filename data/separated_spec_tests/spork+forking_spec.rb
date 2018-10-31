require 'spec_helper'

describe Spork::RunStrategy::Forking do
  before(:each) do
    @fake_framework = FakeFramework.new
    @run_strategy = Spork::RunStrategy::Forking.new(@fake_framework)

  end

  it "returns the result of the run_tests method from the forked child" 


  it "aborts the current running thread when another run is started" 


  it "can abort the current run" 

end unless windows?

