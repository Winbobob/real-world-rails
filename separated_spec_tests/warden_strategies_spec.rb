# encoding: utf-8
# frozen_string_literal: true
RSpec.describe Warden::Strategies do
  it "should let me add a strategy via a block" 


  it "should raise an error if I add a strategy via a block, that does not have an authenticate! method" 


  it "should raise an error if I add a strategy that does not extend Warden::Strategies::Base" 


  it "should allow me to get access to a particular strategy" 


  it "should allow me to add a strategy with the required methods" 


  it "should not allow a strategy that does not have an authenticate! method" 


  it "should allow me to change a class when providing a block and class" 


  it "should allow me to update a previously given strategy" 


  it "should allow me to clear the strategies" 

end

