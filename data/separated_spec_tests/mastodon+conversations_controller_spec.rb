require 'rails_helper'

RSpec.describe Api::V1::ConversationsController, type: :controller do
  render_views

  let!(:user) { Fabricate(:user, account: Fabricate(:account, username: 'alice')) }
  let(:token) { Fabricate(:accessible_access_token, resource_owner_id: user.id, scopes: scopes) }
  let(:other) { Fabricate(:user, account: Fabricate(:account, username: 'bob')) }

  before do
    allow(controller).to receive(:doorkeeper_token) { token }
  end

  describe 'GET #index' do
    let(:scopes) { 'read:statuses' }

    before do
      PostStatusService.new.call(other.account, 'Hey @alice', nil, visibility: 'direct')
    end

    it 'returns http success' 


    it 'returns pagination headers' 


    it 'returns conversations' 

  end
end

