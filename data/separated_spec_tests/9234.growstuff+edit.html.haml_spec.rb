require 'rails_helper'

describe "gardens/edit" do
  context "logged in" do
    before(:each) do
      @owner = FactoryBot.create(:member)
      sign_in @owner
      controller.stub(:current_user) { @owner }
      @garden = assign(:garden, FactoryBot.create(:garden, owner: @owner))
      render
    end

    it "renders the edit garden form" 

  end
end

