# frozen_string_literal: true

require "rails_helper"

RSpec.describe Stafftools::OrganizationsController, type: :controller do
  let(:organization) { classroom_org     }
  let(:user)         { classroom_teacher }

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
        get :show, params: { id: organization.id }
      end

      it "succeeds" 


      it "sets the organization" 

    end
  end

  describe "DELETE #remove_user", :vcr do
    context "as an unauthorized user" do
      it "returns a 404" 

    end

    context "as an authorized user" do
      before do
        user.update_attributes(site_admin: true)
      end

      context "when user does not own any assignments" do
        before do
          delete :remove_user, params: { id: organization.id, user_id: user.id }
        end

        it "deletes user from the Organization" 


        it "displays a helpful flash success message" 


        it "redirects to stafftools organization path" 

      end

      context "when user owns at least one assignment" do
        before do
          create(:assignment, creator: user, organization: organization, title: "Title")
          delete :remove_user, params: { id: organization.id, user_id: user.id }
        end

        it "does not delete the user from the Organization" 


        it "displays an error flash message" 


        it "redirects to stafftools organization path" 

      end
    end
  end
end

