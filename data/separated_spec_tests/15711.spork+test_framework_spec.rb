require 'spec_helper'

describe Spork::TestFramework do

  before(:each) do
    @fake = FakeFramework.new
  end

  describe ".available_test_frameworks" do
    before(:each) do
      Spork::TestFramework.supported_test_frameworks.each { |s| s.stub!(:available?).and_return(false) }
    end

    it "returns a list of all available servers" 


    it "returns rspec before cucumber when both are available" 

  end

  describe ".supported_test_frameworks" do
    it "returns all defined servers" 


    it "returns a list of servers matching a case-insensitive prefix" 

  end

  describe ".short_name" do
    it "returns the name of the framework, without the namespace prefix" 

  end

  describe ".available?" do
    it "returns true when the helper_file exists" 

  end

  describe ".bootstrapped?" do
    it "recognizes if the helper_file has been bootstrapped" 

  end

  describe ".bootstrap" do
    it "bootstraps a file" 

  end

  describe ".factory" do
    it "defaults to use rspec over cucumber" 


    it "defaults to use cucumber when rspec not available" 

  end
end

