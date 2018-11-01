# frozen_string_literal: true

require 'rails_helper'

describe Oauth::AuthorizedApplicationsController do
  render_views

  describe 'GET #index' do
    subject do
      get :index
    end

    shared_examples 'stores location for user' do
      it 'stores location for user' 

    end

    context 'when signed in' do
      before do
        sign_in Fabricate(:user), scope: :user
      end

      it 'returns http success' 


      include_examples 'stores location for user'
    end

    context 'when not signed in' do
      it 'redirects' 


      include_examples 'stores location for user'
    end
  end

  describe 'DELETE #destroy' do
    let!(:user) { Fabricate(:user) }
    let!(:application) { Fabricate(:application) }
    let!(:access_token) { Fabricate(:accessible_access_token, application: application, resource_owner_id: user.id) }
    let!(:web_push_subscription) { Fabricate(:web_push_subscription, user: user, access_token: access_token) }

    before do
      sign_in user, scope: :user
      post :destroy, params: { id: application.id }
    end

    it 'revokes access tokens for the application' 


    it 'removes subscriptions for the application\'s access tokens' 

  end
end

