require 'rails_helper'

describe Fee::WarrantFeePresenter do

  let(:warrant_fee) { instance_double(Fee::WarrantFee, claim: double) }
  let(:presenter) { Fee::WarrantFeePresenter.new(warrant_fee, view) }

  # DO NOT confuse Warrant Fees (XWAR) with Interim fees of warrant description/code (IWARR)
  context '#amount' do
    it 'should return fee amount as currency' 

  end

  context '#rate' do
    it 'should call not_applicable' 

  end

  context '#quantity' do
    it 'should call not_applicable' 

  end

  context '#warrant_issued_date' do
    it 'returns formatted date' 

  end

  context '#warrant_executed_date' do
    it 'returns formatted date' 

  end

  context '#warrant_executed?' do
    it 'returns true if date present' 


    it 'returns true if date present' 

  end

end

