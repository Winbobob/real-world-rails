require "rails_helper"

RSpec.describe "SocialPreviews", type: :request do
  let(:user) { create(:user) }
  let(:tag) { create(:tag) }
  let(:organization) { create(:organization) }
  let(:article) { create(:article, user_id: user.id) }

  describe "GET /social_previews/article/:id" do
    it "renders proper article title" 

  end

  describe "GET /social_previews/user/:id" do
    it "renders proper user name" 

  end

  describe "GET /social_previews/user/:id" do
    it "renders proper organization name" 

  end

  describe "GET /social_previews/user/:id" do
    it "renders proper tag name" 

  end
end

