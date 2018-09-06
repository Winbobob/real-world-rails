require 'rails_helper'

describe ApplicationsController do
  let(:user) { FactoryGirl.create(:user) }

  describe '#create' do
    subject { -> { post :create, application: application_params } }

    before :each do
      sign_in user
    end

    context 'with valid params' do
      let(:application_params) do
        {
          name: 'Test App',
          redirect_uri: 'http://www.example.com/callback',
          scopes: 'profile.email'
        }
      end

      it 'saves' 


      it 'ownership is set' 


    end
  end

  describe '#show' do
    let(:user) { FactoryGirl.create(:user) }
    let(:owner) { user }

    let(:app) { FactoryGirl.create(:application, name: 'My App', owner: owner) }

    subject { -> { get :show, id: app.id } }

    before :each do
      sign_in user
      sign_in :two_factor, user
    end

    context 'current user is owner' do
      it 'has 200 status code' 

    end

    context 'current user is admin' do
      let(:user) { FactoryGirl.create(:admin_user) }
      let(:owner) { FactoryGirl.create(:user) }

      it 'has 200 status code' 


      it 'creates a UserAction record' 

    end

    context 'current user is neither owner nor admin' do
      let(:owner) { FactoryGirl.create(:user) }

      it 'raises SimpleRole::AccessDenied' 

    end
  end

  describe '#update' do
    let(:owner) { user }
    let(:app) { FactoryGirl.create(:application, name: 'My App', owner: owner, public: false) }
    let(:application_params) { { name: 'Best App Ever' } }

    subject { -> { put :update, id: app.id, application: application_params } }

    before :each do
      sign_in :user, user
      sign_in :two_factor, user
    end

    context 'current user is owner' do
      it 'updates app name' 


      context 'user attempts to set app to public' do
        let(:application_params) { { public: true } }

        it 'does not set public status' 

      end
    end

    context 'current user is admin' do
      let(:owner) { FactoryGirl.create(:user) }
      let(:user) { FactoryGirl.create(:admin_user) }

      it 'updates app name' 


      context 'user attempts to set app to public' do
        let(:application_params) { { public: true } }

        it 'sets public status' 

      end

    end

    context 'current user is neither owner nor admin' do
      let(:owner) { FactoryGirl.create(:user) }

      it 'raises SimpleRole::AccessDenied' 


      it 'does not update' 

    end
  end
end

