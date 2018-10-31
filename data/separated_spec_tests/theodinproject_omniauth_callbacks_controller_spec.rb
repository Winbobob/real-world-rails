require 'rails_helper'

RSpec.describe OmniauthCallbacksController, type: :controller do
  let(:user_signed_in?) { true }
  let(:user) { FactoryGirl.create(:user) }
  let(:auth) { OmniAuth.config.mock_auth[:github] }
  let(:persisted) { true }

  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
    request.env['omniauth.auth'] = auth

    allow(UserProvider).to receive(:find_user).with(auth).and_return(user)
    allow(user).to receive(:persisted?).and_return(persisted)
  end

  describe 'GET #github' do
    it 'redirects the user to the dashboard page' 


    it 'displays the success flash' 


    context 'when the user avatar needs updated' do
      let(:user) {
        FactoryGirl.create(
          :user,
          username: 'John',
          email: 'john@example.com',
          avatar: nil
        )
      }

      it 'sets the users avatar' 

    end

    context 'when user is not persisted and does not exist' do
      let(:persisted) { false }
      let(:user_signed_in?) { false}

      it 'stores the auth data in the session' 


      it 'redirects to the new users path' 

    end
  end

  describe 'GET failure' do
    it 'displays the failured omniauth flash' 


    it 'redirects to home page' 

  end
end

