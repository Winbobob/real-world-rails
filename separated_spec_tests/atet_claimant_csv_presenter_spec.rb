require 'rails_helper'

RSpec.describe ClaimantCsvPresenter, type: :presenter do
  let(:claimant_csv_presenter) { described_class.new claim }

  let(:claim) { create :claim }

  describe ".i18n_key" do
    it "returns the i18n_key" 

  end

  describe "#group_claim" do
    context "csv is present" do
      it "returns Yes" 

    end

    context "csv is not present" do
      it "returns No" 

    end
  end

  describe "#file_name" do
    it "returns the name of the file" 

  end

  describe "#number_claimants" do
    it "returns the number of claimant models in the csv" 

  end
end

