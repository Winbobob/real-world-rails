require 'rails_helper'

describe 'PATCH /locations/:location_id/services/:id' do
  before(:all) do
    create_service
  end

  before(:each) do
    @attrs = attributes_for(:service_with_extra_whitespace)
  end

  after(:all) do
    Organization.find_each(&:destroy)
  end

  let(:expected_attributes) do
    {
      accepted_payments: %w[Cash Credit],
      alternate_name: 'AKA',
      audience: 'Low-income seniors',
      description: 'SNAP market',
      eligibility: 'seniors',
      email: 'foo@example.com',
      fees: 'none',
      funding_sources: %w[County],
      application_process: 'in person',
      interpretation_services: 'CTS LanguageLink',
      keywords: %w[health yoga],
      languages: %w[French English],
      name: 'Benefits',
      required_documents: %w[ID],
      service_areas: %w[Belmont],
      status: 'active',
      website: 'http://www.monfresh.com',
      wait_time: '2 days'
    }
  end

  let(:array_attributes) do
    %w[accepted_payments funding_sources keywords languages required_documents service_areas]
  end

  it 'returns 200 when validations pass' 


  it "updates the location's service" 


  it "doesn't add a new service" 


  it 'requires a valid service id' 


  it 'returns 422 when attribute is invalid' 


  it 'does not change current value of Array attributes if passed in value is an empty String' 


  it "doesn't allow updating a service without a valid token" 


  it 'updates search index when service changes' 

end

