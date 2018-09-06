require 'spec_helper'

module Admin
  describe ManagerInvitationsController, type: :controller do
    let!(:enterprise_owner) { create(:user) }
    let!(:other_enterprise_user) { create(:user) }
    let!(:existing_user) { create(:user) }
    let!(:enterprise) { create(:enterprise, owner: enterprise_owner ) }
    let!(:enterprise2) { create(:enterprise, owner: other_enterprise_user ) }
    let(:admin) { create(:admin_user) }

    describe "#create" do
      context "when given email matches an existing user" do
        before do
          controller.stub spree_current_user: admin
        end

        it "returns an error" 

      end

      context "signing up a new user" do
        before do
          controller.stub spree_current_user: admin
        end

        it "creates a new user, sends an invitation email, and returns the user id" 

      end
    end

    describe "with enterprise permissions" do
      context "as user with proper enterprise permissions" do
        before do
          controller.stub spree_current_user: enterprise_owner
        end

        it "returns success code" 

      end

      context "as another enterprise user without permissions for this enterprise" do
        before do
          controller.stub spree_current_user: other_enterprise_user
        end

        it "returns unauthorized response" 

      end
    end
  end
end

