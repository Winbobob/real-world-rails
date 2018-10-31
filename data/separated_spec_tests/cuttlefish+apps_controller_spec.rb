# frozen_string_literal: true

require "spec_helper"

describe AppsController, type: :controller do
  before :each do
    request.env["HTTPS"] = "on"
  end

  context "signed in" do
    let(:team) { Team.create! }
    let(:admin) do
      team.admins.create!(email: "matthew@foo.bar", password: "foobar")
    end
    before(:each) { sign_in admin }

    describe "#show" do
      let(:app) { create(:app, team: team) }

      it "should be able to show" 


      context "app doesn't exist" do
        before(:each) { app.destroy }

        it "should 404" 

      end

      context "app is in a different team" do
        let(:app) { create(:app) }

        it "should raise an error" 

      end
    end

    describe "POST create" do
      it "should create an app that is part of the current user's team" 


      it "should have errors on the variable when there's a validation error" 

    end

    describe "#update" do
      let(:app) { create(:app, team: team) }

      it "should be able to update just the open_tracking_enabled" 


      it "should be able to update just the from domain" 

    end

    describe "#toggle_dkim" do
      let(:app) { create(:app, team: team, from_domain: "foo.com") }

      it "should show an error" 


      context "DNS for DKIM is correctly configured" do
        before(:each) do
          allow_any_instance_of(DkimDns).to receive(:dkim_dns_configured?) {
            true
          }
        end

        it "should be able to enable DKIM" 


        it "should redirect to the app" 

      end

      context "DKIM is enabled" do
        before :each do
          allow_any_instance_of(DkimDns).to receive(:dkim_dns_configured?) {
            true
          }
          app.update_attributes!(dkim_enabled: true)
        end

        it "should be able to disable DKIM" 


        it "should redirect to the app" 

      end
    end

    describe "#upgrade_dkim" do
      context "with a legacy dkim selector" do
        let(:app) { create(:app, team: team, legacy_dkim_selector: true) }

        it "should upgrade the dkim selector" 


        it "redirects back to the app" 


        it "lets the user know that it all worked" 

      end

      context "dkim selector already upgraded" do
        let(:app) { create(:app, team: team, legacy_dkim_selector: false) }

        it "shouldn't change the selector" 

      end

      context "app is in a different team" do
        let(:app) { create(:app, legacy_dkim_selector: true) }

        it "should raise an error" 

      end

      context "app doesn't exist" do
        let(:app) { create(:app, team: team, legacy_dkim_selector: false) }
        before(:each) { app.destroy }

        it "should raise an error" 

      end
    end
  end
end

