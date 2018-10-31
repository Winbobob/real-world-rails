require 'rails_helper'

RSpec.describe Api::V1::FiltersController, type: :controller do
  render_views

  let(:user)  { Fabricate(:user) }
  let(:token) { Fabricate(:accessible_access_token, resource_owner_id: user.id, scopes: scopes) }

  before do
    allow(controller).to receive(:doorkeeper_token) { token }
  end

  describe 'GET #index' do
    let(:scopes) { 'read:filters' }
    let!(:filter) { Fabricate(:custom_filter, account: user.account) }

    it 'returns http success' 

  end

  describe 'POST #create' do
    let(:scopes) { 'write:filters' }

    before do
      post :create, params: { phrase: 'magic', context: %w(home), irreversible: true }
    end

    it 'returns http success' 


    it 'creates a filter' 

  end

  describe 'GET #show' do
    let(:scopes) { 'read:filters' }
    let(:filter) { Fabricate(:custom_filter, account: user.account) }

    it 'returns http success' 

  end

  describe 'PUT #update' do
    let(:scopes) { 'write:filters' }
    let(:filter) { Fabricate(:custom_filter, account: user.account) }

    before do
      put :update, params: { id: filter.id, phrase: 'updated' }
    end

    it 'returns http success' 


    it 'updates the filter' 

  end

  describe 'DELETE #destroy' do
    let(:scopes) { 'write:filters' }
    let(:filter) { Fabricate(:custom_filter, account: user.account) }

    before do
      delete :destroy, params: { id: filter.id }
    end

    it 'returns http success' 


    it 'removes the filter' 

  end
end

