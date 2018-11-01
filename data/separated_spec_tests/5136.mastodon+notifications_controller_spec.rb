require 'rails_helper'

describe Settings::NotificationsController do
  render_views

  let(:user) { Fabricate(:user) }

  before do
    sign_in user, scope: :user
  end

  describe 'GET #show' do
    it 'returns http success' 

  end

  describe 'PUT #update' do
    it 'updates notifications settings' 

  end
end

