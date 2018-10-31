# coding: utf-8
require 'spec_helper'

describe FeatureFlagService::API::Features do

  let(:test_flag) { :test_feature }
  let(:test_flag2) { :test_feature2 }
  let(:unknown_flag) { :unknown_feature }
  let(:features) { FeatureFlagService::API::Features.new(
    FeatureFlagService::Store::FeatureFlag.new(
    additional_flags: [test_flag, test_flag2]
  )) }
  let(:community_id) { 321 }
  let(:person_id) { "123" }

  context "#enable" do
    it "returns error if called with empty or nil features list" 


    it "enables the given supported feature for a person" 


    it "enables the given supported feature for a community" 


    it "does nothing if called with unknown feature" 

  end

  context "#disable" do
    it "returns error if called with empty or nil features list" 


    it "disables the given supported community feature" 


    it "disables the given supported person feature" 


    it "does nothing if called with unknown feature" 

  end

  context "#get" do
    it "returns a result with no features enabled when nothing recorded for a community or a person" 


    it "returns a result with no features enabled when nothing recorded for a community" 


    it "returns a result with no features enabled when nothing recorded for a person" 


    it "returns enabled features as a set for a community" 


    it "returns enabled features as a set for a person" 


    it "returns enabled features as a set for a community and a person" 

  end
end

