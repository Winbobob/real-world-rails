require "spec_helper"

describe Organized::MessagesController, type: :controller do
  include_context :geocoder_default_location
  let(:root_path) { organization_messages_path(organization_id: organization.to_param, kind: kind) }
  let(:user) { FactoryGirl.create(:organization_member, organization: organization) }
  let(:bike) { FactoryGirl.create(:bike, owner_email: "party_time@stuff.com") }
  let(:organization) { FactoryGirl.create(:organization, is_paid: false, geolocated_emails: true) }

  before { set_current_user(user) if user.present? }

  describe "create" do
    let(:message_params) do
      {
        kind: kind,
        body: "some message text and stuff",
        bike_id: bike.to_param,
        latitude: default_location[:latitude],
        longitude: default_location[:longitude],
        accuracy: 12
      }
    end

    context "geolocated" do
      let(:kind) { "geolocated" }
      context "organization without geolocated messages" do
        let(:user) { FactoryGirl.create(:organization_admin, organization: organization) }
        let(:organization) { FactoryGirl.create(:organization, is_paid: true, geolocated_emails: false) }
        it "does not create" 

      end

      context "organization with geolocated messages" do
        context "user without organization membership" do
          let(:user) { FactoryGirl.create(:confirmed_user) }
          it "does not create" 

        end

        context "without a required param" do
          it "fails and renders error" 

        end

        it "creates" 

      end
    end
  end

  describe "index" do
    context "organization without geolocated messages" do
      let(:user) { FactoryGirl.create(:organization_admin, organization: organization) }
      let(:organization) { FactoryGirl.create(:organization, is_paid: true, geolocated_emails: false) }
      it "redirects" 

    end
    context "no kind" do
      it "redirects" 

    end
    it "renders" 

  end

  describe "show" do
    let(:organization_message) { FactoryGirl.create(:organization_message, organization: organization) }
    it "renders" 

  end
end

