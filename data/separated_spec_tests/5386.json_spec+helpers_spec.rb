require "spec_helper"

describe JsonSpec::Helpers do
  include described_class

  context "parse_json" do
    it "parses JSON documents" 


    it "parses JSON values" 


    it "raises a parser error for invalid JSON" 


    it "parses at a path if given" 


    it "raises an error for a missing path" 


    it "parses at a numeric string path" 

  end

  context "normalize_json" do
    it "normalizes a JSON document" 


    it "normalizes at a path" 


    it "accepts a JSON value" 


    it "normalizes JSON values" 

  end

  context "generate_normalized_json" do
    it "generates a normalized JSON document" 


    it "generates a normalized JSON value" 

  end

  context "load_json_file" do
    it "raises an error when no directory is set" 


    it "returns JSON when the file exists" 


    it "ignores extra slashes" 


    it "raises an error when the file doesn't exist" 


    it "raises an error when the directory doesn't exist" 


    it "finds nested files" 

  end
end

