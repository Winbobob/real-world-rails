# encoding: utf-8

require_relative '../../lib/internal-geocoder/query_generator_factory.rb'
require_relative '../../lib/internal-geocoder/abstract_query_generator.rb'
require_relative '../../../../spec/rspec_configuration.rb'
require          'active_support/core_ext' # Needed for string.blank?

RSpec.configure do |config|
  config.mock_with :mocha
end

=begin
The class should generate queries to be used by the InternalGeocoder depending on the inputs.

* Different types of inputs:
  - kind: namedplace, ipaddress, postalcode, admin0, admin1
  - country: column, freetext
  - geometry_type: point, polygon

* Where queries are needed:
  - to query the data-services
  - to import results into table
=end

describe CartoDB::InternalGeocoder::QueryGeneratorFactory do

  before(:each) do
    @internal_geocoder = mock
  end

  describe '#dataservices' do

    it 'should return a query template suitable for <namedplace, country_name, region_name, point>' 


  end

  describe '#search_terms_query' do
    it 'should get the search terms for <namedplace, country_name, region_name, point>' 

  end

  describe '#copy_results_to_table_query' do
    it 'should generate a suitable query to update geocoded table with temp table' 

  end

  describe 'CDB-4269' do
    it 'should generate a suitable query generator for [:admin1, :column, nil, :polygon]' 

  end

end

