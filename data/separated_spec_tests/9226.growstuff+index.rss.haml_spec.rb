require 'rails_helper'

describe 'seeds/index.rss.haml' do
  before(:each) do
    controller.stub(:current_user) { nil }
  end

  context 'all seeds' do
    before(:each) do
      @seed = FactoryBot.create(:seed)
      @tradable = FactoryBot.create(:tradable_seed)
      assign(:seeds, [@seed, @tradable])
      render
    end

    it 'shows RSS feed title' 


    it 'has a useful item title' 


    it 'shows the seed count' 


    it 'shows the plant_before date' 


    it 'mentions that one seed is tradable' 

  end

  context "one member's seeds" do
    before(:each) do
      @seed = FactoryBot.create(:seed)
      assign(:seeds, [@seed])
      assign(:owner, @seed.owner)
      render
    end

    it 'shows RSS feed title' 

  end
end

