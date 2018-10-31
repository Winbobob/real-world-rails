require 'rails_helper'

describe API::Entities::CCR::AdaptedExpense, type: :adapter do
  subject(:response) { JSON.parse(described_class.represent(expense).to_json) }

  let(:expense) { create(:expense, :bike_travel, location: 'A court') }

  describe 'exposes the correct keys' do
    subject { JSON.parse(described_class.represent(expense).to_json) }

    it 'exposes the correct keys' 

  end

  it 'exposes expected json key-value pairs' 

end

