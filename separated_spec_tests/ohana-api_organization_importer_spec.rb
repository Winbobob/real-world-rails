require 'rails_helper'

describe OrganizationImporter do
  let(:invalid_content) { Rails.root.join('spec', 'support', 'fixtures', 'invalid_org.csv') }
  let(:invalid_date) do
    Rails.root.join('spec', 'support', 'fixtures', 'org_with_invalid_date.csv')
  end
  let(:valid_content) { Rails.root.join('spec', 'support', 'fixtures', 'valid_org.csv') }
  let(:spelled_out_date) do
    Rails.root.join('spec', 'support', 'fixtures', 'org_with_spelled_out_date.csv')
  end
  let(:org_with_2_digit_year) do
    Rails.root.join('spec', 'support', 'fixtures', 'org_with_2_digit_year.csv')
  end

  subject(:importer) { OrganizationImporter.new(content) }

  describe '#valid?' do
    context 'when the org content is invalid' do
      let(:content) { invalid_content }

      it { is_expected.not_to be_valid }
    end

    context 'when the content is valid' do
      let(:content) { valid_content }

      it { is_expected.to be_valid }
    end
  end

  describe '#errors' do
    context 'when the org content is not valid' do
      let(:content) { invalid_content }

      errors = ["Line 2: Name can't be blank for Organization"]

      its(:errors) { is_expected.to eq(errors) }
    end

    context 'when the date is not valid' do
      let(:content) { invalid_date }

      errors = ['Line 2: Date of Incorporation 24/2/70 is not a valid date']

      its(:errors) { is_expected.to eq(errors) }
    end
  end

  describe '#import' do
    context 'with all the required fields to create a org' do
      let(:content) { valid_content }

      it 'creates an org' 


      describe 'the org' do
        before { importer.import }

        subject { Organization.find(2) }

        its(:id) { is_expected.to eq 2 }
        its(:accreditations) { is_expected.to eq ['BBB', 'State Board of Education'] }
        its(:alternate_name) { is_expected.to eq 'HFB' }
        its(:date_incorporated) { is_expected.to eq Date.parse('January 2, 1970') }
        its(:description) { is_expected.to match 'Harvest Food Bank' }
        its(:email) { is_expected.to eq 'info@example.org' }
        its(:funding_sources) { is_expected.to eq %w[Donations Grants] }
        its(:legal_status) { is_expected.to eq 'Nonprofit' }
        its(:licenses) { is_expected.to eq ['State Health Inspection License'] }
        its(:name) { is_expected.to eq 'Parent Agency' }
        its(:tax_id) { is_expected.to eq '12-456789' }
        its(:tax_status) { is_expected.to eq '501(c)3' }
        its(:website) { is_expected.to eq 'http://www.example.org' }
      end
    end

    context 'when the date is formatted as month, day, year' do
      let(:content) { spelled_out_date }

      describe 'the org' do
        before { importer.import }

        subject { Organization.first }

        its(:date_incorporated) { is_expected.to eq Date.parse('January 20, 1970') }
      end
    end

    context 'when the year only contains two digits' do
      let(:content) { org_with_2_digit_year }

      describe 'the org' do
        before { importer.import }

        subject { Organization.first }

        its(:date_incorporated) { is_expected.to eq Date.parse('January 24, 1970') }
      end
    end

    context 'when one of the fields required for a org is blank' do
      let(:content) { invalid_content }

      it 'saves the valid entries and skips invalid ones' 

    end

    context 'when the org already exists' do
      before do
        DatabaseCleaner.clean_with(:truncation)
        importer.import
      end

      let(:content) { valid_content }

      it 'does not create a new org' 


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

