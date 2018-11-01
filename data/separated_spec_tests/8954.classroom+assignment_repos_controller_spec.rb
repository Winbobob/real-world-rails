# frozen_string_literal: true

require "rails_helper"

RSpec.describe Orgs::AssignmentReposController, type: :controller do
  let(:organization) { classroom_org     }
  let(:user)         { classroom_teacher }

  let(:assignment)      { create(:assignment, organization: organization) }
  let(:assignment_repo) { create(:assignment_repo, github_repo_id: 42, assignment: assignment) }

  before(:each) do
    sign_in_as(user)
  end

  describe "GET #show", :vcr do
    context "unauthenticated user" do
      before do
        sign_out
      end

      it "redirect to login path" 

    end

    context "authenticated user" do
      context "with scoped resource" do
        before do
          get :show, params: {
            organization_id: organization.slug,
            assignment_id: assignment.slug,
            id: assignment_repo.id
          }
        end

        it "returns success status" 


        it "sets the AssignmentRepo" 

      end

      context "with improperly scope resource" do
        it "returns not found" 

      end
    end
  end
end

