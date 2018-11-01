require 'rails_helper'

describe "plantings/new" do
  before(:each) do
    @member = FactoryBot.create(:member)
    controller.stub(:current_user) { @member }

    # create gardens and crops to populate dropdowns
    @garden_a = FactoryBot.create(:garden, owner: @member)
    @garden_z = FactoryBot.create(:garden, owner: @member)
    @crop1 = FactoryBot.create(:tomato)
    @crop2 = FactoryBot.create(:maize)

    assign(:planting, FactoryBot.create(:planting,
      garden: @garden_a,
      crop: @crop2,
      owner: @member))
  end

  context "logged in" do
    before(:each) do
      sign_in @member
      assign(:planting, Planting.new)
      assign(:crop, @crop2)
      assign(:garden, @garden_z)
      render
    end

    it "renders new planting form" 


    it 'includes helpful links for crops and gardens' 


    it "selects a garden given in a param" 

  end
end

