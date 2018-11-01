# frozen_string_literal: true

require "rails_helper"

RSpec.describe OrganizationsController, type: :controller do
  let(:organization)  { classroom_org     }
  let(:user)          { classroom_teacher }
  let(:student)       { classroom_student }

  before do
    sign_in_as(user)
  end

  describe "GET #index", :vcr do
    context "unauthenticated user" do
      before do
        sign_out
      end

      it "redirects to login_path" 

    end

    context "authenticated user with a valid token" do
      it "succeeds" 


      it "sets the users organization" 

    end

    context "user with admin privilege on the organization but not part of the classroom" do
      before(:each) do
        organization.users = []
      end

      it "adds the user to the classroom" 

    end

    context "user without admin privilege on the organization" do
      before(:each) do
        sign_in_as(student)
      end

      it "does not add the user to the classroom" 

    end

    context "authenticated user with an invalid token" do
      before do
        allow(user).to receive(:ensure_no_token_scope_loss).and_return(true)
        user.update_attributes(token: "1234")
      end

      it "logs out user" 

    end
  end

  describe "GET #new", :vcr do
    it "returns success status" 


    it "has a new organization" 


    it "has an Kaminari::PaginatableArray of the users GitHub organizations that they are an admin of" 


    it "will not include any organizations that are already apart of classroom" 

  end

  describe "POST #create", :vcr do
    before do
      request.env["HTTP_REFERER"] = "http://classroomtest.com/orgs/new"
    end

    after(:each) do
      organization.destroy!
    end

    context "multiple_classrooms_per_org flag not enabled" do
      before do
        GitHubClassroom.flipper[:multiple_classrooms_per_org].disable
      end

      it "will not add an organization that already exists" 

    end

    context "multiple_classrooms_per_org flag is enabled" do
      before do
        GitHubClassroom.flipper[:multiple_classrooms_per_org].enable
      end

      after do
        GitHubClassroom.flipper[:multiple_classrooms_per_org].disable
      end

      it "will add a classroom on same organization" 

    end

    it "will fail to add an organization the user is not an admin of" 


    it "will add an organization that the user is admin of on GitHub" 


    it "will redirect the user to the setup page" 

  end

  describe "GET #show", :vcr do
    it "returns success and sets the organization" 

  end

  describe "GET #edit", :vcr do
    it "returns success and sets the organization" 

  end

  describe "GET #invitation", :vcr do
    it "returns success and sets the organization" 

  end

  describe "PATCH #remove_user", :vcr do
    context "returns 404" do
      it "user is not an org owner" 


      it "user does not exist" 

    end

    context "removes user from classroom" do
      before(:each) do
        teacher = create(:user)
        organization.users << teacher
      end

      it "without assignments" 


      it "with assignments" 

    end
  end

  describe "GET #show_groupings", :vcr do
    context "flipper is enabled" do
      before do
        GitHubClassroom.flipper[:team_management].enable
      end

      it "returns success and sets the organization" 


      after do
        GitHubClassroom.flipper[:team_management].disable
      end
    end

    context "flipper is not enabled" do
      it "returns success and sets the organization" 

    end
  end

  describe "PATCH #update", :vcr do
    it "correctly updates the organization" 

  end

  describe "DELETE #destroy", :vcr do
    it "sets the `deleted_at` column for the organization" 


    it "calls the DestroyResource background job" 


    it "redirects back to the index page" 

  end

  describe "GET #invite", :vcr do
    it "returns success and sets the organization" 

  end

  describe "GET #setup", :vcr do
    it "returns success and sets the organization" 

  end

  describe "PATCH #setup_organization", :vcr do
    before(:each) do
      options = { title: "New Title" }
      patch :update, params: { id: organization.slug, organization: options }
    end

    it "correctly updates the organization" 


    it "redirects to the invite page on success" 

  end
end

