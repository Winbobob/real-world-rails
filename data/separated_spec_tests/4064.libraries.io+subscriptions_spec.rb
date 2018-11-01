require "rails_helper"

describe "Api::SubscriptionsController" do
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let!(:subscription) { create(:subscription, user: user, project: project) }

  describe "GET /api/subscriptions", type: :request do
    it "renders successfully" 

  end

  describe "GET /api/subscriptions/:platform/:name", type: :request do
    it "renders successfully" 

  end

  describe "POST /api/subscriptions/:platform/:name", type: :request do
    it "renders successfully" 

  end

  describe "POST /api/subscriptions/:platform/:name with no body", type: :request do
    it "renders successfully" 

  end

  describe "PUT /api/subscriptions/:platform/:name", type: :request do
    it "renders successfully" 

  end

  describe "DELETE /api/subscriptions/:platform/:name", type: :request do
    it "renders successfully" 

  end
end

