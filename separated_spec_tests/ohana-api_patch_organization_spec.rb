require 'rails_helper'

describe 'PATCH /organizations/:id' do
  before(:all) do
    loc_with_org = create(:location)
    @org = loc_with_org.organization
  end

  before(:each) do
    @org.reload
  end

  after(:all) do
    Organization.find_each(&:destroy)
  end

  let(:valid_attributes) do
    {
      accreditations: ['BBB', 'State Board of Education'],
      alternate_name: 'Alternate Name',
      date_incorporated: 'January 01, 1970',
      description: 'description',
      email: 'org@test.com',
      funding_sources: %w[State Donations Grants],
      legal_status: 'non-profit',
      licenses: ['State Health Inspection License'],
      name: 'New Name',
      tax_id: '123-abc',
      tax_status: '501(c)(3)',
      website: 'https://foo.org'
    }
  end

  it 'returns 200 when validations pass' 


  it 'returns the updated organization when validations pass' 


  it 'returns 422 when attribute is invalid' 


  it 'returns 422 when required attribute is missing' 


  it 'returns 404 when id is missing' 


  it 'updates the search index when organization name changes' 


  it "doesn't allow updating an organization without a valid token" 


  it 'is accessible by its old slug' 

end

