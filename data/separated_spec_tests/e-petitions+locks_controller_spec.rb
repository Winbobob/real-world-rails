require 'rails_helper'

RSpec.describe Admin::LocksController, type: :controller, admin: true do
  context "when not logged in" do
    [
      ["GET", "/admin/petitions/:petition_id/lock.json", :show, { petition_id: "100000", format: :json }],
      ["POST", "/admin/petitions/:petition_id/lock.json", :create, { petition_id: "100000", format: :json }],
      ["PATCH", "/admin/petitions/:petition_id/lock.json", :update, { petition_id: "100000", format: :json }],
      ["DELETE", "/admin/petitions/:petition_id/lock.json", :destroy, { petition_id: "100000", format: :json }]
    ].each do |method, path, action, params|

      describe "#{method} #{path}" do
        before { process action, method, params }

        it "redirects to the login page" 

      end

    end
  end

  context "when logged in as a moderator requiring a password reset" do
    let(:moderator) { FactoryBot.create(:moderator_user, force_password_reset: true) }
    before { login_as(moderator) }

    [
      ["GET", "/admin/petitions/:petition_id/lock.json", :show, { petition_id: "100000", format: :json }],
      ["POST", "/admin/petitions/:petition_id/lock.json", :create, { petition_id: "100000", format: :json }],
      ["PATCH", "/admin/petitions/:petition_id/lock.json", :update, { petition_id: "100000", format: :json }],
      ["DELETE", "/admin/petitions/:petition_id/lock.json", :destroy, { petition_id: "100000", format: :json }]
    ].each do |method, path, action, params|

      describe "#{method} #{path}" do
        before { process action, method, params }

        it "redirects to the admin profile page" 

      end

    end
  end

  context "when logged in as a moderator" do
    let(:moderator) { FactoryBot.create(:moderator_user) }
    let(:petition) { FactoryBot.create(:petition) }

    before { login_as(moderator) }

    describe "GET /admin/petitions/:petition_id/lock.json" do
      it "returns 200 OK" 


      it "renders the :show template" 


      context "when the petition is locked by the moderator" do
        let(:petition) { FactoryBot.create(:petition, locked_by: moderator, locked_at: 1.hour.ago) }

        it "updates the locked_at timestamp" 

      end

      context "when the petition is locked by someone else" do
        let(:other_user) { FactoryBot.create(:moderator_user) }
        let(:petition) { FactoryBot.create(:petition, locked_by: other_user, locked_at: 1.hour.ago) }

        it "doesn't update the locked_at timestamp" 

      end
    end

    describe "POST /admin/petitions/:petition_id/lock.json" do
      it "returns 200 OK" 


      it "renders the :create template" 


      context "when the petition is unlocked" do
        let(:petition) { FactoryBot.create(:petition, locked_by: nil, locked_at: nil) }

        it "updates the locked_by association" 


        it "updates the locked_at timestamp" 

      end

      context "when the petition is locked by the moderator" do
        let(:petition) { FactoryBot.create(:petition, locked_by: moderator, locked_at: 1.hour.ago) }

        it "doesn't update the locked_by association" 


        it "updates the locked_at timestamp" 

      end

      context "when the petition is locked by someone else" do
        let(:other_user) { FactoryBot.create(:moderator_user) }
        let(:petition) { FactoryBot.create(:petition, locked_by: other_user, locked_at: 1.hour.ago) }

        it "doesn't update the locked_by association" 


        it "doesn't update the locked_at timestamp" 

      end
    end

    describe "PATCH /admin/petitions/:petition_id/lock.json" do
      it "returns 200 OK" 


      it "renders the :update template" 


      context "when the petition is unlocked" do
        let(:petition) { FactoryBot.create(:petition, locked_by: nil, locked_at: nil) }

        it "updates the locked_by association" 


        it "updates the locked_at timestamp" 

      end

      context "when the petition is locked by the moderator" do
        let(:petition) { FactoryBot.create(:petition, locked_by: moderator, locked_at: 1.hour.ago) }

        it "doesn't update the locked_by association" 


        it "updates the locked_at timestamp" 

      end

      context "when the petition is locked by someone else" do
        let(:other_user) { FactoryBot.create(:moderator_user) }
        let(:petition) { FactoryBot.create(:petition, locked_by: other_user, locked_at: 1.hour.ago) }

        it "updates the locked_by association" 


        it "updates the locked_at timestamp" 

      end
    end

    describe "DELETE /admin/petitions/:petition_id/lock.json" do
      it "returns 200 OK" 


      it "renders the :destroy template" 


      context "when the petition is unlocked" do
        let(:petition) { FactoryBot.create(:petition, locked_by: nil, locked_at: nil) }

        it "doesn't update the locked_by association" 


        it "doesn't update the locked_at timestamp" 

      end

      context "when the petition is locked by the moderator" do
        let(:petition) { FactoryBot.create(:petition, locked_by: moderator, locked_at: 1.hour.ago) }

        it "updates the locked_by association" 


        it "updates the locked_at timestamp" 

      end

      context "when the petition is locked by someone else" do
        let(:other_user) { FactoryBot.create(:moderator_user) }
        let(:petition) { FactoryBot.create(:petition, locked_by: other_user, locked_at: 1.hour.ago) }

        it "doesn't update the locked_by association" 


        it "doesn't update the locked_at timestamp" 

      end
    end
  end
end

