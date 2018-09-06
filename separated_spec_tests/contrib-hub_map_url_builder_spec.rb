require 'spec_helper'

describe MapUrlBuilder do
  let(:data) { [ {latitude: 67, longitude: 67}, {latitude: 40, longitude: 40} ] }
  let(:user) { build(:user) }
  let(:repos) { [ build(:repo), build(:repo) ] }

  describe "#add_marker" do
    it "builds one single marker correctly" 

  end

  describe "#add_markers" do
    it "builds multiple markers correctly" 

  end

  describe ".user_profile_map" do
    it "builds user profile map specific dimensions" 

  end

  describe ".search_results_map" do
    it "builds search results map specific dimensions" 

  end

  describe "edge cases" do
    it "builds a valid map without markers when no data is provided" 

  end
end

