require 'rails_helper'

describe API::Entities::Fee do

  let(:fee) { build(:interim_fee, :warrant, date: Date.new(1995, 6, 20), quantity: 148.0, amount: 37.0) }

  it 'represents the fee entity' 

end

