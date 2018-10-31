# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Oauth::TokensController, type: :controller do
  describe 'POST #revoke' do
    let!(:user) { Fabricate(:user) }
    let!(:access_token) { Fabricate(:accessible_access_token, resource_owner_id: user.id) }
    let!(:web_push_subscription) { Fabricate(:web_push_subscription, user: user, access_token: access_token) }

    before do
      post :revoke, params: { token: access_token.token }
    end

    it 'revokes the token' 


    it 'removes web push subscription for token' 

  end
end

