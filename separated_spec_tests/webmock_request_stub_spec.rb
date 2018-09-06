require 'spec_helper'

describe WebMock::RequestStub do

  before(:each) do
    @request_stub = WebMock::RequestStub.new(:get, "www.example.com")
  end

  it "should have request pattern with method and uri" 


  it "should have response" 


  describe "with" do

    it "should assign body to request pattern" 


    it "should assign normalized headers to request pattern" 


    it "should assign given block to request profile" 


  end

  describe "to_return" do

    it "should assign response with provided options" 


    it "should assign responses with provided options" 


  end

  describe "then" do
    it "should return stub without any modifications, acting as syntactic sugar" 

  end

  describe "response" do

    it "should return responses in a sequence passed as array" 


    it "should repeat returning last response" 


    it "should return responses in a sequence passed as comma separated params" 


    it "should return responses declared in multiple to_return declarations" 


  end

  describe "to_raise" do

    it "should assign response with exception to be thrown" 


    it "should assign sequence of responses with response with exception to be thrown" 


    it "should assign a list responses to be thrown in a sequence" 


    it "should raise exceptions declared in multiple to_raise declarations" 


  end

  describe "to_timeout" do

     it "should assign response with timeout" 


     it "should assign sequence of responses with response with timeout" 


     it "should allow multiple timeouts to be declared" 


   end


  describe "times" do

    it "should give error if declared before any response declaration is declared" 


    it "should repeat returning last declared response declared number of times" 


    it "should repeat raising last declared exception declared number of times" 


    it "should repeat returning last declared sequence of responses declared number of times" 


    it "should return self" 


    it "should raise error if argument is not integer" 


    it "should raise error if argument is < 1" 


  end

end

