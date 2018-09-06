require 'rails_helper'
describe 'devise/mailer/unlock_instructions.html.haml', type: "view" do
  context "logged in" do
    before(:each) do
      @resource = FactoryBot.create(:member)
      render
    end

    it "should explain what's happened" 


    it "should have an unlock link" 

  end
end

