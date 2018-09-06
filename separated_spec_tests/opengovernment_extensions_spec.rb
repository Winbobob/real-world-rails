require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require Rails.root + 'lib/extensions'

describe "Date" do
  describe ".valid_date!" do
    it "should return a valid date given a float" 


    it "should return a date given a string" 


    it "should return a date given a date" 


    it "should return nil if passed nil" 


    it "should raise a TypeError for an unrecognized type" 

  end
end

describe "Integer" do
  describe "scale" do
    it "should properly scale an integer" 

  end
end

describe "Time" do
  describe "beginning_of_hour" do
    it "it should truncate the time to the hour" 

  end
end

