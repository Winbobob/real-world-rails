require 'spec_helper'

feature "Account Settings", js: true do
  include AuthenticationWorkflow

  describe "as a logged in user" do
    let(:user) { create(:user, email: 'old@email.com') }

    before do
      quick_login_as user
    end

    it "allows me to update my account details" 

  end
end

