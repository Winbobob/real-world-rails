require "spec_helper"

describe InviteRequestsController do
  include LoginMacros
  include RedirectExpectationHelper
  let(:admin) { create(:admin) }

  before { fake_logout }

  describe "GET #index" do
    it "renders" 

  end

  describe "GET #show" do
    context "given invalid emails" do
      it "redirects to index with error" 


      it "renders for an ajax call" 

    end

    context "given valid emails" do
      let(:invite_request) { create(:invite_request) }

      it "renders" 


      it "renders for an ajax call" 

    end
  end

  describe "POST #create" do
    it "redirects to index with error given invalid emails" 


    it "redirects to index with error given valid emails" 


    context "invite queue is disabled" do
      before do
        AdminSetting.first.update_attribute(:invite_from_queue_enabled, false)
      end

      it "redirects to index with error" 

    end
  end

  describe "DELETE #destroy" do
    it "blocks non-admins" 


    context "when logged in as admin" do
      let(:invite_request) { create(:invite_request) }

      before { fake_login_admin(admin) }

      context "when format is HTML" do
        it "redirects to manage with notice" 


        it "redirects to manage at a specified page" 


        it "redirects to manage with error when deletion fails" 


        it "redirects to manage with notice when request cannot be found" 


        context "when there are multiple requests" do
          let!(:invite_request_1) { create(:invite_request) }
          let!(:invite_request_2) { create(:invite_request) }
          let!(:invite_request_3) { create(:invite_request) }

          it "deletes the specified request" 

        end
      end

      context "when format is JSON" do
        it "deletes request and responds with success status and message" 


        it "fails with an error" 

      end
    end
  end

  describe "GET #manage" do
    it "blocks non-admins" 


    context "when logged in as admin" do
      let!(:invite_request_1) { create(:invite_request, position: 9001) }
      let!(:invite_request_2) { create(:invite_request, position: 2) }
      let!(:invite_request_3) { create(:invite_request, position: 7) }

      before { fake_login_admin(admin) }

      it "renders with invite requests in order" 

    end
  end

  describe "POST #reorder" do
    it "blocks non-admins" 


    context "when logged in as admin" do
      before { fake_login_admin(admin) }

      context "given invite requests out of order" do
        let!(:invite_request_1) { create(:invite_request, position: 9001) }
        let!(:invite_request_2) { create(:invite_request, position: 2) }
        let!(:invite_request_3) { create(:invite_request, position: 7) }

        it "redirects to manage with notice" 

      end

      it "redirects to manage with notice given no invite requests" 


      context "when the first invite request is already in the correct position" do
        let(:invite_request) { create(:invite_request) }

        it "redirects to manage with error" 

      end
    end
  end
end

