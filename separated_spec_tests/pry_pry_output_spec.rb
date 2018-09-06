require_relative 'helper'

describe Pry do
  describe "output failsafe" do
    after do
      Pry.config.print = Pry::DEFAULT_PRINT
    end

    it "should catch serialization exceptions" 


    it "should display serialization exceptions" 


    it "should catch errors serializing exceptions" 

  end

  describe "DEFAULT_PRINT" do
    it "should output the right thing" 


    it "should include the =>" 


    it "should not be phased by un-inspectable things" 


    it "doesn't leak colour for object literals" 

  end

  describe "output_prefix" do
    it "should be able to change output_prefix" 

  end

  describe "color" do
    before do
      Pry.config.color = true
    end

    after do
      Pry.config.color = false
    end

    it "should colorize strings as though they were ruby" 


    it "should not colorize strings that already include color" 

  end

  describe "output suppression" do
    before do
      @t = pry_tester
    end
    it "should normally output the result" 


    it "should not output anything if the input ends with a semicolon" 


    it "should output something if the input ends with a comment" 


    it "should not output something if the input is only a comment" 

  end

  describe "custom non-IO object as $stdout" do
    it "does not crash pry" 

  end
end

