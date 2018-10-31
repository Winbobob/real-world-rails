# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe "mail encoding" do

  it "should allow you to assign an email-wide charset" 


  describe "using default encoding" do
    it "should allow you to send in unencoded strings to fields and encode them" 


    it "should allow you to send in unencoded strings to address fields and encode them" 


    it "should allow you to send in unencoded strings to address fields and encode them" 


    it "should allow you to send in multiple unencoded strings to address fields and encode them" 


    it "should allow you to send unquoted non us-ascii strings, with spaces in them" 


    it "should allow you to send in multiple unencoded strings to any address field" 


    it "should handle groups" 


    it "should handle groups with funky characters" 


    describe "quoting token safe chars" do

      it "should not quote the display name if unquoted" 


      it "should not quote the display name if already quoted" 


    end

    describe "quoting token unsafe chars" do
      it "should quote the display name" 


      it "should preserve quotes needed from the user and not double quote" 

    end
  end

  describe "specifying an email-wide encoding" do
    it "should allow you to send in unencoded strings to fields and encode them" 


    it "should allow you to send in unencoded strings to address fields and encode them" 


    it "should allow you to send in multiple unencoded strings to address fields and encode them" 


    %w[ To From Cc Reply-To ].each do |field|
      array = ["Mikel Linds\xE4r <mikel@test.lindsaar.net>", "\xE4d <ada@test.lindsaar.net>"]
      array.map! { |a| a.dup.force_encoding('ISO-8859-1') } if RUBY_VERSION > '1.9'

      it "allows multiple unencoded strings in #{field}" 

    end
  end

  it "should let you define a charset per part" 


  it "should replace invalid characters" 


  it "should replace characters of unknown and invalid encoding" 


  if RUBY_VERSION > '1.9'
    describe "#pick_encoding" do
      it "picks binary for nil" 


      {
        "latin2" => Encoding::ISO_8859_2,
        "ISO_8859-1" => Encoding::ISO_8859_1,
        "cp-850" => Encoding::CP850,
        "" => Encoding::BINARY
      }.each do |from, to|
        it "should support #{from}" 

      end
    end
  end
end

