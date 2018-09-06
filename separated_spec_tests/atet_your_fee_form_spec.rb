require 'rails_helper'

RSpec.describe YourFeeForm, type: :form do
  it_behaves_like("a Form", remission_claimant_count: 0)

  let(:your_fee_form) { described_class.new claim }
  let(:claim) { Claim.create }

  describe 'validations' do
    describe '#remission_claimant_count' do
      before { 10.times { claim.claimants.create } }

      context 'when it is > total number of claimants' do
        before do
          your_fee_form.remission_claimant_count = 11
          your_fee_form.valid?
        end

        it 'is not valid' 

      end

      context 'when it is == total number of claimants' do
        before do
          your_fee_form.remission_claimant_count = 10
          your_fee_form.valid?
        end

        it 'is valid' 

      end

      context 'when it is < total number of claimants' do
        before do
          your_fee_form.remission_claimant_count = 9
          your_fee_form.valid?
        end

        it 'is valid' 

      end
    end
  end

  describe 'setting remission_claimant_count on save' do
    context 'when remission_claimant_count is nil' do
      before do
        your_fee_form.remission_claimant_count = nil
        your_fee_form.save
      end

      it 'sets remission_claimant_count as 0' 

    end

    context 'when remission_claimant_count is not nil' do
      before do
        claim.create_primary_claimant
        your_fee_form.remission_claimant_count = 1
        your_fee_form.save
      end

      it 'sets remission_claimant_count as 0' 

    end
  end

  describe '#secondary_claimants?' do
    context 'secondary_claimants' do
      before { claim.additional_claimants_csv_record_count = 0 }

      it 'returns true when not empty' 


      it 'returns false when empty' 

    end

    context 'additional_claimants_csv_record_count' do
      before { claim.secondary_claimants.delete_all }

      it 'returns true when greater than zero' 


      it 'returns false when zero' 

    end
  end

  describe '#applying_for_remission=' do
    describe 'when called with "true"' do
      before { your_fee_form.applying_for_remission = 'true' }

      it 'sets remission_claimant_count to 1' 

    end

    describe 'when called with "false"' do
      before { your_fee_form.applying_for_remission = 'false' }

      it 'sets remission_claimant_count to 0' 

    end
  end

  describe '#applying_for_remission' do
    context 'when remission_claimant_count is nil' do
      before { your_fee_form.remission_claimant_count = nil }

      it 'is nil' 

    end

    context 'when remission_claimant_count is 0' do
      before { your_fee_form.remission_claimant_count = 0 }

      it 'is nil' 

    end

    context 'when remission_claimant_count is > 0' do
      before { your_fee_form.remission_claimant_count = 1 }

      it 'is nil' 

    end
  end
end

