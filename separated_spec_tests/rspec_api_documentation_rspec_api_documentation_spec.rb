require 'spec_helper'

describe RspecApiDocumentation do
  describe "#configuration" do
    it "should be a configuration" 


    it "returns the same configuration every time" 

  end

  describe "#configure" do
    let(:configuration) { double(:confiugration) }

    before do
      allow(RspecApiDocumentation).to receive(:configuration).and_return(configuration)
    end

    it "should yield the configuration to the block" 

  end
end

