require 'spec_helper'

describe MarkChargeAsPaidAction do
  let(:charge) { create(:charge, card: nil, paid: false)}
  let(:stripe_charge) { { id: 1, source: JSON.parse('{"test": "test"}') }}

  describe '#call' do
    before(:each) { MarkChargeAsPaidAction.new(charge, stripe_charge).call }

    it 'sets charge.paid to be true' 


    it 'updates charge id' 


    it 'updates charge card' 


    it 'creates new log entry for charge' 

  end
end

