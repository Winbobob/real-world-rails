# frozen_string_literal: true

require "rails_helper"

RSpec.describe GroupAssignmentsController, type: :controller do
  let(:user)             { classroom_teacher                                     }
  let(:organization)     { classroom_org                                         }
  let(:group_assignment) { create(:group_assignment, organization: organization) }

  before do
    sign_in_as(user)
  end

  describe "GET #new", :vcr do
    it "returns success status" 


    it "has a new GroupAssignment" 

  end

  describe "POST #create", :vcr do
    before do
      request.env["HTTP_REFERER"] = "http://classroomtest.com/organizations/#{organization.slug}/group-assignments/new"
    end

    it "creates a new GroupAssignment" 


    it "sends an event to statsd" 


    it "does not allow groupings to be added that do not belong to the organization" 


    context "deadlines" do
      it "sends an event to statsd" 


      context "valid datetime for deadline is passed" do
        before do
          post :create, params: {
            organization_id:  organization.slug,
            grouping:         { title: "Grouping 1" },
            group_assignment: attributes_for(:group_assignment, organization: organization)
              .merge(deadline: "05/25/2118 13:17-0800")
          }
        end

        it "creates a new assignment" 


        it "sets deadline" 

      end

      context "invalid datetime for deadline passed" do
        before do
          post :create, params: {
            organization_id:  organization.slug,
            grouping:         { title: "Grouping 1" },
            group_assignment: attributes_for(:group_assignment, organization: organization)
              .merge(deadline: "I am not a datetime")
          }
        end

        it "creates a new assignment" 


        it "sets deadline to nil" 

      end

      context "no deadline passed" do
        before do
          post :create, params: {
            organization_id:  organization.slug,
            grouping:         { title: "Grouping 1" },
            group_assignment: attributes_for(:group_assignment, organization: organization)
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
    it "returns success status and sets the group assignment" 

  end

  describe "PATCH #update", :vcr do
    it "correctly updates the assignment" 


    context "public_repo attribute is changed" do
      it "calls the AssignmentVisibility background job" 

    end

    context "public_repo attribute is not changed" do
      it "will not kick off an AssignmentVisibility background job" 

    end

    context "slug is empty" do
      it "correctly reloads the assignment" 

    end
  end

  describe "DELETE #destroy", :vcr do
    it "sets the `deleted_at` column for the group assignment" 


    it "calls the DestroyResource background job" 


    it "sends an event to statsd" 


    it "redirects back to the organization" 

  end
end

