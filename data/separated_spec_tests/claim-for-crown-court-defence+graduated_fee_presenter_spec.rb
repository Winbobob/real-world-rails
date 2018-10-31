require 'rails_helper'

describe Fee::GraduatedFeePresenter do

  let(:grad_fee) { instance_double(Fee::GraduatedFee, claim: double, quantity_is_decimal?: false, errors: {quantity: []}) }
  let(:presenter) { Fee::GraduatedFeePresenter.new(grad_fee, view) }

  context '#rate' do
    it 'should call not_applicable ' 

  end

  context '#quantity' do
    it 'should return fee quantity' 

  end

end

