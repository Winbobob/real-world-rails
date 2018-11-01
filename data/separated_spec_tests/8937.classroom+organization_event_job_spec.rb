# frozen_string_literal: true

require "rails_helper"
RSpec.describe OrganizationEventJob, type: :job do
  let(:payload) { json_payload("webhook_events/member_removed.json") }

  context "organization doesn't exist in classroom" do
    it "returns false" 

  end

  context "ACTION member_removed", :vcr do
    before(:each) do
      @organization = create(:organization, github_id: payload.dig("organization", "id"))
    end

    describe "returns false" do
      it "if user is the only member" 

    end

    describe "successfully" do
      before(:each) do
        github_user_id = payload.dig("membership", "user", "id")
        @user = create(:user, uid: github_user_id, organization_ids: @organization.id)
      end

      after(:each) do
        @organization.users.destroy_all
      end

      it "deletes user from organization" 


      it "deletes user from organization and transfers assignment ownership" 

    end
  end
end

