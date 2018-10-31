require 'rails_helper'

describe SessionsController, type: :controller do
  before do
    Setting.set_global('Features', 'SSL', true)
    @person = FactoryGirl.create(:person, password: 'secret')
  end

  describe '#show' do
    it 'redirects to new action' 

  end

  describe '#new' do
    context do
      it 'renders the new template' 

    end

    context 'there are no users' do
      before do
        Person.delete_all
      end

      it 'redirects to the setup path' 

    end
  end

  describe '#create' do
    context 'correct password' do
      it 'sets logged_in_id and redirects' 

    end

    context 'given incorrect password' do
      before do
        post :create,
             params: { email: @person.email.upcase, password: 'wrong' }
      end

      render_views

      it 'renders the new template with an error' 


      it 'creates a signing failure record' 

    end

    context 'given email not found' do
      before do
        post :create,
             params: { email: 'bad@example.com', password: 'secret' }
      end

      render_views

      it 'renders the new template with an error' 


      it 'creates a signing failure record' 

    end

    context 'given from param' do
      it 'redirects to from param after sign in' 

    end

    context 'given from param with a domain name' do
      it 'does not redirect off-site' 

    end

    context 'given from param without a leading slash' do
      it 'does not redirect off-site' 

    end
  end

  describe '#create_from_external_provider' do
    context 'no existing user given the provider' do
      before do
        omni_auth = {
          'provider' => 'facebook',
          'uid' => 10_001,
          'info' => {
            'email' => 'ME_FACEBOOK@EXAMPLE.COM',
            'first_name' => 'Martin',
            'last_name' => 'Luther',
            'urls' => {
              'Facebook' => 'facebook_profile_url'
            }
          }
        }
        request.env['omniauth.auth'] = omni_auth
      end

      it 'sets logged_in_id and redirects (new user)' 


      it 'sets logged_in_id and redirects (existing user)' 

    end
  end

  describe '#destroy' do
    it 'unsets logged_in_id and redirects to the root path' 

  end
end

