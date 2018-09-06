require 'rails_helper'

describe RegularScheduleImporter do
  let(:invalid_content) do
    Rails.root.join('spec', 'support', 'fixtures', 'invalid_regular_schedule.csv')
  end
  let(:valid_content) do
    Rails.root.join('spec', 'support', 'fixtures', 'valid_location_regular_schedule.csv')
  end
  let(:valid_service_regular_schedule) do
    Rails.root.join('spec', 'support', 'fixtures', 'valid_service_regular_schedule.csv')
  end
  let(:no_parent) do
    Rails.root.join('spec', 'support', 'fixtures', 'regular_schedule_with_no_parent.csv')
  end

  before(:all) do
    DatabaseCleaner.clean_with(:truncation)
    create(:location)
  end

  after(:all) do
    Organization.find_each(&:destroy)
  end

  subject(:importer) { RegularScheduleImporter.new(content) }

  describe '#valid?' do
    context 'when the regular_schedule content is invalid' do
      let(:content) { invalid_content }

      it { is_expected.not_to be_valid }
    end

    context 'when the content is valid' do
      let(:content) { valid_content }

      it { is_expected.to be_valid }
    end
  end

  describe '#errors' do
    context 'when the regular_schedule content is not valid' do
      let(:content) { invalid_content }

      errors = ["Line 2: Closes at can't be blank for Regular Schedule"]

      its(:errors) { is_expected.to eq(errors) }
    end

    context 'when a parent does not exist' do
      let(:content) { no_parent }

      errors = ['Line 2: Regular Schedule is missing a parent: Location or ' \
        'Service']

      its(:errors) { is_expected.to eq(errors) }
    end
  end

  describe '#import' do
    context 'with all the required fields to create a regular_schedule' do
      let(:content) { valid_content }

      it 'creates a regular_schedule' 


      describe 'the regular_schedule' do
        before { importer.import }

        subject { RegularSchedule.first }

        its(:id) { is_expected.to eq 2 }
        its(:weekday) { is_expected.to eq 1 }
        its(:opens_at) { is_expected.to eq Time.utc(2000, 1, 1, 9, 30, 0) }
        its(:closes_at) { is_expected.to eq Time.utc(2000, 1, 1, 17, 00, 0) }
        its(:location_id) { is_expected.to eq 1 }
      end
    end

    context 'when the regular_schedule belongs to a service' do
      before do
        DatabaseCleaner.clean_with(:truncation)
        create(:service)
      end

      let(:content) { valid_service_regular_schedule }

      describe 'the regular_schedule' do
        before { importer.import }

        subject { RegularSchedule.first }

        its(:service_id) { is_expected.to eq 1 }
      end
    end

    context 'when file contains invalid entries' do
      let(:content) { invalid_content }

      it 'saves the valid entries and skips invalid ones' 

    end

    context 'when the regular_schedule already exists' do
      before do
        importer.import
      end

      let(:content) { valid_content }

      it 'does not create a new regular_schedule' 


      it 'does not generate errors' 

    end
  end

  describe '.check_and_import_file' do
    context 'when FileChecker returns skip import' do
      it 'does not import the file' 

    end

    context 'when FileChecker returns true' do
      it 'imports the file' 

    end

    context 'with invalid data' do
      it 'outputs error message' 

    end
  end

  describe '.required_headers' do
    it 'matches required headers in Wiki' 

  end
end

