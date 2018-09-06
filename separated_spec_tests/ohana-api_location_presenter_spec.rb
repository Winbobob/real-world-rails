require 'rails_helper'

describe LocationPresenter do
  before(:all) do
    DatabaseCleaner.clean_with(:truncation)
    create(:organization)
  end

  after(:all) do
    Organization.find_each(&:destroy)
  end

  let(:properties) do
    {
      organization_id: '1',
      id: '1',
      name: 'Example Location',
      description: 'Example description'
    }
  end

  let(:path) { Rails.root.join('spec', 'support', 'fixtures', 'valid_location.csv') }

  let(:address_path) { Rails.root.join('spec', 'support', 'fixtures', 'valid_address.csv') }

  let(:addresses) do
    AddressExtractor.extract_addresses(address_path)
  end

  let(:missing_addresses) do
    path = Rails.root.join('spec', 'support', 'fixtures', 'missing_address.csv')
    AddressExtractor.extract_addresses(path)
  end

  subject(:presenter) { LocationPresenter.new(properties, addresses) }

  describe '#to_location' do
    context 'when the location is valid' do
      it 'initializes a new location' 

    end

    context 'when the location is not valid' do
      let(:addresses) { missing_addresses }

      it 'does not create a new location' 

    end

    context 'when the location already exists' do
      before do
        DatabaseCleaner.clean_with(:truncation)
        create(:location)
      end

      it 'does not create a new location' 

    end

    context 'when the location has comma-separated field values' do
      let(:properties) do
        {
          organization_id: '1',
          id: '1',
          name: 'Example Location',
          description: 'Example description',
          accessibility: 'ramp ,wheelchair',
          admin_emails: 'foo@bar.com, bar@foo.com ',
          languages: ' English, French ',
          virtual: nil
        }
      end

      it 'transforms accessibility' 


      it 'transforms admin_emails' 


      it 'transforms languages' 

    end

    context 'when the location has nil field values' do
      let(:properties) do
        {
          organization_id: '1',
          id: '1',
          name: 'Example Location',
          description: 'Example description',
          accessibility: nil,
          admin_emails: nil,
          languages: nil,
          virtual: nil
        }
      end

      it 'set accessibility to empty array' 


      it 'set admin_emails to empty array' 


      it 'set languages to empty array' 


      it 'sets virtual to false' 

    end

    context 'when the location is virtual' do
      let(:properties) do
        {
          organization_id: '1',
          id: '1',
          name: 'Example Location',
          description: 'Example description',
          virtual: true
        }
      end

      it 'does not set address attributes' 

    end

    context 'when there is no matching address' do
      let(:addresses) { missing_addresses }

      let(:properties) do
        {
          organization_id: '1',
          id: '1',
          name: 'Example Location',
          description: 'Example description'
        }
      end

      it 'does not set address attributes' 

    end

    context 'when there is a matching address' do
      it 'sets address attributes' 

    end

    context 'when there is an existing matching address' do
      it 'updates the existing address' 

    end

    context 'when there is not an existing matching address' do
      it 'creates a new address' 

    end

    context 'ids are not sequential' do
      let(:properties) do
        {
          organization_id: '1',
          id: '2',
          name: 'Example Location',
          description: 'Example description'
        }
      end

      it 'sets id to the id in the CSV' 

    end
  end
end

