require 'rails_helper'

describe Fee::InterimFeePresenter do

  let(:interim_fee) { instance_double(Fee::InterimFee, claim: double, quantity_is_decimal?: false, errors: { quantity: []}) }
  let(:presenter) { Fee::InterimFeePresenter.new(interim_fee, view) }

  context 'retrieves fields from the claim' do
    [:effective_pcmh_date, :first_day_of_trial, :retrial_started_at, :trial_concluded_at,
     :legal_aid_transfer_date, :estimated_trial_length, :retrial_estimated_length].each do |field|
      it "retrieves #{field} from the claim" 

    end
  end

  context '#rate' do
    it 'should call not_applicable' 

  end

  context '#quantity' do
    it 'should return fee quantity for all interim fees except interim warrants' 


    it 'should return nil for interim warrants' 

  end

  context '#amount' do
    it 'should return fee amount for interim warrants' 

    it 'should return fee amount for any any other interim fee' 

  end

end

