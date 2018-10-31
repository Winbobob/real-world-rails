require 'rails_helper'

describe IntegerSettingValidator do
  describe '#valid_value?' do

    shared_examples "for all IntegerSettingValidator opts" do
      it "returns false for blank values" 


      it "returns false if value is not a valid integer" 

    end

    context "without min and max" do
      subject(:validator) { described_class.new }

      include_examples "for all IntegerSettingValidator opts"

      it "returns true if value is a valid integer" 


      it "defaults min to 0" 


      it "defaults max to 2_000_000_000" 

    end

    context "with min" do
      subject(:validator) { described_class.new(min: 2) }

      include_examples "for all IntegerSettingValidator opts"

      it "returns true if value is equal to min" 


      it "returns true if value is greater than min" 


      it "returns false if value is less than min" 

    end

    context "with max" do
      subject(:validator) { described_class.new(max: 3) }

      include_examples "for all IntegerSettingValidator opts"

      it "returns true if value is equal to max" 


      it "returns true if value is less than max" 


      it "returns false if value is greater than min" 

    end

    context "with min and max" do
      subject(:validator) { described_class.new(min: -1, max: 3) }

      include_examples "for all IntegerSettingValidator opts"

      it "returns true if value is in range" 


      it "returns false if value is out of range" 

    end

    context "when setting is hidden" do
      subject(:validator) { described_class.new(hidden: true) }

      it "does not impose default validations" 

    end
  end
end

