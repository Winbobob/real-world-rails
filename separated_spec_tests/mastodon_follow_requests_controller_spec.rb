require 'rails_helper'

RSpec.describe Api::V1::FollowRequestsController, type: :controller do
  render_views

  let(:user)     { Fabricate(:user, account: Fabricate(:account, username: 'alice', locked: true)) }
  let(:token)    { Fabricate(:accessible_access_token, resource_owner_id: user.id, scopes: 'follow') }
  let(:follower) { Fabricate(:account, username: 'bob') }

  before do
    FollowService.new.call(follower, user.account.acct)
    allow(controller).to receive(:doorkeeper_token) { token }
  end

  describe 'GET #index' do
    before do
      get :index, params: { limit: 1 }
    end

    it 'returns http success' 

  end

  describe 'POST #authorize' do
    before do
      post :authorize, params: { id: follower.id }
    end

    it 'returns http success' 


    it 'allows follower to follow' 

  end

  describe 'POST #reject' do
    before do
      post :reject, params: { id: follower.id }
    end

    it 'returns http success' 


    it 'removes follow request' 

  end
end

