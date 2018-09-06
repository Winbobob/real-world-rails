require "helper"
require "thor/parser"

describe Thor::Option do
  def parse(key, value)
    Thor::Option.parse(key, value)
  end

  def option(name, options = {})
    @option ||= Thor::Option.new(name, options)
  end

  describe "#parse" do
    describe "with value as a symbol" do
      describe "and symbol is a valid type" do
        it "has type equals to the symbol" 


        it "has no default value" 

      end

      describe "equals to :required" do
        it "has type equals to :string" 


        it "has no default value" 

      end

      describe "and symbol is not a reserved key" do
        it "has type equal to :string" 


        it "has no default value" 

      end
    end

    describe "with value as hash" do
      it "has default type :hash" 


      it "has default value equal to the hash" 

    end

    describe "with value as array" do
      it "has default type :array" 


      it "has default value equal to the array" 

    end

    describe "with value as string" do
      it "has default type :string" 


      it "has default value equal to the string" 

    end

    describe "with value as numeric" do
      it "has default type :numeric" 


      it "has default value equal to the numeric" 

    end

    describe "with value as boolean" do
      it "has default type :boolean" 


      it "has default value equal to the boolean" 

    end

    describe "with key as a symbol" do
      it "sets the name equal to the key" 

    end

    describe "with key as an array" do
      it "sets the first items in the array to the name" 


      it "sets all other items as aliases" 

    end
  end

  it "returns the switch name" 


  it "returns the human name" 


  it "converts underscores to dashes" 


  it "can be required and have default values" 


  it "raises an error if default is inconsistent with type and check_default_type is true" 


  it "does not raises an error if default is an symbol and type string and check_default_type is true" 


  it "does not raises an error if default is inconsistent with type and check_default_type is false" 


  it "boolean options cannot be required" 


  it "does not raises an error if default is a boolean and it is required" 


  it "allows type predicates" 


  it "raises an error on method missing" 


  describe "#usage" do
    it "returns usage for string types" 


    it "returns usage for numeric types" 


    it "returns usage for array types" 


    it "returns usage for hash types" 


    it "returns usage for boolean types" 


    it "does not use padding when no aliases are given" 


    it "documents a negative option when boolean" 


    it "does not document a negative option for a negative boolean" 


    it "documents a negative option for a positive boolean starting with 'no'" 


    it "uses banner when supplied" 


    it "checks when banner is an empty string" 


    describe "with required values" do
      it "does not show the usage between brackets" 

    end

    describe "with aliases" do
      it "does not show the usage between brackets" 


      it "does not negate the aliases" 

    end
  end
end

