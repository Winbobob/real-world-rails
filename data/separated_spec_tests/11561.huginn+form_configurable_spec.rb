require 'rails_helper'

describe FormConfigurable do
  class Agent1
    include FormConfigurable

    def validate_test
      true
    end

    def complete_test
      [{name: 'test', value: 1234}]
    end
  end

  class Agent2 < Agent
  end

  before(:all) do
    @agent1 = Agent1.new
    @agent2 = Agent2.new
  end

  it "#is_form_configurable" 


  describe "#validete_option" do
    it "should call the validation method if it is defined" 


    it "should return false of the method is undefined" 

  end

  it "#complete_option" 


  describe "#form_configurable" do
    it "should raise an ArgumentError for invalid  options" 


    it "should raise an ArgumentError when not providing an array with type: array" 


    it "should not require any options for the default values" 

  end
end

