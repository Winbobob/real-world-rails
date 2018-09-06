require 'spec_helper'

describe 'Bikes API V2' do
  describe 'bike search' do
    before :each do
      @bike = FactoryGirl.create(:bike)
      FactoryGirl.create(:bike)
      FactoryGirl.create(:recovered_bike)
    end
    it 'all bikes (root) search works' 


    it 'non_stolen bikes search works' 


    it 'serial search works' 


    it 'stolen search works' 

  end

  describe 'fuzzy serial search' do
    it 'finds a close one' 

  end

  describe 'count' do
    it "returns the count hash for matching bikes, doesn't need access_token" 


    it 'proximity square does not overwrite the proximity_radius' 

  end

  describe 'all_stolen' do
    it 'returns the cached file' 

  end
end

