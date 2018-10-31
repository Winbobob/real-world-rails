require 'rails_helper'

describe OrganizationsController do
  let(:organization) { create :organization, name: "RailsBridge" }

  describe "permissions" do
    context "a user that is not logged in" do
      it "can not download a subscription list" 

    end
  end

  describe '#download_subscriptions' do
    context "logged in as an organization leader" do
      let(:organization_leader) { create :user }
      let(:subscriber) { create :user, email: "seven_lemurs@example.com" }

      before do
        sign_in organization_leader
        organization.leaders << organization_leader
        OrganizationSubscription.create(subscribed_organization: organization, user: subscriber)
      end

      it "should return the subscribed users" 

    end

    context "logged in as a regular user" do
      it "should redirect" 

    end
  end
end

