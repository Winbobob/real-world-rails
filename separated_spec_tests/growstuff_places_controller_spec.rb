require 'rails_helper'

describe PlacesController do
  before :each do
    controller.stub(:current_member) { nil }
  end

  describe "GET show" do
    before(:each) do
      @member_london = FactoryBot.create(:london_member)
      @member_south_pole = FactoryBot.create(:south_pole_member)
    end

    it "assigns place name" 


    it "assigns nearby members" 

  end

  describe "GET search" do
    it "redirects to the new place" 

  end
end

