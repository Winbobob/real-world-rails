require 'rails_helper'

RSpec.describe Api::V1::BlocksController, type: :controller do
  render_views

  let(:user)  { Fabricate(:user, account: Fabricate(:account, username: 'alice')) }
  let(:token) { Fabricate(:accessible_access_token, resource_owner_id: user.id, scopes: 'follow') }

  before { allow(controller).to receive(:doorkeeper_token) { token } }

  describe 'GET #index' do
    it 'limits according to limit parameter' 


    it 'queries blocks in range according to max_id' 


    it 'queries blocks in range according to since_id' 


    it 'sets pagination header for next path' 


    it 'sets pagination header for previous path' 


    it 'returns http success' 

  end
end

