require 'rails_helper'

describe Settings::PreferencesController do
  render_views

  let(:user) { Fabricate(:user, filtered_languages: []) }

  before do
    sign_in user, scope: :user
  end

  describe 'GET #show' do
    it 'returns http success' 

  end

  describe 'PUT #update' do
    it 'updates the user record' 


    it 'updates user settings' 

  end
end

