# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe Mail::Body do

  # 3.5 Overall message syntax
  #
  # A message consists of header fields, optionally followed by a message
  # body.  Lines in a message MUST be a maximum of 998 characters
  # excluding the CRLF, but it is RECOMMENDED that lines be limited to 78
  # characters excluding the CRLF.  (See section 2.1.1 for explanation.)
  # In a message body, though all of the characters listed in the text
  # rule MAY be used, the use of US-ASCII control characters (values 1
  # through 8, 11, 12, and 14 through 31) is discouraged since their
  # interpretation by receivers for display is not guaranteed.
  #
  #  message         =       (fields / obs-fields)
  #                          [CRLF body]
  #
  #  body            =       *(*998text CRLF) *998text
  #
  # The header fields carry most of the semantic information and are
  # defined in section 3.6.  The body is simply a series of lines of text
  # which are uninterpreted for the purposes of this standard.
  #
  describe "initialization" do

    it "should be instantiated" 


    it "should initialize on a nil value" 


    it "should accept text as raw source data" 


    it "should accept nil as a value and return an empty body" 


    it "should accept an array as the body and join it" 


    it "should accept an array as the body and join it" 


  end

  describe "encoding" do

    it "should accept text as raw source data" 


    it "should set its own encoding to us_ascii if it is ascii only body" 


    it "should allow you to set its encoding" 


    it "should allow you to specify an encoding" 


    it "should convert all new lines to crlf" 


  end

  describe "decoding" do

    it "should convert all new lines to crlf" 


    it "should not change a body on decode if not given an encoding type to decode" 


    it "should change return the raw text if it does not recognise the encoding" 


    it "should change a body on decode if given an encoding type to decode" 


    it "should change a body on decode if given an encoding type to decode" 


  end

  describe "splitting up a multipart document" do
    def assert_split_into(body, pre, epi, parts)
      body = Mail::Body.new(body)
      body.split!('----=_Part_2192_32400445')
      expect(body.parts.size).to eq parts
      expect(body.preamble).to eq pre
      expect(body.epilogue).to eq epi
    end

    it "should store the boundary passed in" 


    it "should split at the boundry string given returning two message bodies" 


    it "should split with missing closing boundary" 


    it "should not split with empty space after missing closing boundary" 


    it "should split with multiple parts and missing closing boundary" 


    it "should ignore blank parts" 


    it "should keep the preamble text as its own preamble" 


    it "should return the parts as their own messages" 


    it "should return the first part as its own message" 


    it "should return the first part as its own message" 


    it "should separate out its parts" 


    it "should keep track of its parts" 


    it "should round trip its parts" 


    it "should allow you to change the boundary" 


    it "should split if boundary is not set" 


  end

  describe "detecting non ascii" do
    it "should say an empty string is all ascii" 


    it "should say if a body is ascii" 


    it "should say if a body is not ascii" 

  end

  describe "adding parts" do
    it "should allow you to add a part" 


    it "should allow you to sort the parts" 


    it "should allow you to sort the parts with an arbitrary sort order" 


    it "should allow you to sort the parts with an arbitrary sort order" 


    it "should sort the parts on encode" 


    it "should put the part types it doesn't know about at the end" 


    it "should allow you to sort the parts recursively" 


    it "should allow you to sort the parts recursively" 


    it "should maintain the relative order of the parts with the same content-type as they are added" 

  end

  describe "matching" do

    it "should still equal itself" 


    it "should match on the body part decoded if given a string to ==" 


    it "should match on the body part decoded if given a string to ==" 


    it "should match on the body part decoded if given a string to =~" 


    it "should match on the body part decoded if given a string to ==" 


    it "should match on the body part decoded if given a string to match" 


    it "should match on the body part decoded if given a string to match" 


    it "should match on the body part decoded if given a string to include?" 


    it "should match on the body part decoded if given a string to include?" 

  end

  describe "non US-ASCII charset" do
    it "should encoded" 

  end

  describe "invalid encoding" do
    it "should round trip" 

  end
end

