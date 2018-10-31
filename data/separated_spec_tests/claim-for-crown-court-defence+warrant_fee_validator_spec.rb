require 'rails_helper'

RSpec.describe Fee::WarrantFeeValidator, type: :validator do
  let(:fee) { build :warrant_fee }

  before(:each) do
    allow(fee).to receive(:perform_validation?).and_return(true)
  end

  include_examples 'common amount validations'

  describe '#validate_warrant_issued_date' do
    it 'should be valid if present and issued at least 3 months ago' 


    it 'should be invalid if present and too far in the past' 


    it 'should be invalid if present and in the future' 


    it 'should be invalid if not present' 

  end

  describe '#validate_warrant_executed_date' do

    it 'should raise error if before warrant_issued_date' 


    it 'should be invalid if present and too far in the past' 


    it 'should raise error if in future' 


    it 'should not raise error if absent' 


    it 'should not raise error if present and in the past' 

  end
end

