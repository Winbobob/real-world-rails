require_relative 'helper'
describe Pry::REPL do
  it "should let you run commands in the middle of multiline expressions" 


  it "should rescue exceptions" 


  describe "eval_string and binding_stack" do
    it "shouldn't break if we start a nested REPL" 


    it "shouldn't break if we start a nested instance" 


    it "shouldn't break if we pop bindings in Ruby" 


    it "should immediately evaluate eval_string after cmd if complete" 

  end

  describe "space prefix" do
    describe "with 1 space" do
      it "it prioritizes variables over commands" 

    end

    describe "with more than 1 space" do
      it "prioritizes commands over variables" 

    end
  end

  describe "#piping?" do
    it "returns false when $stdout is a non-IO object" 

  end
end

