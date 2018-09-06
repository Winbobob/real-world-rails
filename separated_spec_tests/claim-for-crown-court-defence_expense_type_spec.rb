require 'rails_helper'

describe API::Entities::ExpenseType do

  let(:expense_type) { instance_double(::ExpenseType, id: 123, name: 'Travel time', unique_code: 'TRAVL', roles: ['agfs'], reason_set: 'B') }

  it 'represents the expense type entity' 

end

