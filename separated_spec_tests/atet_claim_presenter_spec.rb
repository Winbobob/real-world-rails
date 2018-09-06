require 'rails_helper'

RSpec.describe JaduXml::ClaimPresenter, type: :presenter do
  let(:jadu_xml_claim_presenter) { described_class.new claim }

  let(:claim) { Claim.new }

  describe "decorated methods" do
    it { expect(jadu_xml_claim_presenter.claimants).to be_kind_of Enumerable }
    it { expect(jadu_xml_claim_presenter.document_id).to eq claim }
    it { expect(jadu_xml_claim_presenter.submission_channel).to eq "Web" }

    describe "#case_type" do
      context "single claimant" do
        it "returns 'Single'" 

      end

      context "multiple claimants" do
        it "returns 'Multiple'" 

      end
    end

    describe "#jurisdiction" do
      context "discrimination or unfair dismissal is true" do
        it "returns 2" 

      end

      context "discrimination or unfair dismissal is false" do
        it "returns 1" 

      end
    end

    describe '#office_code' do
      it "delegates to the claims office" 


      it "allows nils" 

    end

    describe "#date_of_receipt" do
      let(:time) { Time.current }

      it "returns the claims submitted at time" 

    end

    describe "#remission_indicated" do
      context "remission requested" do
        it "returns 'Indicated'" 

      end

      context "remission not requested" do
        it "returns 'NotRequested'" 

      end
    end

    it { expect(jadu_xml_claim_presenter.administrator).to eq(-1) }
    it { expect(jadu_xml_claim_presenter.representative).to be_kind_of Array }
    it { expect(jadu_xml_claim_presenter.payment).to eq claim }

    describe "#files" do
      it "delegates to the 'represented' method" 

    end
  end
end

