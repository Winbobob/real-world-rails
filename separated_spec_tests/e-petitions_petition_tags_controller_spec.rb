require 'rails_helper'

RSpec.describe Admin::Archived::PetitionTagsController, type: :controller, admin: true do
  let!(:petition) { FactoryBot.create(:archived_petition) }
  let!(:creator) { FactoryBot.create(:archived_signature, :validated, creator: true, petition: petition) }

  context "when not logged in" do
    describe "GET /admin/archived/petitions/:petition_id/tags" do
      it "redirects to the login page" 

    end

    describe "PATCH /admin/archived/petitions/:petition_id/tags" do
      it "redirects to the login page" 

    end
  end

  context "when logged in as moderator user but need to reset password" do
    let(:user) { FactoryBot.create(:moderator_user, force_password_reset: true) }
    before { login_as(user) }

    describe "GET /admin/archived/petitions/:petition_id/tags" do
      it "redirects to the edit profile page" 

    end

    describe "PATCH /admin/archived/petitions/:petition_id/tags" do
      it "redirects to the edit profile page" 

    end
  end

  context "when logged in as moderator user" do
    let(:user) { FactoryBot.create(:moderator_user) }
    before { login_as(user) }

    describe "GET /admin/archived/petitions/:petition_id/tags" do
      before { get :show, petition_id: petition.id }

      it "returns 200 OK" 


      it "renders the :show template" 

    end

    describe "PATCH /admin/archived/petitions/:petition_id/tags" do
      before { patch :update, petition_id: petition.id, petition: params }

      context "and the params are invalid" do
        let :params do
          { tags: ["999"] }
        end

        it "returns 200 OK" 


        it "renders the :show template" 

      end

      context "and the params are valid" do
        let :params do
          { tags: [""] }
        end

        it "redirects to the petition page" 


        it "sets the flash notice message" 

      end
    end
  end
end

