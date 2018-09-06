require 'spec_helper'

describe AlaveteliFeatures::Constraints::FeatureConstraint do
  let(:test_backend) { Flipper.new(Flipper::Adapters::Memory.new) }

  before do
    AlaveteliFeatures.backend = test_backend
  end

  describe "#matches?" do
    it "should return true when a feature is enabled" 


    it "should return false when a feature is disabled" 

  end
end

