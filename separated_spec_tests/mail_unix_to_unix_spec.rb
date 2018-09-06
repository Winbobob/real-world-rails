# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe Mail::Encodings::UnixToUnix do
  def decode(str)
    Mail::Encodings::UnixToUnix.decode(str)
  end

  def encode(str)
    Mail::Encodings::UnixToUnix.encode(str)
  end

  it "is registered as uuencode" 


  it "is registered as x-uuencode" 


  it "can transport itself" 


  it "decodes" 


  it "encodes" 


  if RUBY_VERSION > "1.9"
    it "encodes / decodes non-ascii" 

  end

  it "can read itself" 

end

