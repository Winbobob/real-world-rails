require 'rails_helper'

RSpec.describe Fee::GraduatedFeeValidator, type: :validator do
  include_context 'force-validation'

  let(:claim) { build :litigator_claim }
  let(:fee) { build :graduated_fee }

  before(:each) do
    allow(fee).to receive(:perform_validation?).and_return(true)
  end

  describe '#validate_claim' do
    it { should_error_if_not_present(fee, :claim, 'blank') }

    context 'when the fee is for an interim claim' do
      let(:claim) { build(:interim_claim) }
      let(:fee) { build(:graduated_fee, claim: claim) }

      it 'does not contain errors on the claim' 

    end

    context 'when the associated claim has no case type defined' do
      let(:claim) { build(:litigator_claim, case_type: nil) }
      let(:fee) { build(:graduated_fee, claim: claim) }

      it 'does not container an error on the claim case type' 

    end

    context 'when the associated claim has a fixed case type' do
      let(:case_type) { build(:case_type, :fixed_fee) }
      let(:claim) { build(:litigator_claim, case_type: case_type) }
      let(:fee) { build(:graduated_fee, claim: claim) }

      it 'is invalid as it can be associated with this type of claim' 

    end
  end

  describe '#validate_fee_type' do
    it { should_error_if_not_present(fee, :fee_type, 'blank') }
  end

  context 'assume valid fee' do
    it 'fee is valid' 

  end

  describe '#validate_quantity' do
    it 'numericality, must be between 0 and 999999' 

  end

  describe 'absence of unnecessary attributes' do
    it 'should validate absence of warrant issued date' 

    it 'should validate absence of warrant executed date' 

    it 'should validate absence of case-type-fee-sub-type' 

    it 'should validate absence of case numbers' 

  end

  include_examples 'common amount validations'
  include_examples 'common fee date validations'
end

