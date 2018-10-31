# frozen_string_literal: true

require 'rails_helper'

describe AuthorizeInteractionsController do
  render_views

  describe 'GET #show' do
    describe 'when signed out' do
      it 'redirects to sign in page' 

    end

    describe 'when signed in' do
      let(:user) { Fabricate(:user) }
      let(:account) { Fabricate(:account, user: user) }

      before do
        sign_in(user)
      end

      it 'renders error without acct param' 


      it 'renders error when account cant be found' 


      it 'sets resource from url' 


      it 'sets resource from acct uri' 

    end
  end

  describe 'POST #create' do
    describe 'when signed out' do
      it 'redirects to sign in page' 

    end

    describe 'when signed in' do
      let!(:user) { Fabricate(:user) }
      let!(:account) { user.account }

      before do
        sign_in(user)
      end

      it 'shows error when account not found' 


      it 'follows account when found' 

    end
  end
end

