# controller specs are now discouraged in favor of request specs.
# This file should eventually be removed
require "rails_helper"

RSpec.describe ArticlesController, type: :controller do
  let(:user) { create(:user) }

  describe "GET #feed" do
    it "works" 

  end

  describe "GET #new" do
    before { sign_in user }

    context "with authorized user" do
      it "returns a new article" 

    end

    context "with authorized user with tag param" do
      it "returns a new article" 

    end
  end
end

