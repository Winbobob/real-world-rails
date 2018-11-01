require 'rails_helper'

describe "scientific_names/new" do
  before(:each) do
    assign(:scientific_name, FactoryBot.create(:zea_mays))
  end

  context "logged in" do
    before(:each) do
      @member = FactoryBot.create(:member)
      sign_in @member
      controller.stub(:current_user) { @member }
      render
    end

    it "renders new scientific_name form" 

  end
end

