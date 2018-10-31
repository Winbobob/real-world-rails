# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User::OmniauthCallbacksController, type: :controller do
  let!(:instance) { Instance.default }

  with_tenant(:instance) do
    before { controller.request.env['devise.mapping'] = Devise.mappings[:user] }

    describe '#facebook' do
      let(:facebook_data) { build(:omniauth_facebook) }
      before { controller.request.env['omniauth.auth'] = facebook_data }
      subject { get :facebook }

      context 'when required data is provided' do
        it 'creates a user identity' 


        it 'creates a user with the information from facebook' 

      end

      context 'when the data provided is incomplete' do
        before do
          facebook_data.info.email = nil
        end

        it 'does not create any user' 


        it { is_expected.to redirect_to(new_user_registration_path) }

        it 'shows an error message' 

      end

      context 'when the user is signed in' do
        let(:user) { create(:user) }
        before { sign_in(user) }

        it 'shows an error message when omniauth data is incomplete' 

      end
    end
  end
end

