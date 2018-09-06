# encoding: utf-8

require 'rspec/core'
require 'rspec/expectations'
require 'rspec/mocks'
require_relative '../../lib/importer/excel2csv'
require_relative '../../../../spec/rspec_configuration.rb'
require_relative '../doubles/job'
require_relative '../doubles/csv_normalizer'

include Mocha::ParameterMatchers

describe CartoDB::Importer2::Excel2Csv do
  before(:each) do
    CartoDB.stubs(:python_path).returns('')
    CartoDB.stubs(:python_bin_path).returns(`which python`.strip)
  end

  describe '#excel2csv' do
    before(:each) do
      @job            = CartoDB::Importer2::Doubles::Job.new
      @csv_normalizer = CartoDB::Importer2::Doubles::CsvNormalizer.new
    end

    describe '#run' do
      it "parse xls file to csv" 

      it "parse xlsx file to csv" 

      it "raise if a csv file is passed as xls" 

      it "raise if a csv file is passed as xlsx" 

    end
  end
  def path_to(filename)
    File.join(File.dirname(__FILE__), '..', 'fixtures', filename)
  end
end

