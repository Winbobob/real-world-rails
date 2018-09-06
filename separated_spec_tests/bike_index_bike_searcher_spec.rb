require 'spec_helper'

describe BikeSearcher do
  describe 'initialize' do
    context 'basic serial array' do
      it 'deletes the serial gsub expression if it is present' 

    end
    context 'troublesome 1' do
      it 'deletes the serial gsub expression if it is present' 

    end
  end

  describe 'search selectize options' do
    it 'returns the selectized items if passed through the expected things' 

  end

  describe 'find_bikes' do
    it 'calls select manufacturers, attributes, stolen and query if stolen is present' 

    it 'does not fail if nothing is present' 

  end

  describe 'matching_serial' do
    it 'finds matching bikes' 

    it 'finds matching bikes' 

    it 'finds bikes with absent serials' 

    it 'fulls text search' 

  end

  describe 'matching_manufacturer' do
    it 'finds matching bikes from manufacturer without id' 


    it "does not return any bikes if we can't find the manufacturer" 


    it 'finds matching bikes' 

  end

  describe 'matching_colors' do
    it 'finds matching colors' 

  end

  describe 'fuzzy_find_serial' do
    it 'finds matching serial segments' 

    it "doesn't find exact matches" 

  end

  describe 'matching_stolenness' do
    before :each do
      @non_stolen = FactoryGirl.create(:bike)
      @stolen = FactoryGirl.create(:bike, stolen: true)
    end
    it "selects only stolen bikes if non-stolen isn't selected" 

    it "selects only non-stolen bikes if stolen isn't selected" 

    it 'returns all bikes' 

  end

  describe 'matching_query' do
    it 'selects bikes matching the attribute' 

  end
end

