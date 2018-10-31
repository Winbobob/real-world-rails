require 'rails_helper'

describe 'GET /locations/:id' do
  context 'with valid id' do
    before :all do
      create_service
    end

    before(:each) do
      @location.reload
      get api_location_url(@location, subdomain: ENV['API_SUBDOMAIN'])
    end

    after(:all) do
      Organization.find_each(&:destroy)
    end

    it 'includes the location id' 


    it 'includes the accessibility attribute with localized text' 


    it 'includes the alternate_name attribute' 


    it 'includes the coordinates attribute' 


    it 'includes the description attribute' 


    it 'does not include the hours attribute' 


    it 'includes the latitude attribute' 


    it 'includes the longitude attribute' 


    it 'includes the name attribute' 


    it 'includes the short_desc attribute' 


    it 'includes the slug attribute' 


    it 'includes the updated_at attribute' 


    it 'includes the url attribute' 


    it 'includes the serialized address association' 


    it 'includes the serialized services association' 


    it 'includes the serialized organization association' 


    it 'includes the serialized mail_address association' 


    it 'displays contacts when present' 


    it 'displays phones when present' 


    it 'includes the serialized regular_schedules association' 


    it 'includes the serialized holiday_schedules association' 


    it 'is json' 


    it 'returns a successful status code' 

  end

  context 'with invalid id' do
    before :each do
      get api_location_url(1, subdomain: ENV['API_SUBDOMAIN'])
    end

    it 'returns a status key equal to 404' 


    it 'returns a helpful message' 


    it 'returns a 404 status code' 


    it 'is json' 

  end

  context 'with nil fields' do
    before(:each) do
      @loc = create(:loc_with_nil_fields)
    end

    it 'returns nil fields when visiting one location' 

  end

  describe 'ordering service categories by taxonomy_id' do
    before :each do
      @food = create(:category)
      @food_child = @food.children.
                    create!(name: 'Community Gardens', taxonomy_id: '101-01')
      @health = create(:health)
      @health_child = @health.children.
                      create!(name: 'Orthodontics', taxonomy_id: '102-01')
      create_service
      @service.category_ids = [
        @food.id, @food_child.id, @health.id, @health_child.id
      ]
    end

    it 'orders the categories by taxonomy_id' 

  end
end

