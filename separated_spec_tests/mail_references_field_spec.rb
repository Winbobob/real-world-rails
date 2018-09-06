# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'
# 
#    The "References:" field will contain the contents of the parent's
#    "References:" field (if any) followed by the contents of the parent's
#    "Message-ID:" field (if any).  If the parent message does not contain
#    a "References:" field but does have an "In-Reply-To:" field
#    containing a single message identifier, then the "References:" field
#    will contain the contents of the parent's "In-Reply-To:" field
#    followed by the contents of the parent's "Message-ID:" field (if
#    any).  If the parent has none of the "References:", "In-Reply-To:",
#    or "Message-ID:" fields, then the new message will have no
#    "References:" field.

describe Mail::ReferencesField do

  it "should initialize" 


  it "should accept a string without the field name" 


  it "should accept multiple message ids" 


  it "should accept an array of message ids" 


  it "should accept no message ids" 


  it "should output lines shorter than 998 chars" 


  it "should handle comma-separated values" 


  it 'should be able to parse |2a26f8f146e27159@domain.com@domain.com, 2a26f8f146e27159@domain.com@domain.com|' 


  it 'should be able to parse |2a26f8f146e27159@domain.com@domain.com 2a26f8f146e27159@domain.com@domain.com|' 

end

