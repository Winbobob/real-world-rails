require 'rails_helper'

describe 'Create an organization (POST /organizations/)' do
  before(:all) do
    create(:organization)
  end

  before(:each) do
    @org_attributes = {
      accreditations: ['BBB', 'State Board of Education'],
      alternate_name: 'Alternate Name',
      date_incorporated: 'January 01, 1970',
      description: 'description',
      email: 'org@test.com',
      funding_sources: %w[State Donations Grants],
      legal_status: 'non-profit',
      licenses: ['State Health Inspection License'],
      name: 'New Org',
      tax_id: '123-abc',
      tax_status: '501(c)(3)',
      website: 'https://foo.org'
    }
  end

  after(:all) do
    Organization.find_each(&:destroy)
  end

  it 'creates an organization with valid attributes' 


  it 'returns a Location header with the URL to the new organization' 


  it "doesn't create an organization with invalid attributes" 


  it "doesn't allow creating an organization without a valid token" 

end

