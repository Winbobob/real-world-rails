require 'rails_helper'

describe ContactImporter do
  let(:invalid_content) { Rails.root.join('spec', 'support', 'fixtures', 'invalid_contact.csv') }
  let(:valid_content) do
    Rails.root.join('spec', 'support', 'fixtures', 'valid_location_contact.csv')
  end
  let(:valid_service_contact) do
    Rails.root.join('spec', 'support', 'fixtures', 'valid_service_contact.csv')
  end
  let(:valid_org_contact) do
    Rails.root.join('spec', 'support', 'fixtures', 'valid_org_contact.csv')
  end
  let(:no_parent) { Rails.root.join('spec', 'support', 'fixtures', 'contact_with_no_parent.csv') }

  before(:all) do
    DatabaseCleaner.clean_with(:truncation)
    create(:location)
  end

  after(:all) do
    Organization.find_each(&:destroy)
  end

  subject(:importer) { ContactImporter.new(content) }

  describe '#valid?' do
    context 'when the contact content is invalid' do
      let(:content) { invalid_content }

      it { is_expected.not_to be_valid }
    end

    context 'when the content is valid' do
      let(:content) { valid_content }

      it { is_expected.to be_valid }
    end
  end

  describe '#errors' do
    context 'when the contact content is not valid' do
      let(:content) { invalid_content }

      errors = ["Line 2: Name can't be blank for Contact"]

      its(:errors) { is_expected.to eq(errors) }
    end

    context 'when a parent does not exist' do
      let(:content) { no_parent }

      errors = ['Line 2: Contact is missing a parent: Location or ' \
        'Organization or Service']

      its(:errors) { is_expected.to eq(errors) }
    end
  end

  describe '#import' do
    context 'with all the required fields to create a contact' do
      let(:content) { valid_content }

      it 'creates a contact' 


      describe 'the contact' do
        before { importer.import }

        subject { Contact.first }

        its(:id) { is_expected.to eq 2 }
        its(:department) { is_expected.to eq 'Food Pantry' }
        its(:email) { is_expected.to eq 'john@example.org' }
        its(:name) { is_expected.to eq 'John Smith' }
        its(:title) { is_expected.to eq 'Food Pantry Manager' }
        its(:location_id) { is_expected.to eq 1 }
      end
    end

    context 'when the contact belongs to a service' do
      before do
        DatabaseCleaner.clean_with(:truncation)
        create(:service)
      end

      let(:content) { valid_service_contact }

      describe 'the contact' do
        before { importer.import }

        subject { Contact.first }

        its(:service_id) { is_expected.to eq 1 }
      end
    end

    context 'when the contact belongs to an organization' do
      let(:content) { valid_org_contact }

      describe 'the contact' do
        before { importer.import }

        subject { Contact.first }

        its(:organization_id) { is_expected.to eq 1 }
      end
    end

    context 'when one of the fields required for a contact is blank' do
      let(:content) { invalid_content }

      it 'saves the valid contacts and skips invalid ones' 

    end

    context 'when the contact already exists' do
      before do
        importer.import
      end

      let(:content) { valid_content }

      it 'does not create a new contact' 


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

