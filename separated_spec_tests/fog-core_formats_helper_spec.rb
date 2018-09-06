require "spec_helper"
require "fog/test_helpers/formats_helper"
require "fog/test_helpers/types_helper"

module Shindo
  class Tests
    def test(_str, &_block)
      yield
    end
  end
end

describe "formats_helper" do
  let(:shindo) { Shindo::Tests.new }

  it "comparing welcome data against schema" 


  describe "#data_matches_schema" do
    it "when value matches schema expectation" 


    it "when values within an array all match schema expectation" 


    it "when nested values match schema expectation" 


    it "when collection of values all match schema expectation" 


    it "when collection is empty although schema covers optional members" 


    it "when additional keys are passed and not strict" 


    it "when value is nil and schema expects NilClass" 


    it "when value and schema match as hashes" 


    it "when value and schema match as arrays" 


    it "when value is a Time" 


    it "when key is missing but value should be NilClass (#1477)" 


    it "when key is missing but value is nullable (#1477)" 

  end

  describe "#formats backwards compatible changes" do

    it "when value matches schema expectation" 


    it "when values within an array all match schema expectation" 


    it "when nested values match schema expectation" 


    it "when collection of values all match schema expectation" 


    it "when collection is empty although schema covers optional members" 


    it "when additional keys are passed and not strict" 


    it "when value is nil and schema expects NilClass" 


    it "when value and schema match as hashes" 


    it "when value and schema match as arrays" 


    it "when value is a Time" 


    it "when key is missing but value should be NilClass (#1477)" 


    it "when key is missing but value is nullable (#1477)" 

  end
end

