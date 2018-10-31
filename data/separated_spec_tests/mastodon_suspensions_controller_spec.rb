require 'rails_helper'

describe Admin::SuspensionsController do
  render_views

  before do
    sign_in Fabricate(:user, admin: true), scope: :user
  end

  describe 'POST #create' do
    it 'redirects to admin accounts page' 

  end

  describe 'DELETE #destroy' do
    it 'redirects to admin accounts page' 

  end
end

