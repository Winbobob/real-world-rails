# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe Mail::Field do

  describe 'parsing' do
    it "parses full header fields" 


    it "parses missing whitespace" 


    it "parses added inapplicable whitespace" 

  end

  describe "initialization" do
    it "raises if instantiating by parsing a full header field" 


    it "instantiates with name and value" 


    it "accepts arrays of values" 


    it "accepts omitted values" 


    it "should match up fields to class names" 


    %w[ dATE fROM sENDER REPLY-TO TO CC BCC MESSAGE-ID IN-REPLY-TO
        REFERENCES KEYWORDS resent-date resent-from rESENT-sENDER
        rESENT-tO rESent-cc resent-bcc reSent-MESSAGE-iD
        rEtURN-pAtH rEcEiVeD Subject Comments Mime-VeRSIOn
        cOntenT-transfer-EnCoDiNg Content-Description
        Content-Disposition cOnTENt-TyPe
    ].each do |sf|
      words = sf.split("-").map { |a| a.capitalize }
      klass = Mail.const_get("#{words.join}Field")
      it "matches #{sf} to #{klass}" 

    end

    it "should say anything that is not a known field is an optional field" 


    it "should return an unstuctured field if the structured field parsing raises an error" 


    it "delegates to_s to its field" 


    it "delegates missing methods to its field" 


    it "should respond_to? its own methods and the same methods as its instantiated field class" 


    it "should change its type if you change the name" 


    it "should create a field without trying to parse if given a symbol" 


    it "should inherit charset" 

  end

  describe "error handling" do
    it "should populate the errors array if it finds a field it can't deal with" 

  end

  describe "helper methods" do
    it "should reply if it is responsible for a field name as a capitalized string - structured field" 


    it "should reply if it is responsible for a field as a lower case string - structured field" 


    it "should reply if it is responsible for a field as a symbol - structured field" 


    it "should say it is the \"same\" as another if their field types match" 


    it "should say it is not the \"same\" as another if their field types don't match" 


    it "should say it is not the \"same\" as nil" 


    it "should say it is == to another if their field and names match" 


    it "should say it is not == to another if their field names do not match" 


    it "should say it is not == to another if their field names match, but not their values" 


    it "should say it is not == to nil" 


    it "should sort according to the field order" 

  end

  describe 'user defined fields' do
    it "should say it is the \"same\" as another if their field names match" 


    it "should say it is not == to another if their field names do not match" 

  end

  describe "passing an encoding" do
    it "should allow you to send in unencoded strings to fields and encode them" 


    it "should allow you to send in unencoded strings to address fields and encode them" 


    it "should allow you to send in unencoded strings without quotes to address fields and encode them" 


    it "should allow you to send in unencoded strings to address fields and encode them" 


    it "should allow you to send in multiple unencoded strings to address fields and encode them" 


    it "should allow you to send in multiple unencoded strings to any address field" 


    it "should allow an encoded value in the Subject field and decode it automatically (issue 44)" 


    it "should allow you to encoded text in the middle (issue 44)" 


    it "more tolerable to encoding definitions, ISO (issue 120)" 


    it "more tolerable to encoding definitions, ISO-long (issue 120)" 


    it "more tolerable to encoding definitions, UTF (issue 120)" 


    it "more tolerable to encoding definitions, ISO (issue 120)" 



    it "more tolerable to encoding definitions, Windows (issue 120)" 


    it "should support ascii encoded utf-8 subjects" 


    it "should support ascii encoded windows subjects" 

  end

  describe "value" do
    let(:original) { { :template => "t1" } }
    subject { Mail::Field.new("name", original) }

    context "parsed" do
      it "returns parsed value" 

    end

    context "unparsed" do
      it "returns origin unparsed value" 

    end
  end

  describe Mail::Field::ParseError do
    it "should be structured" 

  end

end

