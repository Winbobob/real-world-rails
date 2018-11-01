require 'spec_helper'

RSpec.describe HTTParty::Parser do
  describe ".SupportedFormats" do
    it "returns a hash" 

  end

  describe ".call" do
    it "generates an HTTParty::Parser instance with the given body and format" 


    it "calls #parse on the parser" 

  end

  describe ".formats" do
    it "returns the SupportedFormats constant" 


    it "returns the SupportedFormats constant for subclasses" 

  end

  describe ".format_from_mimetype" do
    it "returns a symbol representing the format mimetype" 


    it "returns nil when the mimetype is not supported" 

  end

  describe ".supported_formats" do
    it "returns a unique set of supported formats represented by symbols" 

  end

  describe ".supports_format?" do
    it "returns true for a supported format" 


    it "returns false for an unsupported format" 

  end

  describe "#parse" do
    it "attempts to parse supported formats" 


    it "returns the unparsed body when the format is unsupported" 


    it "returns nil for an empty body" 


    it "returns nil for a nil body" 


    it "returns nil for a 'null' body" 


    it "returns nil for a body with spaces only" 


    it "does not raise exceptions for bodies with invalid encodings" 


    it "ignores utf-8 bom" 


    it "parses ascii 8bit encoding" 


    it "parses frozen strings" 

  end

  describe "#supports_format?" do
    it "utilizes the class method to determine if the format is supported" 

  end

  describe "#parse_supported_format" do
    it "calls the parser for the given format" 


    context "when a parsing method does not exist for the given format" do
      it "raises an exception" 


      it "raises a useful exception message for subclasses" 

    end
  end

  context "parsers" do
    subject do
      HTTParty::Parser.new('body', nil)
    end

    it "parses xml with MultiXml" 


    it "parses json with JSON" 


    it "parses html by simply returning the body" 


    it "parses plain text by simply returning the body" 


    it "parses csv with CSV" 

  end
end

