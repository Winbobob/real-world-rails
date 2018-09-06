# frozen_string_literal: true

require 'rails_helper'

describe GenericWorkListToCSVService do
  let(:service) { described_class.new(file_list) }
  let(:header) { "Work Url,Work Id,Work Title,Work Resource Type,Work Rights,File Set Url,File Set Time Uploaded,File Set Id,File Set Title,File Set Depositor,File Set Creator,File Set Visibility,File Set File Format\n" }

  describe '#csv' do
    subject { service.csv }

    context 'with no files' do
      let(:file_list) { [] }

      it { is_expected.to eq(header) }
    end

    context 'with one file' do
      let(:file_list) { [create(:work, :with_one_file, file_title: ['CSV Report 1'], resource_type: ['Image'], rights: ['mine'])] }
      let(:file_set)  { file_list[0].file_sets[0] }
      let(:work)      { file_set.parent }

      it 'can be parsed' 

    end

    context 'with multiple files' do
      let(:file_list) do
        [
          create(:work, :with_one_file, file_title: ['CSV Multifile-Report 1']),
          create(:work, :with_one_file, file_title: ['CSV Multifile-Report 2']),
          create(:work, :with_one_file, file_title: ['CSV Multifile-Report 3'])
        ]
      end

      it { is_expected.to include('CSV Multifile-Report 1', 'CSV Multifile-Report 2', 'CSV Multifile-Report 3') }
      it 'can be parsed' 

    end
  end
end

