require "rails_helper"

describe "Admin::StatsController" do
  let(:user) { create :user }

  describe "GET /admin/stats", type: :request do
    it "denies access when logged out" 


    it "denies access for non-admins" 


    it "renders successfully for admins" 

  end

  describe "GET /admin/stats/repositories", type: :request do
    it "denies access when logged out" 


    it "denies access for non-admins" 


    it "renders successfully for admins" 

  end

  describe "GET /admin/graphs", type: :request do
    it "denies access when logged out" 


    it "denies access for non-admins" 


    it "renders successfully for admins" 

  end
end

