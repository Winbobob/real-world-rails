require 'rails_helper'

RSpec.describe Api::V1::SuggestionsController, type: :controller do
  render_views

  let(:user)  { Fabricate(:user) }
  let(:token) { Fabricate(:accessible_access_token, resource_owner_id: user.id, scopes: 'read write') }

  before do
    allow(controller).to receive(:doorkeeper_token) { token }
  end

  describe 'GET #index' do
    let(:bob) { Fabricate(:account) }
    let(:jeff) { Fabricate(:account) }

    before do
      PotentialFriendshipTracker.record(user.account_id, bob.id, :reblog)
      PotentialFriendshipTracker.record(user.account_id, jeff.id, :favourite)

      get :index
    end

    it 'returns http success' 


    it 'returns accounts' 

  end
end

