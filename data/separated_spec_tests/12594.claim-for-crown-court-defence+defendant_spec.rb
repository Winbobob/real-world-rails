require 'rails_helper'

describe API::Entities::Defendant do

  let(:rep_orders) { build_list(:representation_order, 1, uuid: 'uuid', maat_reference: '1234567890', representation_order_date: Date.new(2016, 1, 10)) }
  let(:defendant) { build(:defendant, uuid: 'uuid', first_name: 'Kaia', last_name: 'Casper', date_of_birth: Date.new(1995, 6, 20), representation_orders: rep_orders) }

  it 'represents the defendant entity' 

end

