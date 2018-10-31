# frozen_string_literal: true
require "spec_helper"

describe WorksController do
  include LoginMacros

  let(:drafts_user_pseud) { create(:pseud, name: "Visiting User Pseud") }
  let(:drafts_user) {
    user = create(:user)
    user.pseuds << drafts_user_pseud
    user
  }
  let!(:default_pseud_work) {
    create(:work, authors: [drafts_user.default_pseud], posted: false, title: "Default pseud work")
  }
  let!(:other_pseud_work) {
    create(:work, authors: [drafts_user_pseud], posted: false, title: "Other pseud work")
  }

  describe "drafts" do
    let(:other_drafts_user) { create(:user) }

    before do
      fake_login_known_user(drafts_user)
    end

    context "no user_id" do
      it "should redirect to the user controller" 


      it "should display an appropriate error message" 

    end

    context "with a valid user_id" do
      context "if the user_id requested doesn't belong to the current user" do
        it "should display an error" 


        it "should redirect to the current user's dashboard" 

      end

      context "if the user_id is that of the current user" do
        it "should display no errors" 


        it "should display all the user's drafts if no pseud_id is specified" 


        it "should display only the drafts for a specific pseud if a pseud_id is specified" 

      end
    end
  end


  describe "post_draft" do
    before do
      fake_login_known_user(drafts_user)
    end

    it "should display an error if the current user is not the owner of the specified work" 


    context "if the work is already posted" do
      it "should display an error" 


      it "should redirect to the user work edit page" 

    end

    it "should display an error if the work is invalid" 


    it "should display a notice message if the work is in a moderated collection" 

  end
end

