# frozen_string_literal: true

require "rails_helper"

RSpec.describe Stafftools::AssignmentReposController, type: :controller do
  let(:organization) { classroom_org     }
  let(:user)         { classroom_teacher }

  let(:assignment)      { create(:assignment, organization: organization) }
  let(:assignment_repo) { create(:assignment_repo, github_repo_id: 42, assignment: assignment) }

  before(:each) do
    sign_in_as(user)
  end

  describe "GET #show", :vcr do
    context "as an unauthorized user" do
      it "returns a 404" 

    end

    context "as an authorized user" do
      before do
        user.update_attributes(site_admin: true)
        get :show, params: { id: assignment_repo.id }
      end

      it "succeeds" 


      it "sets the AssignmentRepo" 

    end
  end

  describe "DELETE #destroy", :vcr do
    context "as an unauthorized user" do
      it "returns a 404" 

    end

    context "as an authorized user" do
      before do
        user.update_attributes(site_admin: true)
        delete :destroy, params: { id: assignment_repo.id }
      end

      it "deletes the assignment repo" 


      it "redirects to the assignment show page" 

    end
  end
end

