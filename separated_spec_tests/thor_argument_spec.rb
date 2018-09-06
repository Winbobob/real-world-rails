require "helper"
require "thor/parser"

describe Thor::Argument do
  def argument(name, options = {})
    @argument ||= Thor::Argument.new(name, options)
  end

  describe "errors" do
    it "raises an error if name is not supplied" 


    it "raises an error if type is unknown" 


    it "raises an error if argument is required and has default values" 


    it "raises an error if enum isn't an array" 

  end

  describe "#usage" do
    it "returns usage for string types" 


    it "returns usage for numeric types" 


    it "returns usage for array types" 


    it "returns usage for hash types" 

  end
end

