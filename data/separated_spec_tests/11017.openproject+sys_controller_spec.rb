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

describe SysController, type: :controller do
  let(:commit_role) {
    FactoryBot.create(:role, permissions: %i[commit_access browse_repository])
  }
  let(:browse_role) { FactoryBot.create(:role, permissions: [:browse_repository]) }
  let(:guest_role) { FactoryBot.create(:role, permissions: []) }
  let(:valid_user_password) { 'Top Secret Password' }
  let(:valid_user) {
    FactoryBot.create(:user,
                       login: 'johndoe',
                       password: valid_user_password,
                       password_confirmation: valid_user_password)
  }

  let(:api_key) { '12345678' }

  let(:public) { false }
  let(:project) { FactoryBot.create(:project, is_public: public) }

  before(:each) do
    FactoryBot.create(:non_member, permissions: [:browse_repository])
    DeletedUser.first # creating it first in order to avoid problems with should_receive

    random_project = FactoryBot.create(:project, is_public: false)
    FactoryBot.create(:member,
                       user: valid_user,
                       roles: [browse_role],
                       project: random_project)
    allow(Setting).to receive(:sys_api_key).and_return(api_key)
    allow(Setting).to receive(:sys_api_enabled?).and_return(true)
    allow(Setting).to receive(:repository_authentication_caching_enabled?).and_return(true)

    Rails.cache.clear
    RequestStore.clear!
  end

  describe 'svn' do
    let!(:repository) { FactoryBot.create(:repository_subversion, project: project) }

    describe 'repo_auth' do
      context 'for valid login, but no access to repo_auth' do
        before(:each) do
          request.env['HTTP_AUTHORIZATION'] =
            ActionController::HttpAuthentication::Basic.encode_credentials(
              valid_user.login,
              valid_user_password
            )

          post 'repo_auth', params: { key: api_key,
                                      repository: 'without-access',
                                      method: 'GET' }
        end

        it 'should respond 403 not allowed' 

      end

      context 'for valid login and user has read permission (role reporter) for project' do
        before(:each) do
          FactoryBot.create(:member,
                             user: valid_user,
                             roles: [browse_role],
                             project: project)

          request.env['HTTP_AUTHORIZATION'] =
            ActionController::HttpAuthentication::Basic.encode_credentials(
              valid_user.login,
              valid_user_password
            )
        end

        it 'should respond 200 okay dokay for GET' 


        it 'should respond 403 not allowed for POST' 

      end

      context 'for valid login and user has rw permission (role developer) for project' do
        before(:each) do
          FactoryBot.create(:member,
                             user: valid_user,
                             roles: [commit_role],
                             project: project)
          valid_user.save
          request.env['HTTP_AUTHORIZATION'] =
            ActionController::HttpAuthentication::Basic.encode_credentials(
              valid_user.login,
              valid_user_password
            )
        end

        it 'should respond 200 okay dokay for GET' 


        it 'should respond 200 okay dokay for POST' 

      end

      context 'for invalid login and user has role manager for project' do
        before(:each) do
          FactoryBot.create(:member,
                             user: valid_user,
                             roles: [commit_role],
                             project: project)
          request.env['HTTP_AUTHORIZATION'] =
            ActionController::HttpAuthentication::Basic.encode_credentials(
              valid_user.login,
              valid_user_password + 'made invalid'
            )

          post 'repo_auth', params: { key: api_key,
                                      repository: project.identifier,
                                      method: 'GET' }
        end

        it 'should respond 401 auth required' 

      end

      context 'for valid login and user is not member for project' do
        before(:each) do
          request.env['HTTP_AUTHORIZATION'] =
            ActionController::HttpAuthentication::Basic.encode_credentials(
              valid_user.login,
              valid_user_password
            )

          post 'repo_auth', params: { key: api_key,
                                      repository: project.identifier,
                                      method: 'GET' }
        end

        it 'should respond 403 not allowed' 

      end

      context 'for valid login and project is public' do
        let(:public) { true }

        before(:each) do
          random_project = FactoryBot.create(:project, is_public: false)
          FactoryBot.create(:member,
                             user: valid_user,
                             roles: [browse_role],
                             project: random_project)

          request.env['HTTP_AUTHORIZATION'] =
            ActionController::HttpAuthentication::Basic.encode_credentials(
              valid_user.login,
              valid_user_password
            )

          post 'repo_auth', params: { key: api_key,
                                      repository: project.identifier,
                                      method: 'GET' }
        end

        it 'should respond 200 OK' 

      end

      context 'for invalid credentials' do
        before(:each) do
          post 'repo_auth', params: { key: api_key,
                                      repository: 'any-repo',
                                      method: 'GET' }
        end

        it 'should respond 401 auth required' 

      end

      context 'for invalid api key' do
        it 'should respond 403 for valid username/password' 


        it 'should respond 403 for invalid username/password' 

      end
    end
  end

  describe 'git' do
    let!(:repository) { FactoryBot.create(:repository_git, project: project) }
    describe 'repo_auth' do
      context 'for valid login, but no access to repo_auth' do
        before(:each) do
          request.env['HTTP_AUTHORIZATION'] =
            ActionController::HttpAuthentication::Basic.encode_credentials(
              valid_user.login,
              valid_user_password
            )

          post 'repo_auth', params: { key: api_key,
                                      repository: 'without-access',
                                      method: 'GET',
                                      git_smart_http: '1',
                                      uri: '/git',
                                      location: '/git' }
        end

        it 'should respond 403 not allowed' 

      end

      context 'for valid login and user has read permission (role reporter) for project' do
        before(:each) do
          FactoryBot.create(:member,
                             user: valid_user,
                             roles: [browse_role],
                             project: project)

          request.env['HTTP_AUTHORIZATION'] =
            ActionController::HttpAuthentication::Basic.encode_credentials(
              valid_user.login,
              valid_user_password
            )
        end

        it 'should respond 200 okay dokay for read-only access' 


        it 'should respond 403 not allowed for write (push)' 

      end

      context 'for valid login and user has rw permission (role developer) for project' do
        before(:each) do
          FactoryBot.create(:member,
                             user: valid_user,
                             roles: [commit_role],
                             project: project)
          valid_user.save

          request.env['HTTP_AUTHORIZATION'] =
            ActionController::HttpAuthentication::Basic.encode_credentials(
              valid_user.login,
              valid_user_password
            )
        end

        it 'should respond 200 okay dokay for GET' 


        it 'should respond 200 okay dokay for POST' 

      end

      context 'for invalid login and user has role manager for project' do
        before(:each) do
          FactoryBot.create(:member,
                             user: valid_user,
                             roles: [commit_role],
                             project: project)

          request.env['HTTP_AUTHORIZATION'] =
            ActionController::HttpAuthentication::Basic.encode_credentials(
              valid_user.login,
              valid_user_password + 'made invalid'
            )

          post 'repo_auth', params: { key: api_key,
                                      repository: project.identifier,
                                      method: 'GET',
                                      git_smart_http: '1',
                                      uri: '/git',
                                      location: '/git' }
        end

        it 'should respond 401 auth required' 

      end

      context 'for valid login and user is not member for project' do
        before(:each) do
          project = FactoryBot.create(:project, is_public: false)
          request.env['HTTP_AUTHORIZATION'] =
            ActionController::HttpAuthentication::Basic.encode_credentials(
              valid_user.login,
              valid_user_password
            )

          post 'repo_auth', params: { key: api_key,
                                      repository: project.identifier,
                                      method: 'GET',
                                      git_smart_http: '1',
                                      uri: '/git',
                                      location: '/git' }
        end

        it 'should respond 403 not allowed' 

      end

      context 'for valid login and project is public' do
        let(:public) { true }
        before(:each) do
          random_project = FactoryBot.create(:project, is_public: false)
          FactoryBot.create(:member,
                             user: valid_user,
                             roles: [browse_role],
                             project: random_project)

          request.env['HTTP_AUTHORIZATION'] =
            ActionController::HttpAuthentication::Basic.encode_credentials(
              valid_user.login,
              valid_user_password
            )
          post 'repo_auth', params: { key: api_key,
                                      repository: project.identifier,
                                      method: 'GET',
                                      git_smart_http: '1',
                                      uri: '/git',
                                      location: '/git' }
        end

        it 'should respond 200 OK' 

      end

      context 'for invalid credentials' do
        before(:each) do
          post 'repo_auth', params: { key: api_key,
                                      repository: 'any-repo',
                                      method: 'GET',
                                      git_smart_http: '1',
                                      uri: '/git',
                                      location: '/git' }
        end

        it 'should respond 401 auth required' 

      end

      context 'for invalid api key' do
        it 'should respond 403 for valid username/password' 


        it 'should respond 403 for invalid username/password' 

      end
    end
  end

  describe '#cached_user_login' do
    let(:cache_key) {
      OpenProject::RepositoryAuthentication::CACHE_PREFIX +
        Digest::SHA1.hexdigest("#{valid_user.login}#{valid_user_password}")
    }
    let(:cache_expiry) { OpenProject::RepositoryAuthentication::CACHE_EXPIRES_AFTER }

    it 'should call user_login only once when called twice' 


    it 'should return the same as user_login for valid creds' 


    it 'should return the same as user_login for invalid creds' 


    it 'should use cache' 


    describe 'with caching disabled' do
      before do
        allow(Setting).to receive(:repository_authentication_caching_enabled?).and_return(false)
      end

      it 'should not use a cache' 

    end

    describe 'update_required_storage' do
      let(:force) { nil }
      let(:apikey) { Setting.sys_api_key }
      let(:last_updated) { nil }

      def request_storage
        get 'update_required_storage', params: { key: apikey,
                                                 id: id,
                                                 force: force }
      end

      context 'missing project' do
        let(:id) { 1234 }

        it 'returns 404' 

      end

      context 'available project, but missing repository' do
        let(:project) { FactoryBot.build_stubbed(:project) }
        let(:id) { project.id }
        before do
          allow(Project).to receive(:find).and_return(project)
          request_storage
        end

        it 'returns 404' 

      end

      context 'stubbed repository' do
        let(:project) { FactoryBot.build_stubbed(:project) }
        let(:id) { project.id }
        let(:repository) {
          FactoryBot.build_stubbed(:repository_subversion, url: url, root_url: url)
        }

        before do
          allow(Project).to receive(:find).and_return(project)
          allow(project).to receive(:repository).and_return(repository)

          allow(repository).to receive(:storage_updated_at).and_return(last_updated)
          request_storage
        end

        context 'local non-existing repository' do
          let(:root_url) { '/tmp/does/not/exist/svn/foo.svn' }
          let(:url) { "file://#{root_url}" }

          it 'does not have storage available' 

        end

        context 'remote stubbed repository' do
          let(:root_url) { '' }
          let(:url) { 'https://foo.example.org/svn/bar' }

          it 'has no storage available' 

        end
      end

      context 'local existing repository' do
        with_subversion_repository do |repo_dir|
          let(:root_url) { repo_dir }
          let(:url) { "file://#{root_url}" }

          let(:project) { FactoryBot.create(:project) }
          let(:id) { project.id }
          let(:repository) {
            FactoryBot.create(:repository_subversion, project: project, url: url, root_url: url)
          }

          before do
            allow(Project).to receive(:find).and_return(project)
            allow(project).to receive(:repository).and_return(repository)
            allow(repository).to receive(:storage_updated_at).and_return(last_updated)
          end

          it 'has storage available' 


          context 'storage never updated before' do
            it 'updates the storage' 

          end

          context 'outdated storage' do
            let(:last_updated) { 2.days.ago }
            it 'updates the storage' 

          end

          context 'valid storage time' do
            let(:last_updated) { 10.minutes.ago }

            it 'does not update to storage' 

          end

          context 'valid storage time and force' do
            let(:force) { '1' }
            let(:last_updated) { 10.minutes.ago }

            it 'does update to storage' 

          end
        end
      end
    end
  end
end
