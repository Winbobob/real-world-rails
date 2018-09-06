require "spec_helper"

RSpec.describe FeatureFlagHelper, type: :helper do

  before(:each) do
    RequestStore.begin!
    RequestStore.store[:feature_flags] = [:stable_feature].to_set
  end

  after(:each) do
    RequestStore.end!
    RequestStore.clear!
  end


  describe "#feature_enabled?" do
    it "returns false for disabled feature" 


    it "returns true for enabled feature" 

  end

  describe "#with_feature" do
    it "does not run block for disabled feature" 


    it "runs block for enabled feature" 

  end

  describe "fetch_temp_flags" do
    let(:session) { {feature_flags: [:shipping].to_set} }
    let(:params) { {enable_feature: "booking"} }

    it "fetches temporary flags from session and params" 


    it "returns empty set if not admin" 

  end
end

