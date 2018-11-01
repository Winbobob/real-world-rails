# frozen_string_literal: true

require "rails_helper"

RSpec.describe API::GroupAssignmentReposController, type: :controller do
  let(:organization)      { classroom_org }
  let(:user)              { classroom_teacher }
  let(:group_assignment)  { create(:group_assignment, organization: organization, title: "Learn Clojure") }
  let(:grouping)          { group_assignment.grouping }
  let(:group)             { create(:group, grouping: grouping, github_team_id: 2_976_561) }

  describe "GET #index", :vcr do
    before do
      @group_assignment_repo = GroupAssignmentRepo.create(group_assignment: group_assignment, group: group)

      get :index, params: {
        organization_id: organization.slug,
        group_assignment_id: group_assignment.slug,
        access_token: user.api_token
      }
    end

    after do
      GroupAssignmentRepo.destroy_all
    end

    it "returns success" 


    it "returns correct attributes in group assignment repo serializer" 

  end

  describe "GET #clone_url", :vcr do
    before do
      @group_assignment_repo = GroupAssignmentRepo.create(group_assignment: group_assignment, group: group)

      get :clone_url, params: {
        organization_id: organization.slug,
        group_assignment_id: group_assignment.slug,
        group_assignment_repo_id: @group_assignment_repo.id,
        access_token: user.api_token
      }
    end

    after do
      GroupAssignmentRepo.destroy_all
    end

    it "returns success" 


    it "returns json with temp clone url" 

  end
end

