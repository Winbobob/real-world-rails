# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'
require 'mail/fields/common_field'

describe Mail::CommonField do

  describe "multi-charset support" do

    before(:each) do
      @original = $KCODE if RUBY_VERSION < '1.9'
    end

    after(:each) do
      $KCODE = @original if RUBY_VERSION < '1.9'
    end

    it "should return '' on to_s if there is no value" 


    it "should leave ascii alone" 


    it "should encode a utf-8 string as utf-8 quoted printable" 


    it "should wrap an encoded at 60 characters" 


    it "should handle charsets in assigned addresses" 


  end

  describe "with content that looks like the field name" do
    it "does not strip from start" 


    it "does not strip from middle" 

  end
end

