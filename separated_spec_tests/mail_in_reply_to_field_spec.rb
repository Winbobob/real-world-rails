# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'
# 
#    The "In-Reply-To:" field will contain the contents of the "Message-
#    ID:" field of the message to which this one is a reply (the "parent
#    message").  If there is more than one parent message, then the "In-
#    Reply-To:" field will contain the contents of all of the parents'
#    "Message-ID:" fields.  If there is no "Message-ID:" field in any of
#    the parent messages, then the new message will have no "In-Reply-To:"
#    field.

describe Mail::InReplyToField do

  describe "initialization" do
    it "should initialize" 


    it "should accept a string without the field name" 

    
    it "should provide encoded" 

    
    it "should handle many encoded message IDs" 


    it "should handle an array of message IDs" 


    it "should provide decoded" 

    
    it "should handle many decoded message IDs" 

    
    it "should handle an empty value" 

    
  end

  describe "handlign multiple message ids" do
    it "should handle many message IDs" 

  end

  it "should output lines shorter than 998 chars" 


end

