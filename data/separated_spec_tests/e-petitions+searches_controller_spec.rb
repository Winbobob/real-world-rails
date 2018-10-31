require 'rails_helper'

RSpec.describe Admin::SearchesController, type: :controller, admin: true do
  context "when not logged in" do
    describe "GET /admin/search" do
      it "redirects to the login page" 

    end
  end

  context "when logged in as a moderator but need to reset password" do
    let(:user) { FactoryBot.create(:moderator_user, force_password_reset: true) }
    before { login_as(user) }

    describe "GET /admin/search" do
      it "redirects to the edit profile page" 

    end
  end

  context "when logged in as a moderator" do
    let(:user) { FactoryBot.create(:moderator_user) }
    before { login_as(user) }

    describe "GET /admin/search" do
      context "when searching for petitions" do
        it "redirects to the petitions search url" 

      end

      context "when searching for petitions with tags" do
        it "redirects to the petitions search url" 

      end

      context "when searching for petitions with no tags" do
        it "redirects to the petitions search url" 

      end

      context "when searching for signatures" do
        it "redirects to the signatures search url" 

      end

      context "when searching for an unknown type" do
        it "redirects to the admin dashboard url" 

      end
    end
  end
end

