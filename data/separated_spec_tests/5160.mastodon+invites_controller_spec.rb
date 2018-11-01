require 'rails_helper'

describe InvitesController do
  render_views

  before do
    sign_in user
  end

  around do |example|
    min_invite_role = Setting.min_invite_role
    example.run
    Setting.min_invite_role = min_invite_role
  end

  describe 'GET #index' do
    subject { get :index }

    let(:user) { Fabricate(:user, moderator: false, admin: false) }
    let!(:invite) { Fabricate(:invite, user: user) }

    context 'when user is a staff' do
      it 'renders index page' 

    end

    context 'when user is not a staff' do
      it 'returns 403' 

    end
  end

  describe 'POST #create' do
    subject { post :create, params: { invite: { max_uses: '10', expires_in: 1800 } } }

    context 'when user is an admin' do
      let(:user) { Fabricate(:user, moderator: false, admin: true) }

      it 'succeeds to create a invite' 

    end

    context 'when user is not an admin' do
      let(:user) { Fabricate(:user, moderator: true, admin: false) }

      it 'returns 403' 

    end
  end

  describe 'DELETE #create' do
    subject { delete :destroy, params: { id: invite.id } }

    let!(:invite) { Fabricate(:invite, user: user, expires_at: nil) }
    let(:user) { Fabricate(:user, moderator: false, admin: true) }

    it 'expires invite' 

  end
end

