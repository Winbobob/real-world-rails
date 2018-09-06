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

