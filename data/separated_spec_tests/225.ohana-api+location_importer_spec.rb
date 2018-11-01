require 'rails_helper'

describe LocationImporter do
  let(:invalid_content) { Rails.root.join('spec', 'support', 'fixtures', 'invalid_location.csv') }
  let(:invalid_org) { Rails.root.join('spec', 'support', 'fixtures', 'invalid_location_org.csv') }
  let(:valid_content) { Rails.root.join('spec', 'support', 'fixtures', 'valid_location.csv') }

  let(:valid_address) do
    path = Rails.root.join('spec', 'support', 'fixtures', 'valid_address.csv')
    AddressExtractor.extract_addresses(path)
  end
  let(:invalid_address) do
    path = Rails.root.join('spec', 'support', 'fixtures', 'invalid_address.csv')
    AddressExtractor.extract_addresses(path)
  end
  let(:missing_address) do
    path = Rails.root.join('spec', 'support', 'fixtures', 'missing_address.csv')
    AddressExtractor.extract_addresses(path)
  end

  before(:all) do
    DatabaseCleaner.clean_with(:truncation)
    create(:organization)
  end

  after(:all) do
    Organization.find_each(&:destroy)
  end

  subject(:importer) { LocationImporter.new(content, address) }

  describe '#valid?' do
    context 'when the location content is invalid' do
      let(:content) { invalid_content }
      let(:address) { valid_address }

      it { is_expected.not_to be_valid }
    end

    context 'when only the address content is invalid' do
      let(:content) { valid_content }
      let(:address) { invalid_address }

      it { is_expected.not_to be_valid }
    end

    context 'when the content is valid' do
      let(:content) { valid_content }
      let(:address) { valid_address }

      it { is_expected.to be_valid }
    end
  end

  describe '#errors' do
    context 'when the location content is not valid' do
      let(:content) { invalid_content }
      let(:address) { valid_address }

      errors = ["Line 2: Name can't be blank for Location"]

      its(:errors) { is_expected.to eq(errors) }
    end

    context 'when the address content is not valid' do
      let(:content) { valid_content }
      let(:address) { invalid_address }

      errors = ["Line 2: City can't be blank for Address"]

      its(:errors) { is_expected.to eq(errors) }
    end

    context 'when there is no matching address' do
      let(:content) { valid_content }
      let(:address) { missing_address }

      errors = ['Line 2: Street Address must be provided unless a Location is virtual']

      its(:errors) { is_expected.to eq(errors) }
    end

    context 'when the organization_id does not exist' do
      let(:content) { invalid_org }
      let(:address) { valid_address }

      errors = ['Line 2: Organization must exist']

      its(:errors) { is_expected.to eq(errors) }
    end
  end

  describe '#import' do
    context 'with all the required fields to create a location' do
      let(:content) { valid_content }
      let(:address) { valid_address }

      it 'creates a location' 


      it 'creates an address' 


      describe 'the location' do
        before { importer.import }

        subject { Location.first }

        its(:name) { is_expected.to eq 'Harvest Food Bank' }
        its(:latitude) { is_expected.to eq(37.7726402) }
        its(:longitude) { is_expected.to eq(-122.4099154) }
        its(:organization_id) { is_expected.to eq 1 }
        its(:accessibility) { is_expected.to eq %w[cd ramp] }
        its(:languages) { is_expected.to eq %w[French spanish] }
        its(:admin_emails) { is_expected.to eq %w[test@test.com foo@bar.com] }
      end

      describe 'the address' do
        before { importer.import }

        subject { Address.first }

        its(:address_1) { is_expected.to eq '123 Main Street' }
        its(:address_2) { is_expected.to eq 'Suite 101' }
        its(:city) { is_expected.to eq 'Fairfax' }
        its(:state_province) { is_expected.to eq 'VA' }
        its(:postal_code) { is_expected.to eq '22031' }
        its(:country) { is_expected.to eq 'US' }
      end
    end

    context 'when one of the fields required for a location is blank' do
      let(:content) { invalid_content }
      let(:address) { valid_address }

      it 'saves the valid locations and skips invalid ones' 


      it 'saves the valid addresses and skips invalid ones' 

    end

    context 'when the address already exists' do
      before { importer.import }

      let(:content) { valid_content }
      let(:address) { valid_address }

      it 'does not create a new contact' 


      it 'does not generate errors' 


      it 'does not generate errors' 

    end
  end

  describe '.check_and_import_file' do
    it 'calls FileChecker' 


    it 'calls process_import' 


    context 'with invalid data' do
      it 'outputs error message' 

    end

    context 'when only address is invalid' do
      it 'outputs error message' 

    end
  end

  describe '.required_headers' do
    it 'matches required headers in Wiki' 

  end

  describe '.required_address_headers' do
    it 'matches required headers in Wiki' 

  end
end

