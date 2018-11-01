require 'rails_helper'

describe StepsController do
  before do
    SiteSetting.wizard_enabled = true
  end

  it 'needs you to be logged in' 


  it "raises an error if you aren't an admin" 


  context "as an admin" do
    before do
      sign_in(Fabricate(:admin))
    end

    it "raises an error if the wizard is disabled" 


    it "updates properly if you are staff" 


    it "returns errors if the field has them" 

  end
end

