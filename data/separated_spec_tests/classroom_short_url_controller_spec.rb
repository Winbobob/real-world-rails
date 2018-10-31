# frozen_string_literal: true

require "rails_helper"

RSpec.describe ShortUrlController, type: :controller do
  describe "unauthenticated request" do
    describe "GET #accept_assignment", :vcr do
      let(:invitation) { create(:assignment_invitation) }

      context "key is invalid" do
        before do
          get :assignment_invitation, params: { short_key: "WRONG" }
        end

        it "responds with a 404" 

      end

      context "key is valid" do
        before do
          key = invitation.short_key

          get :assignment_invitation, params: { short_key: key }
        end

        it "responds with a 302" 


        it "redirects to the accept assignment page" 

      end
    end

    describe "GET #accept_group_assignment", :vcr do
      let(:invitation) { create(:group_assignment_invitation) }

      context "key is invalid" do
        before do
          get :group_assignment_invitation, params: { short_key: "WRONG" }
        end

        it "responds with a 404" 

      end

      context "key is valid" do
        before do
          key = invitation.short_key

          get :group_assignment_invitation, params: { short_key: key }
        end

        it "responds with a 302" 


        it "redirects to the accept group assignment page" 

      end
    end
  end
end

