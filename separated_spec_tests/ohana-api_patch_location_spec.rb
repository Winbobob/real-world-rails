require 'rails_helper'

describe 'PATCH /locations/:id)' do
  let(:attributes) do
    {
      accessibility: %w[disabled_parking ramp],
      active: true,
      admin_emails: [' foo@test.com  ', 'bar@test.com'],
      alternate_name: 'Different Name',
      description: 'test location',
      email: 'test@test.com',
      languages: %w[French Tagalog],
      latitude: 37.3180168,
      longitude: -122.2743951,
      name: 'Test Location',
      short_desc: 'short description',
      transportation: 'BART stop 1 block away.',
      website: 'https://www.example.com',
      virtual: false
    }
  end

  before(:each) do
    @loc = create(:location)
  end

  it 'returns the updated location when validations pass' 


  it 'does not modify admin_emails if set to empty string' 


  it 'does not modify admin_emails if set to a String' 


  it 'does not modify languages if set to empty string' 


  it 'sets languages to empty array if value is empty array' 


  it 'returns 422 when attribute is invalid' 


  it 'returns 422 when required attribute is missing' 


  it 'returns 404 when id is missing' 


  it 'updates the search index when location changes' 


  it 'is accessible by its old slug' 


  it "doesn't allow updating a location without a valid token" 

end

