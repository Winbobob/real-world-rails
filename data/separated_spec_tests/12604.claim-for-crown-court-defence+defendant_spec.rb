require 'rails_helper'

describe API::Entities::CCR::Defendant do
  subject(:response) { JSON.parse(described_class.represent(defendant).to_json).deep_symbolize_keys }

  let(:claim) { create(:advocate_claim) }
  let(:rep_orders) { create_list(:representation_order, 1, uuid: 'uuid', maat_reference: '1234567890', representation_order_date: Date.new(2016, 1, 10)) }

  let(:defendant) do
    create(:defendant,
      uuid: 'uuid',
      first_name: 'Kaia',
      last_name: 'Casper',
      date_of_birth: Date.new(1995, 6, 20),
      representation_orders: rep_orders,
      claim: claim,
      created_at: @created_at
    )
  end

  it 'has expected json key-value pairs' 


  it 'returns main defendant true for the defendant created first' 


  it 'returns main defendant false for defendant created after other defendants' 


  it 'returns representation order' 


end

