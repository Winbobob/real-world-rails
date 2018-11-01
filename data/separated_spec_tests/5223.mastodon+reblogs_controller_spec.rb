# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::Statuses::ReblogsController do
  render_views

  let(:user)  { Fabricate(:user, account: Fabricate(:account, username: 'alice')) }
  let(:app)   { Fabricate(:application, name: 'Test app', website: 'http://testapp.com') }
  let(:token) { Fabricate(:accessible_access_token, resource_owner_id: user.id, scopes: 'write:statuses', application: app) }

  context 'with an oauth token' do
    before do
      allow(controller).to receive(:doorkeeper_token) { token }
    end

    describe 'POST #create' do
      let(:status) { Fabricate(:status, account: user.account) }

      before do
        post :create, params: { status_id: status.id }
      end

      it 'returns http success' 


      it 'updates the reblogs count' 


      it 'updates the reblogged attribute' 


      it 'return json with updated attributes' 

    end

    describe 'POST #destroy' do
      let(:status) { Fabricate(:status, account: user.account) }

      before do
        ReblogService.new.call(user.account, status)
        post :destroy, params: { status_id: status.id }
      end

      it 'returns http success' 


      it 'updates the reblogs count' 


      it 'updates the reblogged attribute' 

    end
  end
end

