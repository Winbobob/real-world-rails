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

describe AccountController, type: :controller do
  after do
    User.delete_all
    User.current = nil
  end
  let(:user) { FactoryBot.build_stubbed(:user) }

  context 'GET #login' do
    let(:setup) {}
    let(:params) { {} }

    before do
      setup

      get :login, params: params
    end

    it 'renders the view' 


    context 'user already logged in' do
      let(:setup) { login_as user }

      it 'redirects to home' 

    end

    context 'user already logged in and back url present' do
      let(:setup) { login_as user }
      let(:params) { { back_url: "/projects" } }

      it 'redirects to back_url value' 

    end

    context 'user already logged in and invalid back url present' do
      let(:setup) { login_as user }
      let(:params) { { back_url: 'http://test.foo/work_packages/show/1' } }

      it 'redirects to home' 

    end
  end

  context 'POST #login' do
    let(:admin) { FactoryBot.create(:admin) }

    describe 'wrong password' do
      it 'redirects back to login' 

    end

    describe 'User logging in with back_url' do
      it 'should redirect to a relative path' 


      it 'should redirect to an absolute path given the same host' 


      it 'should not redirect to another host' 


      it 'should not redirect to another host with a protocol relative url' 


      it 'should not redirect to logout' 


      it 'should create users on the fly' 


      context 'with a relative url root' do
        before do
          @old_relative_url_root = OpenProject::Configuration['rails_relative_url_root']
          OpenProject::Configuration['rails_relative_url_root'] = '/openproject'
        end

        after do
          OpenProject::Configuration['rails_relative_url_root'] = @old_relative_url_root
        end

        it 'should redirect to the same subdirectory with an absolute path' 


        it 'should redirect to the same subdirectory with a relative path' 


        it 'should not redirect to another subdirectory with an absolute path' 


        it 'should not redirect to another subdirectory with a relative path' 


        it 'should not redirect to another subdirectory by going up the path hierarchy' 


        it 'should not redirect to another subdirectory with a protocol relative path' 

      end
    end

    context 'GET #logout' do
      let(:admin) { FactoryBot.create(:admin) }

      it 'calls reset_session' 

    end

    describe 'for a user trying to log in via an API request' do
      before do
        post :login,
             params: {
               username: admin.login,
               password: 'adminADMIN!'
             },
             format: :json
      end

      it 'should return a 410' 


      it 'should not login the user' 

    end

    context 'with disabled password login' do
      before do
        allow(OpenProject::Configuration).to receive(:disable_password_login?).and_return(true)

        post :login
      end

      it 'is not found' 

    end

    context 'with an auth source' do
      let(:auth_source_id) { 42 }

      let(:user_attributes) do
        {
          login: 's.scallywag',
          firstname: 'Scarlet',
          lastname: 'Scallywag',
          mail: 's.scallywag@openproject.com',
          auth_source_id: auth_source_id
        }
      end

      let(:authenticate) { true }

      before do
        allow(Setting).to receive(:self_registration).and_return('0')
        allow(Setting).to receive(:self_registration?).and_return(false)
        allow(AuthSource).to receive(:authenticate).and_return(authenticate ? user_attributes : nil)

        # required so that the register view can be rendered
        allow_any_instance_of(User).to receive(:change_password_allowed?).and_return(false)
      end

      context 'with user limit reached' do
        render_views

        before do
          allow(OpenProject::Enterprise).to receive(:user_limit_reached?).and_return(true)

          post :login, params: { username: 'foo', password: 'bar' }
        end

        it 'shows the user limit error' 


        it 'renders the register form' 

      end
    end
  end

  describe '#login with omniauth_direct_login enabled',
            with_config: { omniauth_direct_login_provider: 'some_provider' } do

    describe 'GET' do
      it 'redirects to some_provider' 

    end

    describe 'POST' do
      it 'redirects to some_provider' 

    end
  end

  describe 'Login for user with forced password change' do
    let(:admin) { FactoryBot.create(:admin, force_password_change: true) }

    before do
      allow_any_instance_of(User).to receive(:change_password_allowed?).and_return(false)
    end

    describe "User who is not allowed to change password can't login" do
      before do
        post 'change_password',
             params: {
               username: admin.login,
               password: 'adminADMIN!',
               new_password: 'adminADMIN!New',
               new_password_confirmation: 'adminADMIN!New'
             }
      end

      it 'should redirect to the login page' 

    end

    describe 'User who is not allowed to change password, is not redirected to the login page' do
      before do
        post 'login', params: { username: admin.login, password: 'adminADMIN!' }
      end

      it 'should redirect ot the login page' 

    end
  end

  describe 'POST #change_password' do
    context 'with disabled password login' do
      before do
        allow(OpenProject::Configuration).to receive(:disable_password_login?).and_return(true)
        post :change_password
      end

      it 'is not found' 

    end
  end

  shared_examples 'registration disabled' do
    it 'redirects to back the login page' 


    it 'informs the user that registration is disabled' 

  end

  context 'GET #register' do
    context 'with self registration on' do
      before do
        allow(Setting).to receive(:self_registration).and_return('3')
      end

      context 'and password login enabled' do
        before do
          get :register
        end

        it 'is successful' 

      end

      context 'and password login disabled' do
        before do
          allow(OpenProject::Configuration).to receive(:disable_password_login?).and_return(true)

          get :register
        end

        it_behaves_like 'registration disabled'
      end
    end

    context 'with self registration off' do
      before do
        allow(Setting).to receive(:self_registration).and_return('0')
        allow(Setting).to receive(:self_registration?).and_return(false)
        get :register
      end

      it_behaves_like 'registration disabled'
    end

    context 'with self registration off but an ongoing invitation activation' do
      let(:token) { FactoryBot.create :invitation_token }

      before do
        allow(Setting).to receive(:self_registration).and_return('0')
        allow(Setting).to receive(:self_registration?).and_return(false)
        session[:invitation_token] = token.value

        get :register
      end

      it 'is successful' 

    end
  end

  # See integration/account_test.rb for the full test
  context 'POST #register' do
    context 'with self registration on automatic' do
      before do
        allow(OpenProject::Configuration).to receive(:disable_password_login?).and_return(false)
        allow(Setting).to receive(:self_registration).and_return('3')
      end

      context 'with password login enabled' do
        # expects `redirect_to_path`
        shared_examples 'automatic self registration succeeds' do
          before do
            post :register,
                 params: {
                   user: {
                     login: 'register',
                     password: 'adminADMIN!',
                     password_confirmation: 'adminADMIN!',
                     firstname: 'John',
                     lastname: 'Doe',
                     mail: 'register@example.com'
                   }
                 }
          end

          it 'redirects to my page' 


          it 'set the user status to active' 

        end

        context "with user limit reached" do
          let!(:admin) { FactoryBot.create :admin }

          let(:params) do
            {
              user: {
                login: 'register',
                password: 'adminADMIN!',
                password_confirmation: 'adminADMIN!',
                firstname: 'John',
                lastname: 'Doe',
                mail: 'register@example.com'
              }
            }
          end

          before do
            allow(OpenProject::Enterprise).to receive(:user_limit_reached?).and_return(true)

            post :register, params: params
          end

          it "fails" 


          it "notifies the admins about the issue" 

        end
      end

      context 'with password login disabled' do
        before do
          allow(OpenProject::Configuration).to receive(:disable_password_login?).and_return(true)

          post :register
        end

        it_behaves_like 'registration disabled'
      end
    end

    context 'with self registration by email' do
      before do
        allow(Setting).to receive(:self_registration).and_return('1')
      end

      context 'with password login enabled' do
        before do
          Token::Invitation.delete_all
          post :register,
               params: {
                 user: {
                   login: 'register',
                   password: 'adminADMIN!',
                   password_confirmation: 'adminADMIN!',
                   firstname: 'John',
                   lastname: 'Doe',
                   mail: 'register@example.com'
                 }
               }
        end

        it 'redirects to the login page' 


        it "doesn't activate the user but sends out a token instead" 

      end

      context 'with password login disabled' do
        before do
          allow(OpenProject::Configuration).to receive(:disable_password_login?).and_return(true)

          post :register
        end

        it_behaves_like 'registration disabled'
      end
    end

    context 'with manual activation' do
      let(:user_hash) do
        { login: 'register',
          password: 'adminADMIN!',
          password_confirmation: 'adminADMIN!',
          firstname: 'John',
          lastname: 'Doe',
          mail: 'register@example.com' }
      end

      before do
        allow(Setting).to receive(:self_registration).and_return('2')
      end

      context 'without back_url' do
        before do
          post :register, params: { user: user_hash }
        end

        it 'redirects to the login page' 


        it "doesn't activate the user" 

      end

      context 'with back_url' do
        before do
          post :register, params: { user: user_hash, back_url: 'https://example.net/some_back_url' }
        end

        it 'preserves the back url' 

      end

      context 'with password login disabled' do
        before do
          allow(OpenProject::Configuration).to receive(:disable_password_login?).and_return(true)

          post :register
        end

        it_behaves_like 'registration disabled'
      end
    end

    context 'with self registration off' do
      before do
        allow(Setting).to receive(:self_registration).and_return('0')
        allow(Setting).to receive(:self_registration?).and_return(false)
        post :register,
             params: {
               user: {
                 login: 'register',
                 password: 'adminADMIN!',
                 password_confirmation: 'adminADMIN!',
                 firstname: 'John',
                 lastname: 'Doe',
                 mail: 'register@example.com'
               }
             }
      end

      it_behaves_like 'registration disabled'
    end

    context 'with on-the-fly registration' do
      before do
        allow(Setting).to receive(:self_registration).and_return('0')
        allow(Setting).to receive(:self_registration?).and_return(false)
        allow_any_instance_of(User).to receive(:change_password_allowed?).and_return(false)
        allow(AuthSource).to receive(:authenticate).and_return(login: 'foo',
                                                               lastname: 'Smith',
                                                               auth_source_id: 66)
      end

      context 'with password login enabled' do
        before do
          post :login, params: { username: 'foo', password: 'bar' }
        end

        it 'registers the user on-the-fly' 

      end

      context 'with password login disabled' do
        before do
          allow(OpenProject::Configuration).to receive(:disable_password_login?).and_return(true)
        end

        describe 'login' do
          before do
            post :login, params: { username: 'foo', password: 'bar' }
          end

          it 'is not found' 

        end

        describe 'registration' do
          before do
            post :register,
                 params: {
                   user: {
                     firstname: 'Foo',
                     lastname: 'Smith',
                     mail: 'foo@bar.com'
                   }
                 }
          end

          it_behaves_like 'registration disabled'
        end
      end
    end
  end

  context 'POST activate' do
    let!(:admin) { FactoryBot.create :admin }
    let(:user) { FactoryBot.create :user, status: status }
    let(:status) { -1 }

    let(:token) { Token::Invitation.create!(user_id: user.id) }

    before do
      allow(OpenProject::Enterprise).to receive(:user_limit_reached?).and_return(true)

      post :activate, params: { token: token.value }
    end

    shared_examples "activation is blocked due to user limit" do
      it "does not activate the user" 


      it "redirects back to the login page and shows the user limit error" 


      it "notifies the admins about the issue" 

    end

    context 'registered user' do
      let(:status) { User::STATUSES[:registered] }

      it_behaves_like "activation is blocked due to user limit"
    end

    context 'invited user' do
      let(:status) { User::STATUSES[:invited] }

      it_behaves_like "activation is blocked due to user limit"
    end
  end

  describe 'GET #auth_source_sso_failed (/sso)' do
    render_views

    let(:failure) do
      {
        user: user,
        login: user.login,
        back_url: '/my/account',
        ttl: 1
      }
    end

    let(:user) { FactoryBot.create :user, status: 2 }

    before do
      session[:auth_source_sso_failure] = failure
    end

    context "with a non-active user" do
      it "should show the non-active error message" 

    end

    context "with an invalid user" do
      let!(:duplicate) { FactoryBot.create :user, mail: "login@DerpLAP.net" }
      let(:user) do
        FactoryBot.build(:user, mail: duplicate.mail).tap(&:valid?)
      end

      it "should show the account creation form with an error" 

    end
  end

  describe 'POST #activate' do
    shared_examples 'account activation' do
      let(:token) { Token::Invitation.create user: user }

      let(:activation_params) do
        {
          token: token.value
        }
      end

      context 'with an expired token' do
        before do
          token.update_column :expires_on, Date.today - 1.day

          post :activate, params: activation_params
        end

        it 'fails and shows an expiration warning' 


        it 'deletes the old token and generates a new one' 


        it 'sends out a new activation email' 

      end
    end

    context 'with an invited user' do
      it_behaves_like 'account activation' do
        let(:user) { FactoryBot.create :user, status: 4 }
      end
    end

    context 'with an registered user' do
      it_behaves_like 'account activation' do
        let(:user) { FactoryBot.create :user, status: 2 }
      end
    end
  end
end

