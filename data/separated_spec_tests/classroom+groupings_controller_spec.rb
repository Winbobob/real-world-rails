# frozen_string_literal: true

require "rails_helper"

RSpec.describe GroupingsController, type: :controller do
  let(:organization)  { classroom_org                                 }
  let(:user)          { classroom_teacher                             }
  let(:grouping)      { create(:grouping, organization: organization) }

  before do
    sign_in_as(user)
  end

  context "flipper is enabled for the user" do
    before do
      GitHubClassroom.flipper[:team_management].enable
    end

    describe "GET #show", :vcr do
      it "returns success status" 

    end

    describe "GET #edit", :vcr do
      it "returns success status" 

    end

    describe "PATCH #update", :vcr do
      let(:update_options) do
        { title: "Fall 2015" }
      end

      before do
        patch :update, params: { organization_id: organization.slug, id: grouping.slug, grouping: update_options }
      end

      it "correctly updates the grouping" 


      it "correctly redirects back" 

    end

    after do
      GitHubClassroom.flipper[:team_management].disable
    end
  end

  context "flipper is not enabled for the user" do
    describe "GET #show", :vcr do
      it "returns a 404" 

    end

    describe "GET #edit", :vcr do
      it "returns success status" 

    end

    describe "PATCH #update", :vcr do
      it "correctly updates the grouping" 

    end
  end
end

