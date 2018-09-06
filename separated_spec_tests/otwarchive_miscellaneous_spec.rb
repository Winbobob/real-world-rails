# frozen_string_literal: true
require "spec_helper"

describe WorksController do
  include LoginMacros
  include RedirectExpectationHelper

  context "reindex" do
    let(:work) { create(:work) }

    context "if the user is an admin or tag wrangler" do
      let(:admin) { create(:admin) }

      before do
        fake_login_admin(admin)
      end

      it "should queue the work for reindex" 

      it "should redirect to the root path and display a success message" 

    end

    context "if the user is not an admin" do
      it "should redirect to the root path and display an error" 

    end
  end
end

