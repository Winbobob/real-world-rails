# frozen_string_literal: true

require "rails_helper"

RSpec.describe Stafftools::GroupAssignmentsController, type: :controller do
  let(:user)             { classroom_teacher         }
  let(:group_assignment) { create(:group_assignment) }

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
        get :show, params: { id: group_assignment.id }
      end

      it "succeeds" 


      it "sets the GroupAssignment" 

    end
  end
end

