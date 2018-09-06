# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe "Utilities Module" do

  include Mail::Utilities

  describe "token safe" do

    describe "checking" do
      it "should return true if a string is token safe" 


      it "should return false if a string is token safe" 


      it "should work with mb_chars" 

    end

    describe "quoting" do
      it "should return true if a string is token safe" 


      it "should return false if a string is token safe" 


      it "should work with mb_chars" 

    end

  end

  describe "atom safe" do

    describe "checking" do
      it "should return true if a string is token safe" 


      it "should return false if a string is token safe" 


      it "should work with mb_chars" 

    end

    describe "quoting" do
      it "should return true if a string is token safe" 


      it "should return false if a string is token safe" 


      it "should work with mb_chars" 


      it "should quote mb_chars white space" 

    end
  end

  describe "quoting phrases" do
    it "doesn't mutate original string" 


    if RUBY_VERSION >= '1.9'
      describe "given a non-unsafe string" do
        it "should not change the encoding" 

      end

      describe "given an unsafe string" do
        it "should not change the encoding" 

      end
    end
  end

  describe "escaping parenthesies" do
    it "should escape parens" 


    it "should not double escape parens" 


    it "should escape all parens" 


  end

  describe "unescaping parenthesis" do

    it "should work" 


    it "should work without parens" 


    it "should work using Multibyte.mb_chars" 


    it "should work without parens using Multibyte.mb_chars" 

  end

  describe "unescaping brackets" do

    it "should work" 


    it "should work without brackets" 


    it "should work using Multibyte.mb_chars" 


    it "should work without parens using Multibyte.mb_chars" 

  end

  describe "quoting phrases" do
    it "should quote a phrase if it is unsafe" 


    it "should properly quote a string, even if quoted but not escaped properly" 


    it "should quote correctly a phrase with an escaped quote in it" 


    it "should quote correctly a phrase with an escaped backslash followed by an escaped quote in it" 

  end

  describe "unquoting phrases" do
    it "should remove quotes from the edge" 


    it "should remove backslash escaping from quotes" 


    it "should remove backslash escaping from any char" 


    it "should be able to handle unquoted strings" 


    it "should preserve backslashes in unquoted strings" 


    it "should be able to handle unquoted quotes" 

  end

  describe "unescaping phrases" do
    it "should not modify a string with no backslashes" 


    it "should not modify a quoted string with no backslashes" 


    it "should remove backslash escaping from a string" 


    it "should remove backslash escaping from a quoted string" 

  end

  describe "parenthesizing phrases" do
    it "should parenthesize a phrase" 


    it "should properly parenthesize a string, and escape properly" 


    it "should properly parenthesize a string, and escape properly (other way)" 


    it "should properly parenthesize a string, even if parenthesized but not escaped properly" 


    it "should properly parenthesize a string, even if parenthesized but not escaped properly (other way)" 


    it "should parenthesize correctly a phrase with an escaped parentheses in it" 


    it "should parenthesize correctly a phrase with an escaped parentheses in it (other way)" 


    it "should parenthesize correctly a phrase with an escaped backslash followed by an escaped parentheses in it" 


    it "should parenthesize correctly a phrase with an escaped backslash followed by an escaped parentheses in it (other way)" 


    it "should parenthesize correctly a phrase with a set of parentheses" 


  end


  describe "bracketizing phrases" do
    it "should bracketize a phrase" 


    it "should properly bracketize a string, and escape properly" 


    it "should properly bracketize a string, and escape properly (other way)" 


    it "should properly bracketize a string, even if bracketized but not escaped properly" 


    it "should properly bracketize a string, even if bracketized but not escaped properly (other way)" 


    it "should bracketize correctly a phrase with an escaped brackets in it" 


    it "should bracketize correctly a phrase with an escaped brackets in it (other way)" 


    it "should bracketize correctly a phrase with an escaped backslash followed by an escaped brackets in it" 


    it "should bracketize correctly a phrase with an escaped backslash followed by an escaped brackets in it (other way)" 


    it "should bracketize correctly a phrase with a set of brackets" 


  end

  describe "url escaping" do
    uri_parser = URI.const_defined?(:Parser) ? URI::Parser.new : URI

    it "should have a wrapper on URI.escape" 


    it "should have a wrapper on URI.unescape" 

  end


  describe "blank method" do
    it "should say nil is blank" 


    it "should say false is blank" 


    it "should say true is not blank" 


    it "should say an empty array is blank" 


    it "should say an empty hash is blank" 


    it "should say an empty string is blank" 

  end

  describe "not blank method" do
    it "should say a number is not blank" 


    it "should say a valueless hash is not blank" 


    it "should say a hash containing an empty hash is not blank" 

  end

  describe "to_lf" do
    it "converts single CR" 


    it "converts multiple CR" 


    it "converts single CRLF" 


    it "converts multiple CRLF" 


    it "leaves LF intact" 


    it "converts mixed line endings" 


    it "should handle japanese characters" 


    describe "on NilClass" do
      it "returns an empty string" 

    end

    describe "on String subclasses" do
      it "returns Strings" 

    end
  end

  describe "to_crlf" do
    it "converts single LF" 


    it "converts multiple LF" 


    it "converts single CR" 


    it "preserves single CRLF" 


    it "preserves multiple CRLF" 


    it "converts mixed line endings" 


    it "should handle japanese characters" 


    describe "on NilClass" do
      it "returns an empty string" 

    end

    describe "on String subclasses" do
      it "returns Strings" 

    end
  end
end

