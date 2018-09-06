require "spec_helper"
require "fog/test_helpers/formats_helper"
require "fog/schema/data_validator"

describe "SchemaValidator" do
  let(:validator) { Fog::Schema::DataValidator.new }

  describe "#validate" do
    it "returns true when value matches schema expectation" 


    it "returns true when values within an array all match schema expectation" 


    it "returns true when nested values match schema expectation" 


    it "returns true when collection of values all match schema expectation" 


    it "returns true when collection is empty although schema covers optional members" 


    it "returns true when additional keys are passed and not strict" 


    it "returns true when value is nil and schema expects NilClass" 


    it "returns true when value and schema match as hashes" 


    it "returns true when value and schema match as arrays" 


    it "returns true when value is a Time" 


    it "returns true when key is missing but value should be NilClass (#1477)" 


    it "returns true when key is missing but value is nullable (#1477)" 


    it "returns false when value does not match schema expectation" 


    it "returns false when key formats do not match" 


    it "returns false when additional keys are passed and strict" 


    it "returns false when some keys do not appear" 


    it "returns false when collection contains a member that does not match schema" 


    it "returns false when collection has multiple schema patterns" 


    it "returns false when hash and array are compared" 


    it "returns false when array and hash are compared" 


    it "returns false when a hash is expected but another data type is found" 


    it "returns false when key is missing but value should be NilClass (#1477)" 


    it "returns false when key is missing but value is nullable (#1477)" 

  end
end

