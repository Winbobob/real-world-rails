require 'rails_helper'

describe "plantings/edit" do
  before(:each) do
    @member = FactoryBot.create(:member,
      login_name: 'right',
      email: 'right@example.com')

    # creating two crops to make sure that the correct one is selected
    # in the form.
    @tomato = FactoryBot.create(:tomato)
    @maize = FactoryBot.create(:maize)

    # and likewise for gardens
    @garden =  FactoryBot.create(:garden_z, owner: @member)
    @garden2 = FactoryBot.create(:garden_a, owner: @member)

    @planting = assign(:planting,
      FactoryBot.create(:planting, garden: @garden, crop: @tomato, owner: @member))
  end

  context "logged in" do
    before(:each) do
      sign_in @member
      controller.stub(:current_user) { @member }
      render
    end

    it "renders the edit planting form" 


    it 'includes helpful links for crops and gardens' 


    it "chooses the right crop" 


    it "chooses the right garden" 

  end
end

