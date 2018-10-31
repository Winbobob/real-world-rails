# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe Mail::UnstructuredField do

  describe "initialization" do

    it "should be instantiated" 


  end

  describe "manipulation" do

    before(:each) do
      @field = Mail::UnstructuredField.new("Subject", "Hello Frank")
    end

    it "should allow us to set a text value at initialization" 


    it "should provide access to the text of the field once set" 


    it "should provide a means to change the value" 

  end

  describe "displaying encoded field and decoded value" do

    before(:each) do
      @field = Mail::UnstructuredField.new("Subject", "Hello Frank")
    end

    it "should provide a to_s function that returns the field name and value" 


    it "should return '' on to_s if there is no value" 


    it "should give an encoded value ready to insert into an email" 


    it "should return nil on encoded if it has no value" 


    it "should handle array" 


    it "should handle string" 


    it "should give an decoded value ready to insert into an email" 


    it "should return a nil on decoded if it has no value" 


    it "should just add the CRLF at the end of the line" 


    it "should do encoded-words encoding correctly without extra equal sign" 


    it "should encode the space between two adjacent encoded-words" 


    it "should encode additional special characters inside encoded-word-encoded strings" 


    it "should decode a utf-7(B) encoded unstructured field" 


    if !'1.9'.respond_to?(:force_encoding)
      it "shouldn't get fooled into encoding on 1.8 due to an unrelated Encoding constant" 

    end
  end

  describe "folding" do

    it "should not fold itself if it is 78 chracters long" 


    it "should fold itself if it is 79 chracters long" 


    it "should fold itself if it is 997 chracters long" 


    it "should fold itself if it is 998 characters long" 


    it "should fold itself if it is 999 characters long" 


    it "should fold itself if it is non us-ascii" 


    it "should fold properly with my actual complicated header" 


    it "should fold properly with continuous spaces around the linebreak" 


  end

  describe "encoding non QP safe chars" do
    it "should encode an ascii string that has carriage returns if asked to" 

  end

  describe "iso-2022-jp Subject" do
    it "should encoded with ISO-2022-JP encoding" 

  end
end

