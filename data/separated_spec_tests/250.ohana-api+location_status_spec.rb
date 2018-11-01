require 'rails_helper'

describe "GET 'search'" do
  context 'with status parameter' do
    before(:each) do
      create(:nearby_loc)
      @location = create(:location)
      @attrs =  attributes_for(:service)
    end

    it 'only returns active locations when status=active' 


    it 'only returns inactive locations when status != active' 

  end
end

