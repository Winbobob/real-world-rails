#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2017 the OpenProject Foundation (OPF)
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
# See doc/COPYRIGHT.rdoc for more details.
#++

require 'spec_helper'

# Concern is included into AccountController and depends on methods available there
describe AccountController, type: :controller do
  after do
    User.current = nil
  end

  context 'GET #omniauth_login' do
    before do
      allow(Setting).to receive(:self_registration?).and_return(true)
      allow(Setting).to receive(:self_registration).and_return('3')
    end

    describe 'with on-the-fly registration' do
      context 'providing all required fields' do
        let(:omniauth_hash) do
          OmniAuth::AuthHash.new(
            provider: 'google',
            uid: '123545',
            info: { name: 'foo',
                    email: 'foo@bar.com',
                    first_name: 'foo',
                    last_name: 'bar'
            }
          )
        end

        before do
          request.env['omniauth.auth'] = omniauth_hash
          request.env['omniauth.origin'] = 'https://example.net/some_back_url'
          post :omniauth_login
        end

        it 'registers the user on-the-fly' 


        it 'redirects to the first login page with a back_url' 

      end

      describe 'strategy attribute mapping override' do
        let(:omniauth_strategy) { double('Google Strategy') }
        let(:omniauth_hash) do
          OmniAuth::AuthHash.new(
            provider: 'google',
            uid: 'foo',
            info: { email: 'whattheheck@example.com',
                    first_name: 'what',
                    last_name: 'theheck'
            },
            extra: { raw_info: {
              real_uid: 'bar@example.org',
              first_name: 'foo',
              last_name: 'bar'
            } }
          )
        end

        before do
          request.env['omniauth.auth'] = omniauth_hash
          request.env['omniauth.strategy'] = omniauth_strategy
        end

        context 'available' do
          it 'merges the strategy mapping' 

        end

        context 'unavailable' do
          it 'keeps the default mapping' 

        end
      end

      context 'not providing all required fields' do
        let(:omniauth_hash) do
          OmniAuth::AuthHash.new(
            provider: 'google',
            uid: '123545',
            info: { name: 'foo', email: 'foo@bar.com' }
          # first_name and last_name not set
          )
        end

        it 'renders user form' 


        it 'registers user via post' 


        context 'after a timeout expired' do
          before do
            session[:auth_source_registration] = omniauth_hash.merge(
              omniauth: true,
              timestamp: Time.new - 42.days)
          end

          it 'does not register the user when providing all the missing fields' 


          it 'does not register the user when providing all the missing fields' 

        end
      end

      context 'with self-registration disabled' do
        let(:omniauth_hash) do
          OmniAuth::AuthHash.new(
            provider: 'google',
            uid: '123',
            info: { name: 'foo',
                    email: 'foo@bar.com',
                    first_name: 'foo',
                    last_name: 'bar'
            }
          )
        end

        before do
          allow(Setting).to receive(:self_registration?).and_return(false)

          request.env['omniauth.auth'] = omniauth_hash
          request.env['omniauth.origin'] = 'https://example.net/some_back_url'

          post :omniauth_login
        end

        it 'redirects to signin_path' 


        it 'shows the right flash message' 

      end
    end

    describe 'login' do
      let(:omniauth_hash) do
        OmniAuth::AuthHash.new(
          provider: 'google',
          uid: '123545',
          info: { name: 'foo',
                  last_name: 'bar',
                  email: 'foo@bar.com'
          }
        )
      end

      let(:user) do
        FactoryGirl.build(:user, force_password_change: false,
                                 identity_url: 'google:123545')
      end

      before do
        request.env['omniauth.auth'] = omniauth_hash
      end

      context 'with an active account' do
        before do
          user.save!
        end

        it 'should sign in the user after successful external authentication' 


        it 'should log a successful login' 


        describe 'authorization' do
          let(:config) do
            Struct.new(:google_name, :global_email).new 'foo', 'foo@bar.com'
          end

          before do
            OpenProject::OmniAuth::Authorization.callbacks.clear

            # Let's set up a couple of authorization callbacks to see if the mechanism
            # works as intended.

            OpenProject::OmniAuth::Authorization.authorize_user provider: :google do |dec, auth|
              if auth.info.name == config.google_name
                dec.approve
              else
                dec.reject "#{auth.info.name} can fuck right off"
              end
            end

            OpenProject::OmniAuth::Authorization.authorize_user do |dec, auth|
              if auth.info.email == config.global_email
                dec.approve
              else
                dec.reject "I only want to see #{config[:global_email]} here."
              end
            end

            # ineffective callback
            OpenProject::OmniAuth::Authorization.authorize_user provider: :foobar do |dec, _|
              dec.reject 'Though shalt not pass!'
            end

            # free for all callback
            OpenProject::OmniAuth::Authorization.authorize_user do |dec, _|
              dec.approve
            end
          end

          after do
            OpenProject::OmniAuth::Authorization.callbacks.clear
          end

          it 'works' 


          context 'with wrong email address' do
            before do
              config.global_email = 'other@mail.com'
            end

            it 'is rejected against google' 


            it 'is rejected against any other provider too' 

          end

          context 'with the wrong name' do
            render_views

            before do
              config.google_name = 'hans'
            end

            it 'is rejected against google' 


            it 'is approved against any other provider' 


            # ... and to confirm that, here's what happens when the authorization fails
            it 'is rejected against any other provider with the wrong email' 

          end
        end
      end

      context 'with a registered and not activated accout',
              with_settings: { self_registration: 1 } do
        before do
          user.register
          user.save!

          post :omniauth_login
        end

        it 'should show an error about a not activated account' 


        it 'should redirect to signin_path' 

      end

      context 'with a locked account',
              with_settings: { brute_force_block_after_failed_logins: 0 } do
        before do
          user.lock
          user.save!

          post :omniauth_login
        end

        it 'should show an error indicating a failed login' 


        it 'should redirect to signin_path' 

      end
    end

    describe 'with an invalid auth_hash' do
      let(:omniauth_hash) do
        OmniAuth::AuthHash.new(
          provider: 'google',
          # id is deliberately missing here to make the auth_hash invalid
          info: { name: 'foo',
                  email: 'foo@bar.com'
          }
        )
      end

      before do
        request.env['omniauth.auth'] = omniauth_hash

        post :omniauth_login
      end

      it 'should respond with a 400' 


      it 'should not sign in the user' 


      it 'does not set registration information in the session' 

    end

    describe 'Error occurs during authentication' do
      it 'should redirect to login page' 


      it 'should log a warn message' 

    end
  end

  describe '#identity_url_from_omniauth' do
    let(:omniauth_hash) { { provider: 'developer', uid: 'veryuniqueid' } }

    it 'should return the correct identity_url' 

  end
end

