# frozen_string_literal: true

require "rails_helper"

RSpec.describe API::AssignmentsController, type: :controller do
  let(:organization)          { classroom_org }
  let(:user)                  { classroom_teacher }

  before do
    @assignment = create(:assignment, organization: organization)
  end

  describe "GET #index", :vcr do
    before do
      get :index, params: { organization_id: organization.slug, access_token: user.api_token }
    end

    it "returns success" 


    it "returns only one assignment" 

  end

  describe "GET #show", :vcr do
    before do
      get :show, params: {
        organization_id: organization.slug,
        id: @assignment.slug,
        access_token: user.api_token
      }
    end

    it "returns success" 


    it "returns correct attributes in assignment serializer" 

  end
end

