require "spec_helper"

describe Turnip::Execute do
  let(:mod) { Module.new }
  let(:obj) { Object.new.tap { |o| o.extend Turnip::Execute; o.extend mod } }

  it "defines a step method and makes it callable" 


  it "allows placeholders to be filled and passed as arguments" 


  it "allows step to be called as a method via `send`" 


  it "can use an existing method as a step" 


  it "raises an argument error when both method name and block given" 


  it "sends in extra arg from a builder step" 


  it "can be executed with a builder step" 


  it "sends in extra arg from a builder step" 


  it "defines ambiguous steps and run a matching step" 


  it "shows useful information on the ambiguous steps" 

end

