require "rails_helper"

describe "Admin::RepositoriesController" do
  let(:user) { create :user }
  let!(:repository) { create :repository }

  describe "GET /admin/repositories", type: :request do
    it "denies access when logged out" 


    it "denies access for non-admins" 


    it "renders successfully for admins" 

  end

  describe "GET /admin/repositories/deprecated", type: :request do
    it "denies access when logged out" 


    it "denies access for non-admins" 


    it "renders successfully for admins" 

  end

  describe "GET /admin/repositories/unmaintained", type: :request do
    it "denies access when logged out" 


    it "denies access for non-admins" 


    it "renders successfully for admins" 

  end

  describe "GET /admin/repositories/:id", type: :request do
    let(:repository) { create(:repository) }

    it "denies access when logged out" 


    it "denies access for non-admins" 


    it "renders successfully for admins" 

  end
end

