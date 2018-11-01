# frozen_string_literal: true

require "rails_helper"

RSpec.describe Stafftools::GroupAssignmentReposController, type: :controller do
  let(:user)         { classroom_teacher }
  let(:organization) { classroom_org     }
  let(:student)      { classroom_student }
  let(:repo_access)  { RepoAccess.create(user: student, organization: organization) }
  let(:group_assignment) do
    create(:group_assignment, title: "Learn Ruby", organization: organization, public_repo: false)
  end
  let(:group) { create(:group, grouping: group_assignment.grouping, github_team_id: 2_976_561) }
  let(:group_assignment_repo) do
    GroupAssignmentRepo.create(group_assignment: group_assignment, group: group)
  end

  before(:each) do
    sign_in_as(user)
  end

  after do
    GroupAssignmentRepo.destroy_all
  end

  describe "GET #show", :vcr do
    context "as an unauthorized user" do
      it "returns a 404" 

    end

    context "as an authorized user" do
      before do
        user.update_attributes(site_admin: true)
        get :show, params: { id: group_assignment_repo.id }
      end

      it "succeeds" 


      it "sets the GroupAssignmentRepo" 

    end
  end

  describe "DELETE #destroy", :vcr do
    context "as an unauthorized user" do
      it "returns a 404" 

    end

    context "as an authorized user" do
      before do
        user.update_attributes(site_admin: true)
        delete :destroy, params: { id: group_assignment_repo.id }
      end

      it "deletes the assignment repo" 


      it "redirects to the assignment show page" 

    end
  end
end
