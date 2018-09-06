# frozen_string_literal: true
require 'spec_helper'

describe ExternalAuthorsController do
  include LoginMacros
  include RedirectExpectationHelper
  let(:user) { create(:user) }
  let(:invitation) { create(:invitation, external_author: external_author) }
  let(:external_author) { create(:external_author) }

  before(:each) do
    fake_login_known_user(user)
  end

  describe "GET #claim" do
    context "with invalid invitation token" do
      it "redirects with an error" 

    end

    context "with valid invitation token" do
      it "assigns invitation" 

    end

    context "without works to claim" do
      it "redirects with an error" 

    end
  end

  describe "GET #complete_claim" do
    it "redirects with a success message" 

  end

  describe "PUT #update" do
    it "redirects with an error if the user does not have permission" 


    context "when the logged in user is the external author" do
      before(:each) do
        external_author.claim!(user)
      end

      context "when doing nothing with imported works" do
        it "redirects with a success message" 

      end

      context "when orphaning imported works" do
        it "redirects with a success message" 

      end

      context "when deleting imported works" do
        it "redirects with a success message" 

      end
    end

    context "when the user has permission through an invitation" do
      context "when doing nothing with imported works" do
        it "redirects with a success message" 

      end

      context "when orphaning imported works" do
        it "redirects with a success message" 


        context "when updating preferences" do
          xit "renders edit template with a success message for orphaning and an error for preferences" do
            parameters = {
              invitation_token: invitation.token,
              id: external_author.id,
              imported_stories: "orphan",
              do_not_email: true
            }

            allow_any_instance_of(ExternalAuthor).to receive(:update_attributes).and_return(false)
            put :update, params: parameters
            allow_any_instance_of(ExternalAuthor).to receive(:update_attributes).and_call_original
            expect(response).to render_template :edit
            expect(flash[:notice]).to eq "Your imported stories have been orphaned. Thank you for leaving them in the archive! "
            expect(flash[:error]).to eq "There were problems saving your preferences."
          end
        end
      end

      context "when deleting imported works" do
        it "redirects with a success message" 

      end
    end
  end

  describe "GET #edit" do
    it "assigns external_author" 

  end

  describe "GET #index" do
    context "when logged out" do
      before(:each) do
        fake_logout
      end

      it "redirects with notice" 

    end

    context "when logged in as user" do
      context "without archivist permissions" do
        it "assigns external_authors" 


        it "redirects" 

      end
    end

    context "with archivist permissions" do
      before(:each) do
        allow_any_instance_of(User).to receive(:is_archivist?).and_return(true)
      end

      after(:each) do
        allow_any_instance_of(User).to receive(:is_archivist?).and_call_original
      end

      it "assigns external_authors and renders index" 

    end
  end
end

