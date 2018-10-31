require 'rails_helper'

RSpec.describe Api::V1::DomainBlocksController, type: :controller do
  render_views

  let(:user)  { Fabricate(:user, account: Fabricate(:account, username: 'alice')) }
  let(:token) { Fabricate(:accessible_access_token, resource_owner_id: user.id, scopes: scopes) }

  before do
    user.account.block_domain!('example.com')
    allow(controller).to receive(:doorkeeper_token) { token }
  end

  shared_examples 'forbidden for wrong scope' do |wrong_scope|
    let(:scopes) { wrong_scope }

    it 'returns http forbidden' 

  end

  describe 'GET #show' do
    let(:scopes) { 'read:blocks' }

    before do
      get :show, params: { limit: 1 }
    end

    it 'returns http success' 


    it 'returns blocked domains' 


    it_behaves_like 'forbidden for wrong scope', 'write:statuses'
  end

  describe 'POST #create' do
    let(:scopes) { 'write:blocks' }

    before do
      post :create, params: { domain: 'example.org' }
    end

    it 'returns http success' 


    it 'creates a domain block' 


    it_behaves_like 'forbidden for wrong scope', 'write:statuses'
  end

  describe 'DELETE #destroy' do
    let(:scopes) { 'write:blocks' }

    before do
      delete :destroy, params: { domain: 'example.com' }
    end

    it 'returns http success' 


    it 'deletes a domain block' 


    it_behaves_like 'forbidden for wrong scope', 'write:statuses'
  end
end

