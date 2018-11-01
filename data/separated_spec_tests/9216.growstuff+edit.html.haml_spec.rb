require 'rails_helper'

describe "scientific_names/edit" do
  context "logged in" do
    before(:each) do
      @member = FactoryBot.create(:member)
      sign_in @member
      controller.stub(:current_user) { @member }
      @scientific_name = assign(:scientific_name,
        FactoryBot.create(:zea_mays))
      render
    end

    it "shows the creator" 


    it "renders the edit scientific_name form" 

  end
end

