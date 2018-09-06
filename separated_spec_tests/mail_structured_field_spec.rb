# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe Mail::StructuredField do

  describe "initialization" do
    
    it "should be instantiated" 

    
  end

  describe "manipulation" do
    
    before(:each) do
      @field = Mail::StructuredField.new("From", "bob@me.com")
    end
    
    it "should allow us to set a text value at initialization" 

    
    it "should provide access to the text of the field once set" 

    
    it "should provide a means to change the value" 

  end

  describe "displaying encoded field and decoded value" do
    
    before(:each) do
      @field = Mail::FromField.new("bob@me.com")
    end
    
    it "should provide a to_s function that returns the decoded string" 

    
    it "should return '' on to_s if there is no value" 

    
    it "should give an encoded value ready to insert into an email" 

    
    it "should return an empty string on encoded if it has no value" 

    
    it "should return the field name and value in proper format when called to_s" 

  end
end

