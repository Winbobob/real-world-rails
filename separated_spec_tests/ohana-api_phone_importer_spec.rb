require 'rails_helper'

describe PhoneImporter do
  let(:invalid_content) { Rails.root.join('spec', 'support', 'fixtures', 'invalid_phone.csv') }
  let(:valid_content) { Rails.root.join('spec', 'support', 'fixtures', 'valid_location_phone.csv') }
  let(:valid_service_phone) do
    Rails.root.join('spec', 'support', 'fixtures', 'valid_service_phone.csv')
  end
  let(:valid_org_phone) { Rails.root.join('spec', 'support', 'fixtures', 'valid_org_phone.csv') }
  let(:valid_contact_phone) do
    Rails.root.join('spec', 'support', 'fixtures', 'valid_contact_phone.csv')
  end
  let(:no_parent) { Rails.root.join('spec', 'support', 'fixtures', 'phone_with_no_parent.csv') }

  before(:all) do
    DatabaseCleaner.clean_with(:truncation)
    create(:location)
  end

  after(:all) do
    Organization.find_each(&:destroy)
  end

  subject(:importer) { PhoneImporter.new(content) }

  describe '#valid?' do
    context 'when the phone content is invalid' do
      let(:content) { invalid_content }

      it { is_expected.not_to be_valid }
    end

    context 'when the content is valid' do
      let(:content) { valid_content }

      it { is_expected.to be_valid }
    end
  end

  describe '#errors' do
    context 'when the phone content is not valid' do
      let(:content) { invalid_content }

      errors = ["Line 2: Number Type can't be blank for Phone"]

      its(:errors) { is_expected.to eq(errors) }
    end

    context 'when a parent does not exist' do
      let(:content) { no_parent }

      errors = ['Line 2: Phone is missing a parent: Location or Contact or ' \
        'Service or Organization']

      its(:errors) { is_expected.to eq(errors) }
    end
  end

  describe '#import' do
    context 'with all the required fields to create a phone' do
      let(:content) { valid_content }

      it 'creates a phone' 


      describe 'the phone' do
        before { importer.import }

        subject { Phone.first }

        its(:id) { is_expected.to eq 2 }
        its(:department) { is_expected.to eq 'Food Pantry' }
        its(:extension) { is_expected.to eq '123' }
        its(:number) { is_expected.to eq '703-555-1212' }
        its(:number_type) { is_expected.to eq 'voice' }
        its(:vanity_number) { is_expected.to eq '703-555-FOOD' }
        its(:country_prefix) { is_expected.to eq '1' }
        its(:location_id) { is_expected.to eq 1 }
      end
    end

    context 'when the phone belongs to a service' do
      before do
        DatabaseCleaner.clean_with(:truncation)
        create(:service)
      end

      let(:content) { valid_service_phone }

      describe 'the phone' do
        before { importer.import }

        subject { Phone.first }

        its(:service_id) { is_expected.to eq 1 }
      end
    end

    context 'when the phone belongs to an organization' do
      let(:content) { valid_org_phone }

      describe 'the phone' do
        before { importer.import }

        subject { Phone.first }

        its(:organization_id) { is_expected.to eq 1 }
      end
    end

    context 'when the phone belongs to a contact' do
      before do
        DatabaseCleaner.clean_with(:truncation)
        create(:location).contacts.create!(attributes_for(:contact))
      end

      let(:content) { valid_contact_phone }

      describe 'the phone' do
        before { importer.import }

        subject { Phone.first }

        its(:contact_id) { is_expected.to eq 1 }
      end
    end

    context 'when one of the fields required for a phone is blank' do
      let(:content) { invalid_content }

      it 'saves the valid entries and skips invalid ones' 

    end

    context 'when the phone already exists' do
      before do
        importer.import
      end

      let(:content) { valid_content }

      it 'does not create a new phone' 


      it 'does not generate errors' 

    end
  end

  describe '.check_and_import_file' do
    it 'calls FileChecker' 


    context 'with invalid data' do
      it 'outputs error message' 

    end
  end

  describe '.required_headers' do
    it 'matches required headers in Wiki' 

  end
end

