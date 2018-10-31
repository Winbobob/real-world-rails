require "spec_helper"

describe AdminPostsController do
  include LoginMacros
  include RedirectExpectationHelper

  describe "POST #create" do
    before { fake_login_admin(create(:admin)) }

    let(:base_params) { { title: "AdminPost Title",
                          content: "AdminPost content long enough to pass validation" } }

    context "when admin post is valid" do
      it "redirects to post with notice" 

    end

    context "when admin post is invalid" do
      context "with invalid translated post id" do
        it "renders the new template with error message" 

      end
    end
  end
end

