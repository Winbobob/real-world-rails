# frozen_string_literal: true

require 'spec_helper'

describe Donations::Utils do
  subject { Donations::Utils }

  describe '.round' do
    it 'returns only integers' 


    it 'rounds values above 20 to the nearest 5' 


    it 'rounds values below 20 to the nearest 1' 


    it 'handles an empty array' 


    it 'handles integers' 


    it 'handles many values' 

  end

  describe '.deduplicate' do
    it 'sorts them even if nothing changes' 


    it 'deduplicates below 20 to nearest available 1' 


    it 'dedeuplicates above 20 to nearest available 5' 


    it 'dedeuplicates properly even if many matches' 


    it 'handles an empty array' 


    it 'handles floats' 

  end

  describe '.currency_from_country_code' do
    it 'maps european countries to euro' 


    it 'maps nil to USD' 


    it 'maps unknown country to USD' 


    it 'maps US to USD' 


    it 'maps GB to GBP' 


    it 'maps CH to CHF' 


    it 'maps NZ to NZD' 


    it 'maps AU to AUD' 


    it 'maps CA to CAD' 


    it 'works with symbols' 

  end
end

