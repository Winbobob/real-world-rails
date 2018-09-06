# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "One-off JSON examples" do
  it "should not blow up with a bad surrogate trailer" 


  it "should parse 23456789012E666 and return Infinity" 


  it "should not parse JSON with a comment, with :allow_comments set to false" 


  it "should parse JSON with a comment, with :allow_comments set to true" 


  it "should not parse invalid UTF8 with :check_utf8 set to true" 


  it "should parse invalid UTF8 with :check_utf8 set to false" 


  it "should parse using it's class method, from an IO" 


  it "should parse using it's class method, from a string with symbolized keys" 


  it "should parse using it's class method, from a utf-8 string with multibyte characters, with symbolized keys" 


  it "should parse using it's class method, from a string" 


  it "should parse using it's class method, from a string with a block" 


  it "should parse numbers greater than 2,147,483,648" 


  if RUBY_VERSION =~ /^1.9/
    it "should encode non-ascii symbols in utf-8" 


    it "should return strings and hash keys in utf-8 if Encoding.default_internal is nil" 


    it "should return strings and hash keys encoded as specified in Encoding.default_internal if it's set" 

  end
end

