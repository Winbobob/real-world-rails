require 'rails_helper'

describe Admin::InvitesController do
  render_views

  let(:user) { Fabricate(:user, admin: true) }

  before do
    sign_in user, scope: :user
  end

  describe 'GET #index' do
    subject { get :index, params: { available: true } }

    let!(:invite) { Fabricate(:invite) }

    it 'renders index page' 

  end

  describe 'POST #create' do
    subject { post :create, params: { invite: { max_uses: '10', expires_in: 1800 } } }

    it 'succeeds to create a invite' 

  end

  describe 'DELETE #destroy' do
    let!(:invite) { Fabricate(:invite, expires_at: nil) }

    subject { delete :destroy, params: { id: invite.id } }

    it 'expires invite' 

  end
end

