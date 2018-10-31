require 'rails_helper'

describe "GET 'nearby'" do
  before :each do
    @loc = create(:location)
    @nearby = create(:nearby_loc)
    create(:far_loc)
  end

  it 'is paginated' 


  it 'returns a summarized JSON representation' 


  it 'only returns active locations' 


  context 'with no radius' do
    it 'displays nearby locations within 0.5 miles' 

  end

  context 'with valid radius' do
    it 'displays nearby locations within 2 miles' 

  end

  context 'with invalid radius' do
    it 'returns an invalid radius message' 

  end

  context 'when the location has no coordinates' do
    it 'returns empty array' 

  end
end

