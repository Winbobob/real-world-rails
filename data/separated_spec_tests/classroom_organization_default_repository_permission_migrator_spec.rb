# frozen_string_literal: true

require "rails_helper"

describe OrganizationDefaultRepositoryPermissionMigrator do
  describe "::perform", :vcr do
    describe "successful migration" do
      let(:org) { classroom_org }

      it "returns a success Result" 

    end

    describe "unsuccessful migration" do
      let(:org) { create(:organization, github_id: 99_999_999) }

      it "returns a failed result if the organization doesn't have users" 


      it "returns a failed result if the organization doesn't have any authenticated admins" 

    end
  end
end

