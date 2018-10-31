require "rails_helper"

RSpec.describe "Dashboards", type: :request do
  let(:user)          { create(:user) }
  let(:second_user)   { create(:user) }
  let(:super_admin)   { create(:user, :super_admin) }
  let(:article)       { create(:article, user_id: user.id) }

  describe "GET /dashboard" do
    context "when not logged in" do
      it "redirects to /enter" 

    end

    context "when logged in" do
      it "renders user's articles" 

    end

    context "when logged in as a super admin" do
      it "renders the specified user's articles" 

    end
  end

  describe "GET /dashboard/organization" do
    let(:organization) { create(:organization) }

    context "when not logged in" do
      it "redirects to /enter" 

    end

    context "when logged in" do
      it "renders user's organization articles" 

    end
  end

  describe "GET /dashboard/following_users" do
    context "when not logged in" do
      it "redirects to /enter" 

    end

    context "when logged in" do
      it "renders the current user's followings" 

    end
  end

  describe "GET /dashboard/user_followers" do
    context "when not logged in" do
      it "redirects to /enter" 

    end

    context "when logged in" do
      it "renders the current user's followers" 

    end
  end
end

