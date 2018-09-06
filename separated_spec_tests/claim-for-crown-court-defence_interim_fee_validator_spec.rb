require 'rails_helper'

RSpec.describe Fee::InterimFeeValidator, type: :validator do
  # note: before validation hook sets nil to zero
  shared_examples 'quantity numericality between' do |min, max|
    it "valid when between #{min} and #{max}" 


    it "invalid when greater than #{max}" 


    it "invalid when less than #{min}" 

  end

  let(:fee) { build :interim_fee }
  let(:trial_start) { build :interim_fee, :retrial_start }
  let(:retrial_start) { build :interim_fee, :retrial_start }
  let(:retrial_new_solicitor) { build :interim_fee, :retrial_new_solicitor }
  let(:effective_pcmh) { build :interim_fee, :effective_pcmh }
  let(:disbursement_fee) { build :interim_fee, :disbursement }
  let(:interim_warrant_fee) { build :interim_fee, :warrant }

  before(:each) do
    allow(fee).to receive(:perform_validation?).and_return(true)
    allow(disbursement_fee).to receive(:perform_validation?).and_return(true)
    allow(interim_warrant_fee).to receive(:perform_validation?).and_return(true)
  end

  context 'assume valid fees' do
    it 'fee is valid' 


    it 'disbursement_fee is valid' 


    it 'interim_warrant_fee is valid' 

  end

  describe '#validate_rate' do
    context 'disbursement fee' do
      it 'invalid if present' 

    end

    context 'warrant fee' do
      it 'invalid if present' 

    end

    context 'other fee' do
      it 'invalid if present' 

    end
  end

  describe '#validate_quantity' do
    context 'disbursement fee' do
      it 'valid if nil/zero' 


      it 'invalid if present/non-zero' 

    end

    context 'warrant fee' do
      it 'valid if nil/zero' 


      it 'invalid if present/non-zero' 

    end

    context 'effective PCMH fee' do
      include_examples 'quantity numericality between', 0, 99999 do
        let(:fee) { effective_pcmh }
      end
    end

    context 'trial start fee' do
      include_examples 'quantity numericality between', 1, 99999 do
        let(:fee) { trial_start }
      end
    end

    context 'retrial start fee' do
      include_examples 'quantity numericality between', 1, 99999 do
        let(:fee) { retrial_start }
      end
    end

    context 'retrial new solicitor fee' do
      include_examples 'quantity numericality between', 0, 99999 do
        let(:fee) { retrial_new_solicitor }
      end
    end
  end

  describe '#validate_amount' do
    include_examples 'common amount validations'

    context 'disbursement fee' do
      it 'is invalid if present' 

    end

    context 'warrant fee' do
      it 'is invalid if absent' 

    end
  end

  describe '#fee_type' do
    it 'is not valid when fee type is not an InterimFeeType' 

  end

  describe 'interim warrant fee' do
    it 'should validate there are no disbursements in the claim' 

  end

  describe 'disbursement only interim fee' do
    it 'should validate existence of disbursements in the claim' 

  end

  describe 'any other interim fee type' do
    it 'should allow having disbursements in the claim' 

  end

  describe 'common warrant fee validations' do
    # TODO: share these with warrant fee validator spec
    let(:fee) { interim_warrant_fee }

    describe '#validate_warrant_issued_date' do
      it 'should be valid if present and in the past' 


      it 'should be invalid if present and too far in the past' 


      it 'should be invalid if present and in the future' 


      it 'should be invalid if not present' 

    end

    describe '#validate_warrant_executed_date' do
      it 'should raise error if before warrant_issued_date' 


      it 'should raise error if in future' 


      it 'should not raise error if absent' 


      it 'should not raise error if present and in the past' 

    end
  end
end

