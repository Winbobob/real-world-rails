require 'rails_helper'

describe 'plantings/index.rss.haml' do
  before(:each) do
    controller.stub(:current_user) { nil }
  end

  context 'all plantings' do
    before :each do
      @planting = FactoryBot.create(:planting)
      @sunny = FactoryBot.create(:sunny_planting)
      @seedling = FactoryBot.create(:seedling_planting)
      assign(:plantings, [@planting, @sunny, @seedling])
      render
    end

    it 'shows RSS feed title' 


    it 'item title shows owner and location' 


    it 'shows formatted content of posts' 


    it 'shows sunniness' 


    it 'shows propagation method' 

  end

  context "one person's plantings" do
    before :each do
      @planting = FactoryBot.create(:planting)
      assign(:plantings, [@planting])
      assign(:owner, @planting.owner)
      render
    end

    it 'shows title for single member' 

  end
end

