require 'rails_helper'

describe API::Entities::Expense do

  let(:expense) { build(:expense, :car_travel, date: Date.new(1995, 6, 20), location: 'Here', quantity: 148.0, rate: 0.25, amount: 37.0, vat_amount: 5.2) }

  it 'represents the expense entity' 

end

