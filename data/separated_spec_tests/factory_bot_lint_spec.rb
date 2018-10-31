require 'spec_helper'

describe 'FactoryBot.lint' do
  it 'raises when a factory is invalid' 


  it 'does not raise when all factories are valid' 


  it 'allows for selective linting' 


  it "allows for explicit factories and additional options" 


  it "allows for additional options without explicit factories" 


  describe "trait validation" do
    context "enabled" do
      it "raises if a trait produces an invalid object" 


      it "does not raise if a trait produces a valid object" 

    end

    context "disabled" do
      it "does not raises if a trait produces an invalid object" 

    end
  end

  describe "factory strategy for linting" do
    it "uses the requested strategy" 


    it "uses the requested strategy during trait validation" 

  end
end

