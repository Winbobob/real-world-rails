require "spec_helper"

describe Opendoors::ToolsController do
  include LoginMacros
  include RedirectExpectationHelper

  let(:user) { create(:user) }
  let(:opendoors_user) { create(:opendoors_user) }

  describe "GET #index" do
    it "denies access if not logged in with Open Doors privileges" 


    context "when logged in with Open Doors privileges" do
      before { fake_login_known_user(opendoors_user) }

      it "shows the tools page" 


      it "optionally recognizes the imported-from URL" 

    end
  end

  describe "POST #url_update" do
    it "denies access if not logged in with Open Doors privileges" 


    context "when logged in with Open Doors privileges" do
      before { fake_login_known_user(opendoors_user) }

      it "redirects to tools if work URL is missing" 


      it "redirects to tools if work URL is invalid" 


      it "redirects to tools if work ID is not found" 


      context "with a valid work ID" do
        let(:work) { create(:work) }
        let(:work_with_imported_from_url) { create(:work, imported_from_url: "http://example.org/my-immortal") }

        it "redirects to tools if imported-from URL is missing" 


        it "redirects to tools if imported-from URL is invalid" 


        it "redirects to tools if imported-from URL is already used in another work" 


        it "updates work if imported-from URL is valid" 


        it "updates work if imported-from URL has non-ASCII characters" 

      end
    end
  end
end

