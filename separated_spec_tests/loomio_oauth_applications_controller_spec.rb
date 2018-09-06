require 'rails_helper'

describe API::OauthApplicationsController do

  let(:user) { create(:user) }
  let!(:my_app) { create(:application, owner: user) }
  let!(:other_app) { create(:application) }
  let(:access_token) { create(:access_token, resource_owner_id: user.id, application: other_app) }
  let(:app_params) {{ name: "My new app", redirect_uri: "https://loomioapp.org/callback" }}

  before do
    sign_in user
  end

  describe 'owned' do
    it 'returns apps I own' 

  end

  describe 'authorized' do
    it 'returns apps Ive authorized' 

  end

  describe 'show' do
    it 'shows apps I own' 


    it 'does not show apps I do not own' 

  end

  describe 'update' do
    it 'updates an app I own' 


    it 'does not update an app with invalid params' 


    it 'does not update an app I dont own' 

  end

  describe 'create' do
    it 'creates an app' 


    it 'does not create an invalid app' 

  end

  describe 'destroy' do
    it 'destroys an app I own' 


    it 'does not destroy an app I dont own' 

  end

  describe 'revoke_access' do
    it 'revokes access for an app Ive approved' 


    it 'does not revoke access for an app I havent approved' 

  end
end

