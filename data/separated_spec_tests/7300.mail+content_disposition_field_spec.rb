# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe Mail::ContentDispositionField do

  describe "initialization" do

    it "should initialize" 


    it "should accept a string without the field name" 


    it "should accept a nil value and generate a disposition type" 


    it "should render encoded" 


    it "should render encoded for inline" 


    it "should wrap a filename in double quotation marks only if the filename contains spaces and does not already have double quotation marks" 


    it "should render decoded" 


    it "should render decoded inline" 


    it "should handle upper and mixed case INLINE and AttachMent" 

  end

  describe "instance methods" do
    it "should give its disposition type" 


    # see spec/fixtures/trec_2005_corpus/missing_content_disposition.eml
    it "should accept a blank disposition type" 


    it "handles nil value" 

  end

  describe "finding a filename" do
    it "should locate a filename if there is a filename" 


    it "should locate a name if there is no filename" 


    it "should return an empty string when filename or name is empty" 


    it "should locate an encoded name as a filename" 

  end
end

