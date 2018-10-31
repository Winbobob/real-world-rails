require 'rails_helper'

describe 'GET /categories' do
  before :all do
    @food = Category.create!(name: 'Food', taxonomy_id: '101')
    @emergency = Category.create!(name: 'Emergency', taxonomy_id: '103')
  end

  before :each do
    get api_categories_url(subdomain: ENV['API_SUBDOMAIN'])
  end

  after(:all) do
    Category.find_each(&:destroy)
  end

  it 'displays all categories' 


  it 'returns a 200 status' 


  it 'includes the id attribute in the serialization' 


  it 'includes the depth attribute in the serialization' 


  it 'includes the taxonomy_id attribute in the serialization' 


  it 'includes the name attribute in the serialization' 


  it 'includes the parent_id attribute in the serialization' 

end

