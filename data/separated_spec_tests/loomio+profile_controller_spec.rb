require 'rails_helper'
describe API::ProfileController do

  let(:user) { create :user }
  let(:group) { create :formal_group }
  let(:another_user) { create :user }
  let(:user_params) { { name: "new name", email: "new@email.com" } }

  describe 'show' do
    before { sign_in user }
    it 'returns the user json' 


    it 'can fetch a user by username' 


    it 'does not return a deactivated user' 

  end

  describe 'me' do
    it 'returns the current user data' 


    it 'returns unauthorized for visitors' 

  end

  describe 'update_profile' do
    before { sign_in user }
    context 'success' do
      it 'updates a users profile picture type' 


      it "updates a users profile" 

    end
  end

  describe 'set_volume' do
    before { sign_in user }

    context 'success' do
      it "sets a default volume for all of a user's new memberships" 


      it "sets the volume for all of a user's current memberships" 

    end

    context 'failures' do
      it "responds with an error when there are unpermitted params" 

    end
  end

  describe 'upload_avatar' do
    before { sign_in user }
    context 'success' do
      it 'updates a users profile picture when uploaded' 

    end

    context 'failure' do
      it 'does not upload an invalid file' 

    end
  end

  describe 'deactivate' do
    before { sign_in user }
    context 'success' do
      it "deactivates the users account" 


      it 'can record a deactivation response' 

    end
  end

  describe 'delete' do
    before { sign_in user }
    context 'success' do
      it "deletes the users account" 

    end
  end

  describe 'save_experience' do
    before { sign_in user }

    it 'successfully saves an experience' 


    it 'responds with forbidden when user is logged out' 


    it 'responds with bad request when no experience is given' 

  end

  describe "mentionable" do
    let(:user)  { create :user }
    let(:group) { create :formal_group }
    let(:subgroup) { create :formal_group, parent: group}
    let(:completely_unrelated_group) { create :formal_group }
    let!(:jgroupmember) { create :user, name: 'jgroupmember', username: 'queenie' }
    let!(:jalien)  { create :user, name: 'jalien', username: 'queenbee' }
    let!(:esubgroupmember)   { create :user, name: 'esubgroupmember', username: 'coolguy' }
    let!(:jguest)    { create :user, name: 'jguest', username: 'someguy' }
    let(:discussion) { create :discussion, group: group, author: user, private: true }

    # jgroupmember and esubgroupmember are in the group
    # jalien is not in the group

    before do
      group.add_member! user
      group.add_member! jgroupmember
      subgroup.add_member! esubgroupmember
      completely_unrelated_group.add_member! jalien
      discussion.guest_group.add_member! jguest
      sign_in user
    end

    it "returns users with name matching fragment" 


    it "returns users with username matching fragment" 


    it "returns users from groups within the same organisation" 


    it "returns users for the discussion" 


    it "doesn't return users from groups outside the organisation" 

  end
end

