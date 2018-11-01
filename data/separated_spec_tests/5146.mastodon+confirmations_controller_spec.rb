# frozen_string_literal: true

require 'rails_helper'

describe Settings::TwoFactorAuthentication::ConfirmationsController do
  render_views

  let(:user) { Fabricate(:user, email: 'local-part@domain', otp_secret: 'thisisasecretforthespecofnewview') }
  let(:user_without_otp_secret) { Fabricate(:user, email: 'local-part@domain') }

  shared_examples 'renders :new' do
    it 'renders the new view' 

  end

  describe 'GET #new' do
    context 'when signed in' do
      subject do
        sign_in user, scope: :user
        get :new
      end

      include_examples 'renders :new'
    end

    it 'redirects if not signed in' 


    it 'redirects if user do not have otp_secret' 

  end

  describe 'POST #create' do
    context 'when signed in' do
      before do
        sign_in user, scope: :user
      end

      describe 'when form_two_factor_confirmation parameter is not provided' do
        it 'raises ActionController::ParameterMissing' 

      end

      describe 'when creation succeeds' do
        it 'renders page with success' 

      end

      describe 'when creation fails' do
        subject do
          expect_any_instance_of(User).to receive(:validate_and_consume_otp!) do |value, arg|
            expect(value).to eq user
            expect(arg).to eq '123456'
            false
          end

          post :create, params: { form_two_factor_confirmation: { code: '123456' } }
        end

        it 'renders the new view' 


        include_examples 'renders :new'
      end
    end

    context 'when not signed in' do
      it 'redirects if not signed in' 

    end
  end
end

