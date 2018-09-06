# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe Mail::ToField do
  # 
  #    The "To:" field contains the address(es) of the primary recipient(s)
  #    of the message.
  
  describe "initialization" do

    it "should initialize" 


    it "should accept a string without the field name" 


  end

  describe "instance methods" do
    it "should return an address" 


    it "should return two addresses" 


    it "should return one address and a group" 

    
    it "should return the formatted line on to_s" 

    
    it "should return the encoded line" 

    
    it "should return the decoded line" 

    
    it "should get multiple address out from a group list" 

    
    it "should handle commas in the address" 

    
    it "should handle commas in the address for multiple fields" 

    
  end


  describe "unicode address" do
    it "should allow unicode local part jp" 


    it "should allow unicode local" 


    it "should allow unicode local (simple)" 


    it "should allow unicode local (complex)" 


    it "should allow emoji local" 

  end
  
  it "should not crash if it can't understand a name" 

  
end

