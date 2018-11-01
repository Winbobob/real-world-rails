require_relative 'helper'

describe Pry::Prompt do
  describe "one-parameter prompt proc" do
    it 'should get full config object' 


    it 'should get full config object, when using a proc array' 


    it 'should receive correct data in the config object' 


    specify "object is Hash when current binding is a Hash" do
      config = nil
      h = {}
      redirect_pry_io(InputTester.new("exit-all")) do
        Pry.start(h, prompt: proc{|v| config = v })
      end
      expect(config.object).to be(h)
    end
  end

  describe "BACKWARDS COMPATIBILITY: 3 parameter prompt proc" do
    it 'should get 3 parameters' 


    it 'should get 3 parameters, when using proc array' 

  end

  it "can compute prompt name dynamically" 

end

