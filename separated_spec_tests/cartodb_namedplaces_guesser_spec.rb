# encoding: utf-8

require 'active_record'
require_relative '../../lib/importer/namedplaces_guesser'
require_relative '../../../../spec/rspec_configuration.rb'
require_relative '../../../../spec/spec_helper_min'

module CartoDB::Importer2

  describe NamedplacesGuesser do

    describe '#found?' do
      it 'raises an exception if not run yet' 


      it 'returns false if there was no namedplaces column found during checks' 


      it 'returns true if there was a namedplaces column found' 


    end

    describe '#run!' do
      it "performs a guessing using the country column if there's any" 


      it "performs a guessing relying on namedplace_guess_country if there's no country column" 


    end

    describe '#country_column' do
      it "returns a country column if there's one with a high proportion of countries" 

    end


    # These methods below are private but worth testing

    describe '#guess_with_country_column' do
      it "gets the column with highest proportion of namedplaces, if any" 

    end

    describe '#namedplace_guess_country' do
      it "checks all candidates for a positive country guess through the geocoder api" 

    end

    describe '#proportion' do
      it 'calculates the proportion of namedplaces given a column and a country column' 

    end

    describe '#count_namedplaces_with_country_column' do
      it 'queries the geocoder to get the number of namedplaces from the sample' 

    end

  end

end

