require 'rails_helper'

RSpec.describe Webui::UserHelper do
  describe '#user_and_role' do
    let(:user) { create(:user) }
    let(:role) { Role.find_by(title: 'bugowner') }
    let(:logged_in_user) { create(:user) }
    let(:anonymous_user) { create(:user_nobody) }

    context 'for logged in users' do
      before do
        User.current = logged_in_user
      end

      it 'displays the users realname to a user that is logged in' 


      it 'falls back to users login if realname is empty' 


      it 'shows user login and role if realname is empty and role is given' 


      it 'does not show an icon if option disables it' 


      it 'only shows user login if short option is set' 


      it 'appends a role name' 

    end

    context 'for users that are not logged in' do
      before do
        user.email = 'greatguy@nowhere.fi'
        user.save
        User.current = anonymous_user
      end

      it 'does not link to user profiles' 

    end
  end

  describe '#user_with_realname_and_icon' do
    skip('Please add some tests')
  end

  describe '#requester_str' do
    let!(:creator) { create(:user, login: 'Adrian') }
    let(:requester) { create(:user, login: 'Ana') }

    it 'do not show the requester if he is the same as the creator' 


    it 'show the requester if he is different as the creator' 


    it 'show the group' 

  end

  describe '#user_image_tag' do
    let(:user) { create(:user, realname: 'Digger', email: 'gordo@example.com') }
    context 'with gravatar configuration disabled' do
      before do
        allow(Configuration).to receive(:gravatar).and_return(false)
      end

      it 'returns default face' 

    end

    context 'with gravatar configuration enabled' do
      it 'returns gravatar url' 

    end
  end
end

