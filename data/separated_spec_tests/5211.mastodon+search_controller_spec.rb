require 'rails_helper'

RSpec.describe Api::V1::Accounts::SearchController, type: :controller do
  render_views

  let(:user)  { Fabricate(:user, account: Fabricate(:account, username: 'alice')) }
  let(:token) { Fabricate(:accessible_access_token, resource_owner_id: user.id, scopes: 'read:accounts') }

  before do
    allow(controller).to receive(:doorkeeper_token) { token }
  end

  describe 'GET #show' do
    it 'returns http success' 

  end
end

