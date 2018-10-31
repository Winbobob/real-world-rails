# frozen_string_literal: true

require "rails_helper"

RSpec.describe AssignmentsController, type: :controller do
  let(:organization) { classroom_org                                   }
  let(:user)         { classroom_teacher                               }
  let(:assignment)   { create(:assignment, organization: organization) }

  before do
    sign_in_as(user)
  end

  describe "GET #new", :vcr do
    it "returns success status" 


    it "has a new Assignment" 

  end

  describe "POST #create", :vcr do
    it "creates a new Assignment" 


    it "sends an event to statsd" 


    context "valid starter_code repo_name input" do
      it "creates a new Assignment" 


      it "creates a new Assignment when name has a period" 

    end

    context "invalid starter_code repo_name input" do
      before do
        request.env["HTTP_REFERER"] = "http://test.host/classrooms/new"

        post :create, params: {
          organization_id: organization.slug,
          assignment:      attributes_for(:assignment, organization: organization),
          repo_name:       "https://github.com/rails/rails"
        }
      end

      it "fails to create a new Assignment" 


      it "does not return an internal server error" 


      it "provides a friendly error message" 

    end

    context "valid repo_id for starter_code is passed" do
      before do
        post :create, params: {
          organization_id: organization.slug,
          assignment:      attributes_for(:assignment, organization: organization),
          repo_id:         8514 # 'rails/rails'
        }
      end

      it "creates a new Assignment" 


      it "sets correct starter_code_repo for the new Assignment" 

    end

    context "invalid repo_id for starter_code is passed" do
      before do
        request.env["HTTP_REFERER"] = "http://test.host/classrooms/new"

        post :create, params: {
          organization_id: organization.slug,
          assignment:      attributes_for(:assignment, organization: organization),
          repo_id:         "invalid_id" # id must be an integer
        }
      end

      it "fails to create a new Assignment" 


      it "does not return an internal server error" 


      it "provides a friendly error message" 

    end

    context "deadlines" do
      it "sends an event to statsd" 


      context "valid datetime for deadline is passed" do
        before do
          post :create, params: {
            organization_id: organization.slug,
            assignment:      attributes_for(:assignment, organization: organization)
              .merge(deadline: "05/25/2100 13:17-0800")
          }
        end

        it "creates a new assignment" 


        it "sets deadline" 

      end

      context "invalid datetime for deadline passed" do
        before do
          post :create, params: {
            organization_id: organization.slug,
            assignment:      attributes_for(:assignment, organization: organization)
              .merge(deadline: "I am not a datetime")
          }
        end

        it "creates a new assignment" 


        it "sets deadline to nil" 

      end

      context "no deadline passed" do
        before do
          post :create, params: {
            organization_id: organization.slug,
            assignment:      attributes_for(:assignment, organization: organization)
          }
        end

        it "creates a new assignment" 


        it "sets deadline to nil" 

      end
    end
  end

  describe "GET #show", :vcr do
    it "returns success status" 

  end

  describe "GET #edit", :vcr do
    it "returns success and sets the assignment" 

  end

  describe "PATCH #update", :vcr do
    it "correctly updates the assignment" 


    context "public_repo is changed" do
      it "calls the AssignmentVisibility background job" 

    end

    context "public_repo is not changed" do
      it "will not kick off an AssignmentVisibility job" 

    end

    context "slug is empty" do
      it "correctly reloads the assignment" 

    end
  end

  describe "DELETE #destroy", :vcr do
    it "sets the `deleted_at` column for the assignment" 


    it "calls the DestroyResource background job" 


    it "sends an event to statsd" 


    it "redirects back to the organization" 

  end
end

