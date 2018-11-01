require "spec_helper"

describe Gitlab::GoogleCodeImport::Client do
  let(:raw_data) { JSON.parse(fixture_file("GoogleCodeProjectHosting.json")) }
  subject { described_class.new(raw_data) }

  describe "#valid?" do
    context "when the data is valid" do
      it "returns true" 

    end

    context "when the data is invalid" do
      let(:raw_data) { "No clue" }

      it "returns true" 

    end
  end

  describe "#repos" do
    it "returns only Git repositories" 

  end

  describe "#repo" do
    it "returns the referenced repository" 

  end
end

