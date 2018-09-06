require 'rails_helper'

describe 'GET /categories/:category_id/children' do
  context 'when category has children' do
    before :all do
      @food = Category.create!(name: 'Food', taxonomy_id: '101')
      @food_child = @food.children.
                    create!(name: 'Emergency Food', taxonomy_id: '101-01')
    end

    before :each do
      get api_category_children_url(@food.taxonomy_id, subdomain: ENV['API_SUBDOMAIN'])
    end

    after(:all) do
      Category.find_each(&:destroy)
    end

    it 'returns a 200 status' 


    it 'includes the id attribute in the serialization' 


    it 'includes the depth attribute in the serialization' 


    it 'includes the taxonomy_id attribute in the serialization' 


    it 'includes the name attribute in the serialization' 


    it 'includes the parent_id attribute in the serialization' 

  end

  context "when category doesn't have children" do
    before :all do
      @food = Category.create!(name: 'Food', taxonomy_id: '101')
    end

    before :each do
      get api_category_children_url(@food.taxonomy_id, subdomain: ENV['API_SUBDOMAIN'])
    end

    after(:all) do
      Category.find_each(&:destroy)
    end

    it 'returns an empty array' 


    it 'returns a 200 status' 

  end
end

