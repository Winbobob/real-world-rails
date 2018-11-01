#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2018 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2017 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See docs/COPYRIGHT.rdoc for more details.
#++

require 'spec_helper'

describe MyController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  before(:each) do
    login_as(user)
  end

  describe 'password change' do
    describe '#password' do
      before do
        get :password
      end

      it 'should render the password template' 

    end

    describe 'with disabled password login' do
      before do
        allow(OpenProject::Configuration).to receive(:disable_password_login?).and_return(true)
        post :change_password
      end

      it 'is not found' 

    end

    describe 'with wrong confirmation' do
      before do
        post :change_password,
             params: {
               password: 'adminADMIN!',
               new_password: 'adminADMIN!New',
               new_password_confirmation: 'adminADMIN!Other'
             }
      end
      it 'should show an error message' 

    end

    describe 'with wrong password' do
      render_views
      before do
        @current_password = user.current_password.id
        post :change_password,
             params: {
               password: 'wrongpassword',
               new_password: 'adminADMIN!New',
               new_password_confirmation: 'adminADMIN!New'
             }
      end

      it 'should show an error message' 


      it 'should not change the password' 

    end

    describe 'with good password and good confirmation' do
      before do
        post :change_password,
             params: {
               password: 'adminADMIN!',
               new_password: 'adminADMIN!New',
               new_password_confirmation: 'adminADMIN!New'
             }
      end

      it 'should redirect to the my password page' 


      it 'should allow the user to login with the new password' 

    end
  end

  describe 'account' do
    let(:custom_field) { FactoryBot.create :text_user_custom_field }
    before do
      custom_field
      as_logged_in_user user do
        get :account
      end
    end

    it 'responds with success' 


    it 'renders the account template' 


    it 'assigns @user' 


    context 'with render_views' do
      render_views
      it 'renders editable custom fields' 


      it "renders the 'Change password' menu entry" 

    end
  end

  describe 'settings' do
    context 'PATCH' do
      before do
        as_logged_in_user user do
          user.pref.self_notified = false

          patch :settings, params: { user: { language: 'en' } }
        end
      end

      it 'does not alter the email preferences' 


      it 'redirects to settings' 


      it 'has a successful flash' 

    end
  end

  describe 'settings:auto_hide_popups' do
    context 'with render_views' do
      before do
        as_logged_in_user user do
          get :settings
        end
      end

      render_views
      it 'renders auto hide popups checkbox' 

    end

    context 'PATCH' do
      before do
        as_logged_in_user user do
          user.pref.auto_hide_popups = false

          patch :settings, params: { user: { language: 'en' } }
        end
      end
    end
  end

  describe 'account with disabled password login' do
    before do
      allow(OpenProject::Configuration).to receive(:disable_password_login?).and_return(true)
      as_logged_in_user user do
        get :account
      end
    end

    render_views

    it "does not render 'Change password' menu entry" 

  end

  describe 'access_tokens' do
    describe 'rss' do
      it 'creates a key' 


      context 'with existing key' do
        let!(:key) { ::Token::Rss.create user: user }

        it 'replaces the key' 

      end
    end

    describe 'api' do
      context 'with no existing key' do
        it 'creates a key' 

      end

      context 'with existing key' do
        let!(:key) { ::Token::Api.create user: user }

        it 'replaces the key' 

      end
    end
  end
end

