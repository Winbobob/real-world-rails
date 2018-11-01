require 'rails_helper'

RSpec.describe Api::V1::AccountsController, type: :controller do
  render_views

  let(:user)   { Fabricate(:user, account: Fabricate(:account, username: 'alice')) }
  let(:scopes) { '' }
  let(:token)  { Fabricate(:accessible_access_token, resource_owner_id: user.id, scopes: scopes) }

  before do
    allow(controller).to receive(:doorkeeper_token) { token }
  end

  shared_examples 'forbidden for wrong scope' do |wrong_scope|
    let(:scopes) { wrong_scope }

    it 'returns http forbidden' 

  end

  describe 'GET #show' do
    let(:scopes) { 'read:accounts' }

    before do
      get :show, params: { id: user.account.id }
    end

    it 'returns http success' 


    it_behaves_like 'forbidden for wrong scope', 'write:statuses'
  end

  describe 'POST #follow' do
    let(:scopes) { 'write:follows' }
    let(:other_account) { Fabricate(:user, email: 'bob@example.com', account: Fabricate(:account, username: 'bob', locked: locked)).account }

    before do
      post :follow, params: { id: other_account.id }
    end

    context 'with unlocked account' do
      let(:locked) { false }

      it 'returns http success' 


      it 'returns JSON with following=true and requested=false' 


      it 'creates a following relation between user and target user' 


      it_behaves_like 'forbidden for wrong scope', 'read:accounts'
    end

    context 'with locked account' do
      let(:locked) { true }

      it 'returns http success' 


      it 'returns JSON with following=false and requested=true' 


      it 'creates a follow request relation between user and target user' 


      it_behaves_like 'forbidden for wrong scope', 'read:accounts'
    end
  end

  describe 'POST #unfollow' do
    let(:scopes) { 'write:follows' }
    let(:other_account) { Fabricate(:user, email: 'bob@example.com', account: Fabricate(:account, username: 'bob')).account }

    before do
      user.account.follow!(other_account)
      post :unfollow, params: { id: other_account.id }
    end

    it 'returns http success' 


    it 'removes the following relation between user and target user' 


    it_behaves_like 'forbidden for wrong scope', 'read:accounts'
  end

  describe 'POST #block' do
    let(:scopes) { 'write:blocks' }
    let(:other_account) { Fabricate(:user, email: 'bob@example.com', account: Fabricate(:account, username: 'bob')).account }

    before do
      user.account.follow!(other_account)
      post :block, params: { id: other_account.id }
    end

    it 'returns http success' 


    it 'removes the following relation between user and target user' 


    it 'creates a blocking relation' 


    it_behaves_like 'forbidden for wrong scope', 'read:accounts'
  end

  describe 'POST #unblock' do
    let(:scopes) { 'write:blocks' }
    let(:other_account) { Fabricate(:user, email: 'bob@example.com', account: Fabricate(:account, username: 'bob')).account }

    before do
      user.account.block!(other_account)
      post :unblock, params: { id: other_account.id }
    end

    it 'returns http success' 


    it 'removes the blocking relation between user and target user' 


    it_behaves_like 'forbidden for wrong scope', 'read:accounts'
  end

  describe 'POST #mute' do
    let(:scopes) { 'write:mutes' }
    let(:other_account) { Fabricate(:user, email: 'bob@example.com', account: Fabricate(:account, username: 'bob')).account }

    before do
      user.account.follow!(other_account)
      post :mute, params: { id: other_account.id }
    end

    it 'returns http success' 


    it 'does not remove the following relation between user and target user' 


    it 'creates a muting relation' 


    it 'mutes notifications' 


    it_behaves_like 'forbidden for wrong scope', 'read:accounts'
  end

  describe 'POST #mute with notifications set to false' do
    let(:scopes) { 'write:mutes' }
    let(:other_account) { Fabricate(:user, email: 'bob@example.com', account: Fabricate(:account, username: 'bob')).account }

    before do
      user.account.follow!(other_account)
      post :mute, params: { id: other_account.id, notifications: false }
    end

    it 'returns http success' 


    it 'does not remove the following relation between user and target user' 


    it 'creates a muting relation' 


    it 'does not mute notifications' 


    it_behaves_like 'forbidden for wrong scope', 'read:accounts'
  end

  describe 'POST #unmute' do
    let(:scopes) { 'write:mutes' }
    let(:other_account) { Fabricate(:user, email: 'bob@example.com', account: Fabricate(:account, username: 'bob')).account }

    before do
      user.account.mute!(other_account)
      post :unmute, params: { id: other_account.id }
    end

    it 'returns http success' 


    it 'removes the muting relation between user and target user' 


    it_behaves_like 'forbidden for wrong scope', 'read:accounts'
  end
end

