require 'rails_helper'

RSpec.describe Admin::SitesController, type: :controller, admin: true do
  context "when not logged in" do
    [
      ["GET", "/admin/site/edit", :edit, {}],
      ["PATCH", "/admin/site", :update, {}]
    ].each do |method, path, action, params|

      describe "#{method} #{path}" do
        before { process action, method, params }

        it "redirects to the login page" 

      end

    end
  end

  context "when logged in as a moderator" do
    let(:moderator) { FactoryBot.create(:moderator_user) }
    before { login_as(moderator) }

    [
      ["GET", "/admin/site/edit", :edit, {}],
      ["PATCH", "/admin/site", :update, {}]
    ].each do |method, path, action, params|

      describe "#{method} #{path}" do
        before { process action, method, params }

        it "redirects to the admin hub page" 

      end

    end
  end

  context "when logged in as a sysadmin" do
    let(:sysadmin) { FactoryBot.create(:sysadmin_user) }
    before { login_as(sysadmin) }

    describe "GET /admin/site/edit" do
      before { get :edit }

      it "returns 200 OK" 


      it "renders the :edit template" 

    end

    describe "PATCH /admin/site" do
      before { patch :update, site: params }

      context "when the params are invalid" do
        let :params do
          { title: "" }
        end

        it "returns 200 OK" 


        it "renders the :edit template" 

      end

      context "when the params are valid" do
        let :params do
          { title: "Petition parliament" }
        end

        it "redirects to the edit page" 


        it "sets the flash notice message" 

      end

      context "when submitting just the petitions params" do
        let :params do
          { petition_duration: "6", threshold_for_response: "10000", threshold_for_debate: "100000" }
        end

        it "redirects to the edit page" 


        it "sets the flash notice message" 

      end

      context "when submitting just the moderation params" do
        let :params do
          { threshold_for_moderation: "5", minimum_number_of_sponsors: "5", maximum_number_of_sponsors: "20" }
        end

        it "redirects to the edit page" 


        it "sets the flash notice message" 

      end

      context "when submitting just the access params" do
        let :params do
          { enabled: "true", protected: "false", login_timeout: "3600" }
        end

        it "redirects to the edit page" 


        it "sets the flash notice message" 

      end
    end
  end
end

