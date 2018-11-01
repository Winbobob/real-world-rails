require 'rails_helper'

describe CategoryImporter do
  let(:invalid_content) { Rails.root.join('spec', 'support', 'fixtures', 'invalid_category.csv') }
  let(:invalid_parent) do
    Rails.root.join('spec', 'support', 'fixtures', 'invalid_parent_category.csv')
  end
  let(:valid_content) { Rails.root.join('spec', 'support', 'fixtures', 'valid_category.csv') }
  let(:existing_content) { Rails.root.join('spec', 'support', 'fixtures', 'existing_category.csv') }

  subject(:importer) { CategoryImporter.new(content) }

  describe '#valid?' do
    context 'when the category content is invalid' do
      let(:content) { invalid_content }

      it { is_expected.not_to be_valid }
    end

    context 'when the content is valid' do
      let(:content) { valid_content }

      it { is_expected.to be_valid }
    end
  end

  describe '#errors' do
    context 'when the category content is not valid' do
      let(:content) { invalid_content }

      errors = ["Line 2: Name can't be blank for Category"]

      its(:errors) { is_expected.to eq(errors) }
    end

    context 'when the parent category is not valid' do
      let(:content) { invalid_parent }

      errors = ["Line 2: Name can't be blank for Category"]

      its(:errors) { is_expected.to eq(errors) }
    end
  end

  describe '#import' do
    context 'with all the required fields to create a category' do
      let(:content) { valid_content }

      it 'creates a category' 


      describe 'the category' do
        before { importer.import }

        subject { Category.second }

        its(:name) { is_expected.to eq 'Disaster Response' }
        its(:taxonomy_id) { is_expected.to eq '101-01' }
        its('parent.taxonomy_id') { is_expected.to eq '101' }
      end
    end

    context 'when one of the fields required for a category is blank' do
      let(:content) { invalid_content }

      it 'saves the valid categories and skips invalid ones' 

    end

    context 'when the category already exists' do
      before do
        DatabaseCleaner.clean_with(:truncation)
        create(:category)
      end

      let(:content) { existing_content }

      it 'does not create a new category' 


      it 'generates error' 

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
