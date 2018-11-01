# frozen_string_literal: true

require "rails_helper"

RSpec.describe API::UsersController, type: :controller do
  let(:user) { classroom_teacher }

  describe "GET #authenticated_user", :vcr do
    before do
      get :authenticated_user, params: {
        access_token: user.api_token
      }
    end

    it "returns success" 


    it "returns correct attributes in user serializer" 

  end
end

