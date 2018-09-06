require 'spec_helper'

describe Gitlab::Auth do
  let(:gl_auth) { described_class }

  describe 'constants' do
    it 'API_SCOPES contains all scopes for API access' 


    it 'OPENID_SCOPES contains all scopes for OpenID Connect' 


    it 'DEFAULT_SCOPES contains all default scopes' 


    it 'optional_scopes contains all non-default scopes' 


    context 'registry_scopes' do
      context 'when registry is disabled' do
        before do
          stub_container_registry_config(enabled: false)
        end

        it 'is empty' 

      end

      context 'when registry is enabled' do
        before do
          stub_container_registry_config(enabled: true)
        end

        it 'contains all registry related scopes' 

      end
    end
  end

  describe 'find_for_git_client' do
    context 'build token' do
      subject { gl_auth.find_for_git_client('gitlab-ci-token', build.token, project: project, ip: 'ip') }

      context 'for running build' do
        let!(:build) { create(:ci_build, :running) }
        let(:project) { build.project }

        before do
          expect(gl_auth).to receive(:rate_limit!).with('ip', success: true, login: 'gitlab-ci-token')
        end

        it 'recognises user-less build' 


        it 'recognises user token' 

      end

      (HasStatus::AVAILABLE_STATUSES - ['running']).each do |build_status|
        context "for #{build_status} build" do
          let!(:build) { create(:ci_build, status: build_status) }
          let(:project) { build.project }

          before do
            expect(gl_auth).to receive(:rate_limit!).with('ip', success: false, login: 'gitlab-ci-token')
          end

          it 'denies authentication' 

        end
      end
    end

    it 'recognizes other ci services' 


    it 'recognizes master passwords' 


    include_examples 'user login operation with unique ip limit' do
      let(:user) { create(:user, password: 'password') }

      def operation
        expect(gl_auth.find_for_git_client(user.username, 'password', project: nil, ip: 'ip')).to eq(Gitlab::Auth::Result.new(user, nil, :gitlab_or_ldap, full_authentication_abilities))
      end
    end

    context 'while using LFS authenticate' do
      it 'recognizes user lfs tokens' 


      it 'recognizes deploy key lfs tokens' 


      it 'does not try password auth before oauth' 


      it 'grants deploy key write permissions' 


      it 'does not grant deploy key write permissions' 

    end

    context 'while using OAuth tokens as passwords' do
      let(:user) { create(:user) }
      let(:token_w_api_scope) { Doorkeeper::AccessToken.create!(application_id: application.id, resource_owner_id: user.id, scopes: 'api') }
      let(:application) { Doorkeeper::Application.create!(name: 'MyApp', redirect_uri: 'https://app.com', owner: user) }

      it 'succeeds for OAuth tokens with the `api` scope' 


      it 'fails for OAuth tokens with other scopes' 


      it 'does not try password auth before oauth' 

    end

    context 'while using personal access tokens as passwords' do
      it 'succeeds for personal access tokens with the `api` scope' 


      context 'when registry is enabled' do
        before do
          stub_container_registry_config(enabled: true)
        end

        it 'succeeds for personal access tokens with the `read_registry` scope' 

      end

      it 'succeeds if it is an impersonation token' 


      it 'limits abilities based on scope' 


      it 'fails if password is nil' 

    end

    context 'while using regular user and password' do
      it 'falls through lfs authentication' 


      it 'fails through oauth authentication when the username is oauth2' 

    end

    it 'returns double nil for invalid credentials' 


    it 'throws an error suggesting user create a PAT when internal auth is disabled' 


    context 'while using deploy tokens' do
      let(:project) { create(:project) }
      let(:auth_failure) { Gitlab::Auth::Result.new(nil, nil) }

      context 'when the deploy token has read_repository as scope' do
        let(:deploy_token) { create(:deploy_token, read_registry: false, projects: [project]) }
        let(:login) { deploy_token.username }

        it 'succeeds when login and token are valid' 


        it 'fails when login is not valid' 


        it 'fails when token is not valid' 


        it 'fails if token is nil' 


        it 'fails if token is not related to project' 


        it 'fails if token has been revoked' 

      end

      context 'when the deploy token has read_registry as a scope' do
        let(:deploy_token) { create(:deploy_token, read_repository: false, projects: [project]) }
        let(:login) { deploy_token.username }

        context 'when registry enabled' do
          before do
            stub_container_registry_config(enabled: true)
          end

          it 'succeeds when login and token are valid' 


          it 'fails when login is not valid' 


          it 'fails when token is not valid' 


          it 'fails if token is nil' 


          it 'fails if token is not related to project' 


          it 'fails if token has been revoked' 

        end

        context 'when registry disabled' do
          before do
            stub_container_registry_config(enabled: false)
          end

          it 'fails when login and token are valid' 

        end
      end
    end
  end

  describe 'find_with_user_password' do
    let!(:user) do
      create(:user,
        username: username,
        password: password,
        password_confirmation: password)
    end
    let(:username) { 'John' }     # username isn't lowercase, test this
    let(:password) { 'my-secret' }

    it "finds user by valid login/password" 


    it 'finds user by valid email/password with case-insensitive email' 


    it 'finds user by valid username/password with case-insensitive username' 


    it "does not find user with invalid password" 


    it "does not find user with invalid login" 


    include_examples 'user login operation with unique ip limit' do
      def operation
        expect(gl_auth.find_with_user_password(username, password)).to eq(user)
      end
    end

    it "does not find user in blocked state" 


    it "does not find user in ldap_blocked state" 


    context "with ldap enabled" do
      before do
        allow(Gitlab::Auth::LDAP::Config).to receive(:enabled?).and_return(true)
      end

      it "tries to autheticate with db before ldap" 


      it "does not find user by using ldap as fallback to for authentication" 


      it "find new user by using ldap as fallback to for authentication" 

    end

    context "with password authentication disabled for Git" do
      before do
        stub_application_setting(password_authentication_enabled_for_git: false)
      end

      it "does not find user by valid login/password" 


      context "with ldap enabled" do
        before do
          allow(Gitlab::Auth::LDAP::Config).to receive(:enabled?).and_return(true)
        end

        it "does not find non-ldap user by valid login/password" 

      end
    end
  end

  private

  def build_authentication_abilities
    [
      :read_project,
      :build_download_code,
      :build_read_container_image,
      :build_create_container_image
    ]
  end

  def read_authentication_abilities
    [
      :read_project,
      :download_code,
      :read_container_image
    ]
  end

  def read_write_authentication_abilities
    read_authentication_abilities + [
      :push_code,
      :create_container_image
    ]
  end

  def full_authentication_abilities
    read_write_authentication_abilities + [
      :admin_container_image
    ]
  end
end

