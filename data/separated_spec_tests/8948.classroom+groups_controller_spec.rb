# frozen_string_literal: true

require "rails_helper"

RSpec.describe GroupsController, type: :controller do
  let(:organization)  { classroom_org     }
  let(:user)          { classroom_teacher }

  let(:grouping) { create(:grouping, organization: organization) }
  let(:group)    { create(:group, grouping: grouping, github_team_id: 2_976_595) }

  before do
    sign_in_as(user)
  end

  after(:each) do
    RepoAccess.destroy_all
  end

  context "flipper is enabled for the user" do
    before do
      GitHubClassroom.flipper[:team_management].enable
    end

    describe "PATCH #add_membership", :vcr do
      before do
        RepoAccess.find_or_create_by!(user: user, organization: organization)
      end

      it "correctly adds the user" 

    end

    describe "DELETE #remove_membership", :vcr do
      before do
        repo_access = RepoAccess.find_or_create_by!(user: user, organization: organization)
        group.repo_accesses << repo_access
      end

      it "correctly removes the user" 


      after do
        repo_access = RepoAccess.find_or_create_by!(user: user, organization: organization)
        group.repo_accesses.delete(repo_access)
      end
    end

    after do
      GitHubClassroom.flipper[:team_management].disable
    end
  end

  context "flipper is not enabled for the user" do
    describe "PATCH #remove_membership", :vcr do
      it "returns a 404" 

    end

    describe "DELETE #remove_membership", :vcr do
      it "returns a 404" 

    end
  end
end

