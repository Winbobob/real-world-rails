require "rails_helper"

describe "WebHooksController" do
  let(:user) { create :user }
  let(:random_user) { create :user }
  let(:repository) { create(:repository) }
  let!(:repository_permission) { create(:repository_permission, user: user, repository: repository)}
  let(:web_hook) { create(:web_hook, repository: repository) }

  describe "GET /github/:owner/:name/web_hooks", type: :request do
    it "denies access when logged out" 


    it "denies access when user doesnt have pull access to repo" 


    it "renders successfully for logged in users" 

  end

  describe "GET /github/:owner/:name/web_hooks/new", type: :request do
    it "denies access when logged out" 


    it "denies access when user doesnt have pull access to repo" 


    it "renders successfully for logged in users" 

  end

  describe "GET /github/:owner/:name/web_hooks/:id/edit", type: :request do
    it "denies access when logged out" 


    it "denies access when user doesnt have pull access to repo" 


    it "renders successfully for logged in users" 

  end
end

