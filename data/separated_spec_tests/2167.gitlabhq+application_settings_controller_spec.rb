require 'spec_helper'

describe Admin::ApplicationSettingsController do
  include StubENV

  let(:group) { create(:group) }
  let(:project) { create(:project, namespace: group) }
  let(:admin) { create(:admin) }
  let(:user) { create(:user)}

  before do
    stub_env('IN_MEMORY_APPLICATION_SETTINGS', 'false')
  end

  describe 'GET #usage_data with no access' do
    before do
      sign_in(user)
    end

    it 'returns 404' 

  end

  describe 'GET #usage_data' do
    before do
      sign_in(admin)
    end

    it 'returns HTML data' 


    it 'returns JSON data' 

  end

  describe 'PUT #update' do
    before do
      sign_in(admin)
    end

    it 'updates the password_authentication_enabled_for_git setting' 


    it 'updates the default_project_visibility for string value' 


    it 'update the restricted levels for string values' 


    it 'updates the restricted_visibility_levels when empty array is passed' 


    it 'updates the receive_max_input_size setting' 

  end

  describe 'PUT #reset_registration_token' do
    before do
      sign_in(admin)
    end

    subject { put :reset_registration_token }

    it 'resets runner registration token' 


    it 'redirects the user to admin runners page' 

  end
end

