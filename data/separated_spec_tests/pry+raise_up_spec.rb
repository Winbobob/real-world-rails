require_relative '../helper'

describe "raise-up" do
  before do
    @self  = "Pad.self = self"
    @inner = "Pad.inner = self"
    @outer = "Pad.outer = self"
  end

  after do
    Pad.clear
  end

  it "should raise the exception with raise-up" 


  it "should raise an unamed exception with raise-up" 


  it "should eat the exception at the last new pry instance on raise-up" 


  it "should raise the most recently raised exception" 


  it "should allow you to cd up and (eventually) out" 


  it "should jump immediately out of nested contexts with !" 

end

