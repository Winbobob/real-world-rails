require 'rails_helper'

describe Fee::MiscFeePresenter do

  let(:misc_fee) { instance_double(Fee::MiscFee, claim: double, quantity_is_decimal?: false, errors: {quantity: [] }) }
  let(:presenter) { Fee::MiscFeePresenter.new(misc_fee, view) }

  context '#rate' do
    it 'should call not_applicable when belonging to an LGFS claim' 


    it 'should return number as currency for calculated fees belonging to an AGFS claim' 


    it 'should return not_applicable for uncalculated fees belonging to an AGFS claim' 

  end

  context '#quantity' do
    it 'should return fee quantity when belonging to an AGFS claim' 


    it 'should return not_applicable when belonging to an LGFS claim' 

  end

end

