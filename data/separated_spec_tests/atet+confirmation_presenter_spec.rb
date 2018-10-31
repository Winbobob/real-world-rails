require 'rails_helper'

RSpec.describe ConfirmationPresenter, type: :presenter do
  let(:confirmation_presenter) { described_class.new claim }

  let(:claim) { create :claim }

  around do |example|
    travel_to(Time.new(2014).utc) { example.run }
  end

  describe 'submission_information' do
    context 'when there is an associated fee office' do
      before { claim.build_office name: 'Brum', address: 'Brum lane, B1 1AA' }

      context 'and no claimants seeking remission' do
        it 'has the submitted date, the name, and address of the fee centre' 

      end

      context 'and claimants are seeking remission' do
        before { claim.remission_claimant_count = 1 }

        it 'is the submission date' 

      end
    end

    context 'when there is no associated fee office' do
      let(:claim) { create :claim, :no_fee_group_reference }

      it 'is the submission date' 

    end
  end

  it { expect(confirmation_presenter.attachments).to eq 'file.rtf<br />file.csv' }

  describe '#each_item' do
    it 'yields the submission information' 


    context 'when payment fails' do
      let(:claim) { create :claim, :payment_no_remission_payment_failed }

      it 'yields payment failure message' 

    end

    context 'when no payment applies' do
      let(:claim) { create :claim, :remission_only }

      it 'yields no payment or fee office information' 

    end

    context 'when no attachments were uploaded' do
      let(:claim) { create :claim, :no_attachments }

      it 'yields text to state no attachments are present' 

    end
  end
end

