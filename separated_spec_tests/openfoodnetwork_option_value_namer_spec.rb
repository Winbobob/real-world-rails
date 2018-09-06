require 'spec_helper'

module OpenFoodNetwork
  describe OptionValueNamer do
    describe "generating option value name" do
      let(:v) { Spree::Variant.new }
      let(:subject) { OptionValueNamer.new }

      it "when description is blank" 


      it "when description is present" 


      it "when value is blank and description is present" 


      it "spaces value and unit when value is unscaled" 

    end

    describe "determining if a variant's value is scaled" do
      it "returns true when the product has a scale" 


      it "returns false otherwise" 

    end

    describe "generating option value's value and unit" do
      let(:v) { Spree::Variant.new }
      let(:subject) { OptionValueNamer.new v }

      it "generates simple values" 


      it "generates values when unit value is non-integer" 


      it "returns a value of 1 when unit value equals the scale" 


      it "generates values for all weight scales" 


      it "generates values for all volume scales" 


      it "chooses the correct scale when value is very small" 


      it "generates values for item units" 


      it "generates singular values for item units when value is 1" 


      it "returns [nil, nil] when unit value is not set" 

    end
  end
end

