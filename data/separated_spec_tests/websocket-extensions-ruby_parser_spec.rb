require "spec_helper"

describe WebSocket::Extensions::Parser do
  describe :parse_header do
    def parse(string)
      WebSocket::Extensions::Parser.parse_header(string).to_a
    end

    it "parses an empty header" 


    it "parses a missing header" 


    it "raises on invalid input" 


    it "parses one offer with no params" 


    it "parses two offers with no params" 


    it "parses a duplicate offer name" 


    it "parses a flag" 


    it "parses an unquoted param" 


    it "parses a quoted param" 


    it "parses multiple params" 


    it "parses duplicate params" 


    it "parses multiple complex offers" 

  end

  describe :serialize_params do
    def serialize(name, params)
      WebSocket::Extensions::Parser.serialize_params(name, params)
    end

    it "serializes empty params" 


    it "serializes a flag" 


    it "serializes an unquoted param" 


    it "serializes a quoted param" 


    it "serializes multiple params" 


    it "serializes duplicate params" 

  end
end

