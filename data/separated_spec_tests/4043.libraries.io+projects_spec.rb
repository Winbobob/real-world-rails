require "rails_helper"

describe "Admin::ProjectController" do
  let(:user) { create :user }

  describe "GET /admin/projects", type: :request do
    it "denies access when logged out" 


    it "denies access for non-admins" 


    it "renders successfully for admins" 

  end

  describe "GET /admin/projects/deprecated", type: :request do
    it "denies access when logged out" 


    it "denies access for non-admins" 


    it "renders successfully for admins" 

  end

  describe "GET /admin/projects/unmaintained", type: :request do
    it "denies access when logged out" 


    it "denies access for non-admins" 


    it "renders successfully for admins" 

  end
end

