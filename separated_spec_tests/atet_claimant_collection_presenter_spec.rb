require 'rails_helper'

RSpec.describe ClaimantCollectionPresenter, type: :presenter do
  let(:claimant_collection_presenter) { described_class.new claim }

  let(:claim) { create :claim }

  describe '#group_claim' do
    context 'with secondary claimants csv' do
      it 'returns "Yes"' 

    end

    context 'with secondary claimants' do
      let(:claim) { create :claim, :without_additional_claimants_csv, :with_secondary_claimants }

      it 'returns "Yes"' 

    end

    context 'without secondary claimants' do
      let(:claim) { create :claim, :single_claimant }

      it 'returns "No"' 

    end
  end

  describe '#each_item' do
    it 'yields each attribute and name to block' 

  end

  describe '#children' do
    let(:claim) { create :claim, :without_additional_claimants_csv, :with_secondary_claimants }

    describe 'encapsulates each secondary claimant in a claimant presenter' do
      it { expect(claimant_collection_presenter.children.first).to be_a ClaimantCollectionPresenter::ClaimantPresenter }
      it { expect(claimant_collection_presenter.children.first.target).to eq claim.secondary_claimants.first }
    end
  end
end

