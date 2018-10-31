require 'spec_helper'

describe UsersController do
  include RedirectExpectationHelper

  def valid_user_attributes
    {
      email: "sna.foo@gmail.com", login: "myname", age_over_13: "1",
      terms_of_service: "1", password: "password"
    }
  end

  describe "create" do
    context "with valid parameters" do
      before do
        allow_any_instance_of(UsersController).to receive(:check_account_creation_status).and_return(true)
      end

      it "should be successful" 

    end

    context "when invitations are required to sign up" do
      let(:invitation) { create(:invitation) }

      before do
        AdminSetting.update_all(
          account_creation_enabled: true,
          creation_requires_invite: true,
          invite_from_queue_enabled: true
        )
      end

      context "signing up with no invitation" do
        it "redirects with an error" 

      end

      context "signing up with an invalid invitation" do
        it "redirects with an error" 

      end

      context "signing up with a valid invitation" do
        it "succeeeds in creating the account" 

      end

      context "signing up with a used invitation" do
        let(:previous_user) { create(:user) }

        before do
          invitation.mark_as_redeemed(previous_user)
          previous_user.update_attributes(invitation_id: invitation.id)
        end

        it "redirects with an error" 


        context "when the previous user deletes their account" do
          it "redirects with an error" 

        end
      end
    end
  end
end

