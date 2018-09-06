require 'spec_helper'

describe 'Invites' do
  let(:user) { create(:user) }
  let(:owner) { create(:user, name: 'John Doe') }
  let(:group) { create(:group, name: 'Owned') }
  let(:project) { create(:project, :repository, namespace: group) }
  let(:invite) { group.group_members.invite.last }

  before do
    project.add_master(owner)
    group.add_user(owner, Gitlab::Access::OWNER)
    group.add_developer('user@example.com', owner)
    invite.generate_invite_token!
  end

  context 'when signed out' do
    before do
      visit invite_path(invite.raw_invite_token)
    end

    it 'renders sign in page with sign in notice' 


    it 'sign in and redirects to invitation page' 

  end

  context 'when signed in as an exists member' do
    before do
      sign_in(owner)
    end

    it 'shows message user already a member' 

  end

  describe 'accepting the invitation' do
    before do
      sign_in(user)
      visit invite_path(invite.raw_invite_token)
    end

    it 'grants access and redirects to group page' 

  end

  describe 'declining the application' do
    context 'when signed in' do
      before do
        sign_in(user)
        visit invite_path(invite.raw_invite_token)
      end

      it 'declines application and redirects to dashboard' 

    end

    context 'when signed out' do
      before do
        visit decline_invite_path(invite.raw_invite_token)
      end

      it 'declines application and redirects to sign in page' 

    end
  end
end

