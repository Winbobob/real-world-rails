require 'rails_helper'

describe StringSettingValidator do

  describe '#valid_value?' do
    shared_examples "for all StringSettingValidator opts" do
      it "returns true for blank values" 

    end

    context 'with a regex' do
      subject(:validator) { described_class.new(regex: 'bacon') }

      include_examples "for all StringSettingValidator opts"

      it "returns true if value matches the regex" 


      it "returns false if the value doesn't match the regex" 


      it "test some other regexes" 

    end

    context 'with min' do
      subject(:validator) { described_class.new(min: 2) }

      include_examples "for all StringSettingValidator opts"

      it "returns true if length is ok" 


      it "returns false if too short" 

    end

    context 'with max' do
      subject(:validator) { described_class.new(max: 5) }

      include_examples "for all StringSettingValidator opts"

      it "returns true if length is ok" 


      it "returns false if too long" 

    end

    context 'combinations of options' do
      it "min and regex" 


      it "max and regex" 


      it "min and max" 


      it "min, max, and regex" 

    end

  end

end

