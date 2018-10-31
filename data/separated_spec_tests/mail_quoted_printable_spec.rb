# frozen_string_literal: true
require 'spec_helper'

describe Mail::Encodings::QuotedPrintable do
  
  it "should encode quoted printable from text" 


  it "should encode quoted printable from crlf text" 


  it "should encode quoted printable from cr text" 

  
  it "should decode quoted printable" 

  
  it "should encode quoted printable from binary" 

  
  it "should decode quoted printable text" 


  [["\r", "=0D"], ["\n", "=0A"], ["\r\n", "=0D=0A"]].each do |crlf, linebreak|
    expected = "first line wraps\r\n\r\nsecond paragraph"
    it "should cope with inappropriate #{linebreak} line break encoding" 

  end

  [["\r", "=0D"], ["\n", "=0A"], ["\r\n", "=0D=0A"]].each do |crlf, linebreak|
    expected = "first line wraps#{crlf}#{crlf}second paragraph"
    it "should allow encoded #{linebreak} line breaks with soft line feeds" 

  end
  
end

