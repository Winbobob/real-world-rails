require 'rails_helper'

describe ServicePresenter do
  before(:all) do
    DatabaseCleaner.clean_with(:truncation)
    create(:location)
  end

  after(:all) do
    Organization.find_each(&:destroy)
  end

  let(:properties) do
    {
      id: '1',
      location_id: '1',
      name: 'Literacy Program',
      description: 'Example description',
      application_process: 'Call',
      status: 'active'
    }
  end

  subject(:presenter) { ServicePresenter.new(properties) }

  describe '#to_service' do
    context 'when the service is valid' do
      it 'initializes a new service' 

    end

    context 'when the service is not valid' do
      let(:properties) do
        {
          id: '1',
          location_id: '1',
          description: 'Example description'
        }
      end

      it 'does not create a new service' 

    end

    context 'when the service already exists' do
      before do
        DatabaseCleaner.clean_with(:truncation)
        create(:service)
      end

      it 'does not create a new service' 

    end

    context 'when the service has comma-separated field values' do
      let(:properties) do
        {
          id: '1',
          location_id: '1',
          name: 'Literacy Program',
          description: 'Example description',
          application_process: 'Call',
          status: 'active',
          accepted_payments: 'one ,two',
          funding_sources: 'donations, grants ',
          keywords: ' foo, bar ',
          languages: 'English, Spanish',
          required_documents: 'Passport',
          service_areas: 'Atherton, Belmont'
        }
      end

      it 'transforms accepted_payments' 


      it 'transforms funding_sources' 


      it 'transforms keywords' 


      it 'transforms languages' 


      it 'transforms required_documents' 


      it 'transforms service_areas' 

    end

    context 'when the service has nil field values' do
      let(:properties) do
        {
          id: '1',
          location_id: '1',
          name: 'Example service',
          description: 'Example description',
          accepted_payments: nil,
          funding_sources: nil,
          keywords: nil,
          languages: nil,
          required_documents: nil,
          service_areas: nil
        }
      end

      it 'set accepted_payments to empty array' 


      it 'set funding_sources to empty array' 


      it 'set keywords to empty array' 


      it 'set languages to empty array' 


      it 'set required_documents to empty array' 


      it 'set service_areas to empty array' 

    end

    context 'ids are not sequential' do
      let(:properties) do
        {
          location_id: '1',
          id: '2',
          name: 'Example Service',
          description: 'Example description'
        }
      end

      it 'sets id to the id in the CSV' 

    end
  end
end

