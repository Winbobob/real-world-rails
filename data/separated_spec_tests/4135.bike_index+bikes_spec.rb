require 'spec_helper'

describe 'Bikes API V2' do
  let(:manufacturer) { FactoryGirl.create(:manufacturer) }
  let(:color) { FactoryGirl.create(:color) }
  JSON_CONTENT = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }.freeze

  describe 'find by id' do
    it 'returns one with from an id' 


    it 'responds with missing' 

  end

  describe 'create' do
    let(:bike_attrs) do
      {
        serial: '69 non-example',
        manufacturer: manufacturer.name,
        rear_tire_narrow: 'true',
        rear_wheel_bsd: '559',
        color: color.name,
        year: '1969',
        owner_email: 'fun_times@examples.com'
      }
    end
    before :each do
      create_doorkeeper_app(scopes: 'read_bikes write_bikes')
      FactoryGirl.create(:wheel_size, iso_bsd: 559)
      FactoryGirl.create(:cycle_type, slug: 'bike')
      FactoryGirl.create(:propulsion_type, name: 'Foot pedal')
    end

    it 'responds with 401' 


    it "fails if the token doesn't have write_bikes scope" 


    it 'creates a non example bike, with components' 


    it "doesn't send an email" 


    it 'creates an example bike' 


    it 'creates a stolen bike through an organization and uses the passed phone' 


    it 'does not register a stolen bike unless attrs are present' 

  end

  describe 'create v2_accessor' do
    let(:organization) { FactoryGirl.create(:organization) }
    let(:bike_attrs) do
      { 
        serial: '69 non-example',
        manufacturer: manufacturer.name,
        rear_tire_narrow: 'true',
        rear_wheel_bsd: '559',
        color: color.name,
        year: '1969',
        owner_email: 'fun_times@examples.com',
        organization_slug: organization.slug
      }
    end
    before :each do
      create_doorkeeper_app(with_v2_accessor: true)
      FactoryGirl.create(:wheel_size, iso_bsd: 559)
      FactoryGirl.create(:cycle_type, slug: 'bike')
      FactoryGirl.create(:propulsion_type, name: 'Foot pedal')
      @tokenized_url = "/api/v2/bikes?access_token=#{@accessor_token.token}"
    end

    it 'also sets front wheel bsd' 


    it 'creates a bike for organization with v2_accessor' 


    it "doesn't create a bike without an organization with v2_accessor" 


    it "fails to create a bike if the app owner isn't a member of the organization" 

  end

  describe 'update' do
    let(:params) { { year: 1999, serial_number: 'XXX69XXX' } }
    let(:url) { "/api/v2/bikes/#{bike.id}?access_token=#{@token.token}" }
    let(:bike) { FactoryGirl.create(:ownership, creator_id: @user.id).bike }
    before :each do
      create_doorkeeper_app(scopes: 'read_user write_bikes')
    end

    it "doesn't update if user doesn't own the bike" 


    it "doesn't update if not in scope" 


    it "fails to update bike if required stolen attrs aren't present" 


    it "updates a bike, adds a stolen record, doesn't update locked attrs" 


    it 'updates a bike, adds and removes components' 


    it "doesn't remove components that aren't the bikes" 


    it 'claims a bike and updates if it should' 

  end

  describe 'image' do
    it "doesn't post an image to a bike if the bike isn't owned by the user" 


    it 'errors on non whitelisted extensions' 


    it 'posts an image' 

  end

  describe 'send_stolen_notification' do
    let(:bike) { FactoryGirl.create(:ownership, creator_id: @user.id).bike }
    let(:params) { { message: "Something I'm sending you" } }
    let(:url) { "/api/v2/bikes/#{bike.id}/send_stolen_notification?access_token=#{@token.token}" }
    before :each do
      create_doorkeeper_app(scopes: 'read_user')
      bike.update_attribute :stolen, true
    end

    it 'fails to send a stolen notification without read_user' 


    it "fails if the bike isn't stolen" 


    it "fails if the bike isn't owned by the access token user" 


    it 'sends a notification' 

  end
end

