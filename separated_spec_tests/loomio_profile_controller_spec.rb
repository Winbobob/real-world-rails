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

  describe 'save_experience' do
    before { sign_in user }

    it 'successfully saves an experience' 


    it 'responds with forbidden when user is logged out' 


    it 'responds with bad request when no experience is given' 

  end

end

