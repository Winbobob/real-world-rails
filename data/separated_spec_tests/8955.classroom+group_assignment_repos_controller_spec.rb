# frozen_string_literal: true

require "rails_helper"

RSpec.describe Orgs::GroupAssignmentReposController, type: :controller do
  let(:user)         { classroom_teacher }
  let(:organization) { classroom_org     }
  let(:student)      { classroom_student }
  let(:repo_access)  { RepoAccess.create(user: student, organization: organization) }
  let(:group_assignment) do
    create(:group_assignment, title: "Learn Ruby", organization: organization, public_repo: false)
  end
  let(:group) { create(:group, grouping: group_assignment.grouping, github_team_id: 2_976_561) }
  let(:group_assignment_repo) { GroupAssignmentRepo.create(group_assignment: group_assignment, group: group) }

  before(:each) do
    sign_in_as(user)
  end

  after do
    GroupAssignmentRepo.destroy_all
  end

  describe "GET #show", :vcr do
    context "as an unauthorized user" do
      before do
        sign_out
      end

      it "returns a 404" 

    end

    context "as an authorized user" do
      context "with properly scoped resource" do
        before do
          params = {
            id: group_assignment_repo.id,
            organization_id: organization.slug,
            group_assignment_id: group_assignment.slug
          }

          get :show, params: params
        end

        it "succeeds" 


        it "sets the GroupAssignmentRepo" 

      end

      context "with improperly scoped resource" do
        it "returns not found" 

      end
    end
  end
end

