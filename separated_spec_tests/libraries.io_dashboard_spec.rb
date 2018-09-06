require "rails_helper"

describe "DashboardController" do
  let(:user) { create(:user) }

  describe "GET /dashboard", type: :request do
    it "redirects to /repositories" 

  end

  describe "GET /muted", type: :request do
    it "renders successfully when logged in" 

  end

  describe "GET /home", type: :request do
    it "redirects to /" 

  end

  describe "GET /repositories", type: :request do
    it "renders successfully when logged in" 

  end

  describe "POST /unwatch/:repository_id", type: :request do
    it "redirects to /repositories" 

  end
end

