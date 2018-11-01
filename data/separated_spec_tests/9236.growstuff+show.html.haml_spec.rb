require 'rails_helper'

describe "gardens/show" do
  before(:each) do
    @owner = FactoryBot.create(:member)
    controller.stub(:current_user) { @owner }
    @garden   = FactoryBot.create(:garden, owner: @owner)
    @planting = FactoryBot.create(:planting, garden: @garden, owner: @garden.owner)
    assign(:garden, @garden)
    assign(:current_plantings, [@planting])
    assign(:finished_plantings, [])
    render
  end

  it 'should show the location' 


  it 'should show the area' 


  it 'should show the description' 


  it 'renders markdown in the description' 


  it 'should show plantings on the garden page' 


  it "doesn't show the note about random plantings" 


  context 'signed in' do
    before :each do
      sign_in @owner
      render
    end

    it 'should have an edit button' 


    it "shows a 'plant something' button" 


    it "shows an 'add photo' button" 


    it "links to the right crop in the planting link" 

  end
end

