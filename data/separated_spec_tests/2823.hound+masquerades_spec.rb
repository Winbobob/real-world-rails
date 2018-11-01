# frozen_string_literal: true
require "rails_helper"

describe "GET /masqerades?username=:username" do
  context "as an admin" do
    it "redirects to repos as the maqueraded user" 

  end

  context "as a non-admin user" do
    it "redirects to root and does not masquerade as user" 

  end

  def sign_in_as(user)
    stub_oauth(username: user.username, email: user.email, token: user.token)
    get "/auth/github"
    follow_redirect!
  end
end

