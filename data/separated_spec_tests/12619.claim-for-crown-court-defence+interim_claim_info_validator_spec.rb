require 'rails_helper'

RSpec.describe InterimClaimInfoValidator, type: :validator do
  let(:info) { build(:interim_claim_info) }

  before do
    allow(info).to receive(:perform_validation?).and_return(true)
  end

  it 'is valid if warrant issued date is not set' 


  it 'is valid if warrant executed date is not set' 


  context 'when a warrant fee was paid in a previous interim claim' do
    let(:info) { build(:interim_claim_info, :with_warrant_fee_paid) }

    describe '#validate_warrant_issued_date' do
      it 'is valid if present and issued at least 3 months ago' 


      it 'is invalid if present and too far in the past' 


      it 'is invalid if present and in the future' 


      it 'is invalid if not present' 

    end

    describe '#validate_warrant_executed_date' do

      it 'is invalid if before warrant_issued_date' 


      it 'is invalid if present and too far in the past' 


      it 'is invalid if in future' 


      it 'is invalid if absent' 


      it 'is valid if present and in the past' 

    end
  end
end

