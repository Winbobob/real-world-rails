require 'spec_helper'

describe WebMock::RequestSignature do

  describe "initialization" do

    it "assign the uri to be the normalized uri" 


    it "assigns the uri without normalization if uri is already a URI" 


    it "assigns normalized headers" 


    it "assign the body" 


    it "symbolizes the method" 

  end

  describe "#to_s" do
    it "describes itself" 

  end

  describe "#hash" do
    it "reporst same hash for two signatures with the same values" 


    it "reports different hash for two signatures with different method" 


    it "reports different hash for two signatures with different uri" 


    it "reports different hash for two signatures with different body" 


    it "reports different hash for two signatures with different headers" 

  end

  [:==, :eql?].each do |method|
    describe method do
      it "is true for two signatures with the same values" 


      it "is false for two signatures with different method" 


      it "is false for two signatures with different uri" 


      it "is false for two signatures with different body" 


      it "is false for two signatures with different headers" 

    end
  end

  subject { WebMock::RequestSignature.new(:get, "www.example.com") }

  describe "#url_encoded?" do
    it "returns true if the headers are urlencoded" 


    it "returns false if the headers are NOT urlencoded" 


    it "returns false when no headers are set" 

  end

  describe "#json_headers?" do
    it "returns true if the headers are json" 


    it "returns false if the headers are NOT json" 


    it "returns false when no headers are set" 

  end
end

