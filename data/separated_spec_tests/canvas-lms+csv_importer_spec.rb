# Copyright (C) 2013 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper.rb')

describe Outcomes::CsvImporter do
  def csv_file(name)
    path = File.expand_path(File.dirname(__FILE__) + "/fixtures/#{name}.csv")
    File.open(path, 'rb')
  end

  def import_fake_csv(rows, separator: ',', &updates)
    no_errors = lambda do |status|
      expect(status[:errors]).to eq([])
    end

    updates ||= no_errors
    Tempfile.open do |tf|
      CSV.open(tf.path, 'wb', col_sep: separator) do |csv|
        rows.each { |r| csv << r }
      end
      tf.binmode
      Outcomes::CsvImporter.new(import, tf).run(&updates)
    end
  end

  def outcome_row_with_headers(outcome_headers, **changes)
    valid = {
      title: 'title',
      vendor_guid: SecureRandom.uuid,
      object_type: 'outcome',
      parent_guids: '',
      calculation_method: 'highest',
      calculation_int: '',
      workflow_state: ''
    }

    row = valid.merge(changes)
    outcome_headers.map { |k| row[k.to_sym] }
  end

  def outcome_row(**changes)
    outcome_row_with_headers(headers, **changes)
  end

  def group_row_with_headers(group_headers, **changes)
    valid = {
      title: 'title',
      vendor_guid: SecureRandom.uuid,
      object_type: 'group',
      parent_guids: '',
      calculation_method: '',
      calculation_int: '',
      workflow_state: ''
    }

    row = valid.merge(changes)
    group_headers.map { |k| row[k.to_sym] }
  end

  def group_row(**changes)
    group_row_with_headers(headers, **changes)
  end

  before :once do
    account_model
  end

  let(:import) do
    OutcomeImport.create!(context: @account)
  end

  let(:headers) do
    %w[
      title
      vendor_guid
      object_type
      parent_guids
      calculation_method
      calculation_int
      workflow_state
    ]
  end

  describe 'the csv importer' do
    let(:by_guid) do
      outcomes = LearningOutcome.all.to_a.index_by(&:vendor_guid)
      groups = LearningOutcomeGroup.all.to_a.index_by(&:vendor_guid)
      outcomes.merge(groups)
    end

    def expect_ok_import(path)
      Outcomes::CsvImporter.new(import, path).run do |status|
        expect(status[:errors]).to eq([])
      end
    end

    it 'can import the demo csv file' 


    it 'imports group attributes correctly' 


    it 'imports outcome attributes correctly' 


    it 'imports ratings correctly' 


    it 'works when no ratings are present' 


    it 'properly sets scoring types' 


    it 'can import a utf-8 csv file with non-ascii characters' 


    it 'can import a utf-8 csv file exported from excel' 


    it 'can import csv files with chinese characters' 


    it 'reports import progress' 


    it 'properly sets mastery_points' 


    it 'can import a file with english decimal numbers' 


    it 'can import a file with i18n decimal numbers' 


    it 'automatically detects column separator from header' 


    context 'with optional headers' do
      Outcomes::CsvImporter::OPTIONAL_FIELDS.each do |field|
        it "does not require #{field}" 

      end
    end
  end

  def expect_import_error(rows, expected)
    errors = []
    import_fake_csv(rows) do |status|
      errors += status[:errors]
    end
    expect(errors).to eq(expected)
  end

  def expect_import_failure(rows, message)
    expect { import_fake_csv(rows) }.to raise_error(Outcomes::Import::DataFormatError, message)
  end

  describe 'throws user-friendly header errors' do
    it 'when the csv file is totally malformed' 


    it 'when the file is empty' 


    it 'when required headers are missing' 


    it 'when other headers are after the ratings header' 


    it 'when invalid headers are present' 


    it 'when no data rows are present' 

  end

  describe 'throws user-friendly row errors' do

    it 'if rating tiers have points missing' 


    it 'if rating tiers have invalid points values' 


    it 'if rating tiers have points in wrong order' 


    it 'if object_type is incorrect' 


    it 'if parent_guids refers to missing outcomes' 


    it 'if required fields are missing' 


    it 'if vendor_guid is invalid' 


    it 'if workflow_state is invalid' 


    it 'if a value has an invalid utf-8 byte sequence' 


    it 'if a validation fails' 


    it 'raises a line error when vendor_guid is too long' 


    it 'if a group receives invalid fields' 

  end
end

