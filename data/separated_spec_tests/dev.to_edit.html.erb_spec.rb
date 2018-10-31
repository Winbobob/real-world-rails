require "rails_helper"

describe "giveaways/edit.html.erb", type: :view do
  let(:user) { create(:user) }
  let(:current_user) { create(:user, onboarding_package_requested: false) }

  def assign_user_and_errors
    assign(:user, current_user)
    assign(:errors, [])
    allow(view).to receive(:current_user).and_return(current_user)
  end

  context "when user is not logged-in" do
    it "displays twitter log-in option" 


    it "displays github log-in option" 

  end

  context "when user is logged-in and not already onboard" do
    it "tells user it's over" 

  end

  context "when user is logged-in and already onboard" do
    it "allows user to re-apply" 

  end

  context "when user is logged-in, already onboarded, and already re-requested" do
    it "allows user to re-apply" 

  end
end

