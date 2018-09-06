# frozen_string_literal: true

require "rails_helper"

describe TopicsController, type: :controller do
  let(:user) { create(:user) }
  let(:user1) { create(:user) }

  before do
    request.env["HTTP_USER_AGENT"] = "turbolinks-app, rspec"
  end

  it "should got 401 with turbolinks-app" 


  describe "access with access_token" do
    let(:access_token) { create(:access_token, resource_owner_id: user.id) }
    let(:access_token1) { create(:access_token, resource_owner_id: user1.id) }

    it "should work" 


    it "should work with other user" 

  end
end

