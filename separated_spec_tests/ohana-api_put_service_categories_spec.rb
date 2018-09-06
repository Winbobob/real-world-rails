require 'rails_helper'

describe 'PUT /services/:service_id/categories' do
  before(:all) do
    create_service
    @food = Category.create!(name: 'Food', taxonomy_id: '101')
  end

  after(:all) do
    Organization.find_each(&:destroy)
    Category.find_each(&:destroy)
  end

  context 'when the passed in taxonomy_id exists' do
    it "updates a service's categories" 

  end

  context "when the passed in taxonomy_id doesn't exist" do
    it 'ignores it' 

  end

  context 'without a valid token' do
    it 'returns a 401 error' 

  end
end

