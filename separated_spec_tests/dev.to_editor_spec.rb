require "rails_helper"

RSpec.describe "Editor", type: :request do
  describe "GET /new" do
    context "when not logged-in" do
      it "does not render markdown form" 


      it "asks the stray-user to 'Sign In or Create Your Account'" 

    end
  end

  describe "GET /:article/edit" do
    let(:user) { create(:user) }
    let(:article) { create(:article, user: user) }

    context "when not logged-in" do
      it "redirects to /enter" 

    end

    context "when logged-in" do
      it "render markdown form" 

    end
  end

  describe "POST /articles/preview" do
    let(:user) { create(:user) }
    let(:article) { create(:article, user: user) }
    let(:headers) { { "Content-Type": "application/json", Accept: "application/json" } }

    context "when not logged-in" do
      it "redirects to /enter" 

    end

    context "when logged-in" do
      it "returns json" 

    end
  end
end

