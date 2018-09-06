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
end

