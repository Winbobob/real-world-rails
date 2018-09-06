require 'rails_helper'

describe ProgramImporter do
  let(:invalid_content) { Rails.root.join('spec', 'support', 'fixtures', 'invalid_program.csv') }
  let(:valid_content) { Rails.root.join('spec', 'support', 'fixtures', 'valid_program.csv') }
  let(:no_parent) { Rails.root.join('spec', 'support', 'fixtures', 'program_with_no_parent.csv') }

  before(:all) do
    DatabaseCleaner.clean_with(:truncation)
    create(:organization)
  end

  after(:all) do
    Organization.find_each(&:destroy)
  end

  subject(:importer) { ProgramImporter.new(content) }

  describe '#valid?' do
    context 'when the program content is invalid' do
      let(:content) { invalid_content }

      it { is_expected.not_to be_valid }
    end

    context 'when the content is valid' do
      let(:content) { valid_content }

      it { is_expected.to be_valid }
    end
  end

  describe '#errors' do
    context 'when the program content is not valid' do
      let(:content) { invalid_content }

      errors = ["Line 2: Name can't be blank for Program"]

      its(:errors) { is_expected.to eq(errors) }
    end

    context 'when a parent does not exist' do
      let(:content) { no_parent }

      errors = ['Line 2: Organization must exist']

      its(:errors) { is_expected.to eq(errors) }
    end
  end

  describe '#import' do
    context 'with all the required fields to create a program' do
      let(:content) { valid_content }

      it 'creates a program' 


      describe 'the program' do
        before { importer.import }

        subject { Program.first }

        its(:id) { is_expected.to eq 2 }
        its(:name) { is_expected.to eq 'Defeat Hunger' }
        its(:alternate_name) { is_expected.to be_nil }
        its(:organization_id) { is_expected.to eq 1 }
      end
    end

    context 'when one of the fields required for a program is blank' do
      let(:content) { invalid_content }

      it 'saves the valid entries and skips invalid ones' 

    end

    context 'when the program already exists' do
      before do
        importer.import
      end

      let(:content) { valid_content }

      it 'does not create a new program' 


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

