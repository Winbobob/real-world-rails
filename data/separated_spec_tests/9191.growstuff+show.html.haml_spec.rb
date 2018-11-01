require 'rails_helper'

describe "plantings/show" do
  let(:crop) { FactoryBot.create(:tomato) }
  let(:member) { FactoryBot.create(:member) }
  let(:garden) { FactoryBot.create(:garden, owner: member) }
  let(:planting) do
    FactoryBot.create(:planting, garden: garden, crop: crop,
                                 owner: garden.owner,
                                 planted_from: 'cutting')
  end

  before(:each) do
    assign(:planting, planting)
    assign(:photos, planting.photos.paginate(page: 1))
    controller.stub(:current_user) { member }
  end

  context 'sunniness' do
    let(:planting) { FactoryBot.create(:sunny_planting) }

    it "shows the sunniness" 

  end

  context 'planted from' do
    let(:planting) { FactoryBot.create(:cutting_planting) }

    it "shows planted_from" 


    it "shows planted_from if blank" 

  end

  it "shows photos" 


  it "shows a link to add photos" 


  context "no location set" do
    before(:each) do
      render
    end

    it "renders the quantity planted" 


    it "renders the description" 


    it "renders markdown in the description" 


    it "doesn't contain a () if no location is set" 

  end

  context "location set" do
    before(:each) do
      planting.owner.update(location: 'Greenwich, UK')
      render
    end

    it "shows the member's location in parentheses" 

  end
end

