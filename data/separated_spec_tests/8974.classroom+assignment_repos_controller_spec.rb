# frozen_string_literal: true

require "rails_helper"

RSpec.describe API::AssignmentReposController, type: :controller do
  let(:organization)      { classroom_org }
  let(:user)              { classroom_teacher }
  let(:assignment)        { create(:assignment, organization: organization, title: "Learn Clojure") }

  describe "GET #index", :vcr do
    before do
      @assignment_repo = create(:assignment_repo, assignment: assignment, github_repo_id: 42, user: user)

      get :index, params: {
        organization_id: organization.slug,
        assignment_id: assignment.slug,
        access_token: user.api_token
      }
    end

    after do
      AssignmentRepo.destroy_all
    end

    it "returns success" 


    it "returns all of the assignment repos" 


    it "returns correct attributes in assignment repo serializer" 

  end

  describe "GET #clone_url", :vcr do
    before do
      @assignment_repo = create(:assignment_repo, assignment: assignment, github_repo_id: 42, user: user)

      get :clone_url, params: {
        organization_id: organization.slug,
        assignment_id: assignment.slug,
        assignment_repo_id: @assignment_repo.id,
        access_token: user.api_token
      }
    end

    after do
      AssignmentRepo.destroy_all
    end

    it "returns success" 


    it "returns json with temp clone url" 

  end
end

