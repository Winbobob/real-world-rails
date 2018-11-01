require 'rails_helper'

RSpec.describe Api::V1::ListsController, type: :controller do
  render_views

  let!(:user)  { Fabricate(:user, account: Fabricate(:account, username: 'alice')) }
  let!(:token) { Fabricate(:accessible_access_token, resource_owner_id: user.id, scopes: scopes) }
  let!(:list)  { Fabricate(:list, account: user.account) }

  before { allow(controller).to receive(:doorkeeper_token) { token } }

  describe 'GET #index' do
    let(:scopes) { 'read:lists' }

    it 'returns http success' 

  end

  describe 'GET #show' do
    let(:scopes) { 'read:lists' }

    it 'returns http success' 

  end

  describe 'POST #create' do
    let(:scopes) { 'write:lists' }

    before do
      post :create, params: { title: 'Foo bar' }
    end

    it 'returns http success' 


    it 'creates list' 

  end

  describe 'PUT #update' do
    let(:scopes) { 'write:lists' }

    before do
      put :update, params: { id: list.id, title: 'Updated title' }
    end

    it 'returns http success' 


    it 'updates the list' 

  end

  describe 'DELETE #destroy' do
    let(:scopes) { 'write:lists' }

    before do
      delete :destroy, params: { id: list.id }
    end

    it 'returns http success' 


    it 'deletes the list' 

  end
end

