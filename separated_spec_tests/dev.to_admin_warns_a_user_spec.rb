require "rails_helper"

describe "Admin warns user" do
  let(:admin)       { create(:user, :super_admin) }
  let(:user)        { create(:user) }

  before do
    sign_in admin
    visit "/admin/users/#{user.id}/edit"
  end

  def warn_user
    check("Warned")
    fill_in("Reason for warning", with: "something")
    click_button("Update User")
  end

  describe "invalid warnings" do
    it "fails to warn if no note is left" 


    it "fails to warn if a reason for warning is left but warn box is not checked" 

  end

  describe "valid warning" do
    it "checks that the user is warned and has a reason for warning" 

  end
end

