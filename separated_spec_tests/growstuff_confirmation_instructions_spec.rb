require 'rails_helper'

describe 'devise/mailer/confirmation_instructions.html.haml', type: "view" do
  context "logged in" do
    before(:each) do
      @resource = FactoryBot.create(:member)
      render
    end

    it 'should have a confirmation link' 


    it 'should have a link to the homepage' 

  end
end
