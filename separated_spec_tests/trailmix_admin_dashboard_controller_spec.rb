require "rails_helper"

describe AdminDashboardController do
  describe "#show" do
    context "when a logged out user requests it" do
      it "redirects" 

    end

    context "when a non-admin user requests it" do
      it "redirects" 

    end

    context "when an admin requests it" do
      it "renders successfully" 

    end
  end

  def stub_current_user_with(user)
    allow(controller).to(receive(:authenticate_user!))
    allow(controller).to(receive(:current_user).and_return(user))
  end
end

