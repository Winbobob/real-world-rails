# encoding: utf-8

require_relative '../../lib/importer/content_guesser'
require_relative '../../../../spec/rspec_configuration.rb'

describe CartoDB::Importer2::ContentGuesser do

  before(:each) do
    CartoDB::Stats::Aggregator.stubs(:read_config).returns({})
  end

  describe '#enabled?' do
    it 'returns a true value if set so in options' 


    it 'returns a false value if set so in options' 


    it 'returns a false-like value if not set in options' 


  end

  describe '#country_column' do
    it 'returns nil if guessing is not enabled' 


    it 'returns the first column name which contents are countries, if present' 


    it "returns nil if there's no column containing countries" 

  end

  describe '#columns' do
    it 'queries the db to get a list of columns with their corresponding data types' 

  end

  describe '#is_country_column?' do
    it 'returns true if a sample proportion is above a given threshold' 


    it 'returns false if sample.count == 0' 


    it 'returns false if countries.count == 0' 


    it 'returns false if sample.count == 0 and countries.count == 0' 


  end

  describe '#is_text_type?' do
    it 'returns false if the column type is not compatible' 


    it 'returns true if the column type is of a compatible type' 

  end

  describe '#countries' do
    it 'queries the sql api to get a Set of countries' 


    it 'caches the response so no need to call the sql api on successive calls' 


    it 'shall not add countries from DB if length < 2' 


  end

  describe '#id_column' do
    it 'should return a column name known to be sequential and with index' 


    it "should raise an exception if there's no suitable id column" 


  end

  describe '#metric_entropy' do
    it 'should be low for repeated elements after normalization' 

  end

  describe '#country_name_normalizer' do
    it 'should handle gracefully nil values' 

  end

  describe '#is_ip_column?' do

    it "returns true if column contains IP's" 


    it 'returns false if sample contains a bunch of integers #1803' 

  end

end

