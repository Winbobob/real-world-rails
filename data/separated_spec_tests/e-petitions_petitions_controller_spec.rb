require 'rails_helper'

RSpec.describe Admin::Archived::PetitionsController, type: :controller, admin: true do
  before do
    FactoryBot.create(:parliament, :archived)
  end

  context "when not logged in" do
    describe "GET /admin/archived/petitions" do
      it "redirects to the login page" 

    end

    describe "GET /admin/archived/petitions/:id" do
      it "redirects to the login page" 

    end
  end

  context "when logged in as a moderator but need to reset password" do
    let(:user) { FactoryBot.create(:moderator_user, force_password_reset: true) }
    before { login_as(user) }

    describe "GET /admin/archived/petitions" do
      it "redirects to the edit profile page" 

    end

    describe "GET /admin/archived/petitions/:id" do
      it "redirects to the edit profile page" 

    end
  end

  context "when logged in as a moderator" do
    let(:user) { FactoryBot.create(:moderator_user) }
    before { login_as(user) }

    describe "GET /admin/archived/petitions" do
      context "when making a HTML request" do
        before { get :index }

        it "returns 200 OK" 


        it "renders the :index template" 

      end

      context "when making a CSV request" do
        before { get :index, format: "csv" }

        it "returns a CSV file" 


        it "doesn't set the content length" 


        it "sets the streaming headers" 


        it "sets the content disposition" 

      end

      context "when searching by id" do
        before { get :index, q: "100000" }

        it "redirects to the admin petition page" 

      end
    end

    describe "GET /admin/archived/petitions/:id" do
      context "when the petition doesn't exist" do
        before { get :show, id: "999999" }

        it "redirects to the admin dashboard page" 


        it "sets the flash alert message" 

      end

      context "when the petition exists" do
        let!(:petition) { FactoryBot.create(:archived_petition) }

        before { get :show, id: petition.to_param }

        it "returns 200 OK" 


        it "renders the :show template" 

      end
    end
  end
end

