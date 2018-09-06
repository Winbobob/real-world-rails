require 'rails_helper'

describe 'devise/mailer/reset_password_instructions.html.haml', type: "view" do
  context "logged in" do
    before(:each) do
      @resource = mock_model(Member)
      @resource.stub(:email).and_return("example@example.com")
      @resource.stub(:reset_password_token).and_return("joe")
      render
    end

    it 'should have some of the right text' 

  end
end

