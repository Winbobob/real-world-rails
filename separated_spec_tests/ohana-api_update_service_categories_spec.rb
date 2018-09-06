require 'rails_helper'

describe 'PUT /services/:service_id/categories' do
  before(:all) do
    create_service
  end

  after(:all) do
    Organization.find_each(&:destroy)
  end

  it 'returns 200 when validations pass' 

end

