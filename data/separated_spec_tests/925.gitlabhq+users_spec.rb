require 'spec_helper'

describe API::Users do
  let(:user)  { create(:user) }
  let(:admin) { create(:admin) }
  let(:key) { create(:key, user: user) }
  let(:gpg_key) { create(:gpg_key, user: user) }
  let(:email) { create(:email, user: user) }
  let(:omniauth_user) { create(:omniauth_user) }
  let(:ldap_user) { create(:omniauth_user, provider: 'ldapmain') }
  let(:ldap_blocked_user) { create(:omniauth_user, provider: 'ldapmain', state: 'ldap_blocked') }
  let(:not_existing_user_id) { (User.maximum('id') || 0 ) + 10 }
  let(:not_existing_pat_id) { (PersonalAccessToken.maximum('id') || 0 ) + 10 }
  let(:private_user) { create(:user, private_profile: true) }

  shared_examples 'rendering user status' do
    it 'returns the status if there was one' 


    it 'returns an empty response if there was no status' 

  end

  describe 'GET /users' do
    context "when unauthenticated" do
      it "returns authorization error when the `username` parameter is not passed" 


      it "returns the user when a valid `username` parameter is passed" 


      it "returns the user when a valid `username` parameter is passed (case insensitive)" 


      it "returns an empty response when an invalid `username` parameter is passed" 


      context "when public level is restricted" do
        before do
          stub_application_setting(restricted_visibility_levels: [Gitlab::VisibilityLevel::PUBLIC])
        end

        it "returns authorization error when the `username` parameter refers to an inaccessible user" 


        it "returns authorization error when the `username` parameter is not passed" 

      end
    end

    context "when authenticated" do
      # These specs are written just in case API authentication is not required anymore
      context "when public level is restricted" do
        before do
          stub_application_setting(restricted_visibility_levels: [Gitlab::VisibilityLevel::PUBLIC])
        end

        context 'when authenticate as a regular user' do
          it "renders 200" 

        end

        context 'when authenticate as an admin' do
          it "renders 200" 

        end
      end

      it "returns an array of users" 


      it "returns an array of blocked users" 


      it "returns one user" 


      it "returns one user (case insensitive)" 


      it "returns a 403 when non-admin user searches by external UID" 


      it 'does not reveal the `is_admin` flag of the user' 

    end

    context "when admin" do
      context 'when sudo is defined' do
        it 'does not return 500' 

      end

      it "returns an array of users" 


      it "returns an array of external users" 


      it "returns one user by external UID" 


      it "returns 400 error if provider with no extern_uid" 


      it "returns 400 error if provider with no extern_uid" 


      it "returns a user created before a specific date" 


      it "returns no users created before a specific date" 


      it "returns users created before and after a specific date" 


      it 'returns the correct order when sorted by id' 


      it 'returns users with 2fa enabled' 


      it 'returns 400 when provided incorrect sort params' 

    end
  end

  describe "GET /users/:id" do
    it "returns a user by id" 


    it "does not return the user's `is_admin` flag" 


    context 'when authenticated as admin' do
      it 'includes the `is_admin` field' 


      it "includes the `created_at` field for private users" 

    end

    context 'for an anonymous user' do
      it "returns a user by id" 


      it "returns a 404 if the target user is present but inaccessible" 


      it "returns the `created_at` field for public users" 


      it "does not return the `created_at` field for private users" 

    end

    it "returns a 404 error if user id not found" 


    it "returns a 404 for invalid ID" 

  end

  describe 'GET /users/:id_or_username/status' do
    context 'when finding the user by id' do
      it_behaves_like 'rendering user status' do
        let(:path) { "/users/#{user.id}/status" }
      end
    end

    context 'when finding the user by username' do
      it_behaves_like 'rendering user status' do
        let(:path) { "/users/#{user.username}/status" }
      end
    end

    context 'when finding the user by username (case insensitive)' do
      it_behaves_like 'rendering user status' do
        let(:path) { "/users/#{user.username.upcase}/status" }
      end
    end
  end

  describe "POST /users" do
    before do
      admin
    end

    it "creates user" 


    it "creates user with correct attributes" 


    it "creates user with optional attributes" 


    it "creates non-admin user" 


    it "creates non-admin users by default" 


    it "returns 201 Created on success" 


    it 'creates non-external users by default' 


    it 'allows an external user to be created' 


    it "creates user with reset password" 


    it "creates user with private profile" 


    it "does not create user with invalid email" 


    it 'returns 400 error if name not given' 


    it 'returns 400 error if password not given' 


    it 'returns 400 error if email not given' 


    it 'returns 400 error if username not given' 


    it 'returns 400 error if user does not validate' 


    it "is not available for non admin users" 


    context 'with existing user' do
      before do
        post api('/users', admin),
             email: 'test@example.com',
             password: 'password',
             username: 'test',
             name: 'foo'
      end

      it 'returns 409 conflict error if user with same email exists' 


      it 'returns 409 conflict error if same username exists' 


      it 'returns 409 conflict error if same username exists (case insensitive)' 


      it 'creates user with new identity' 

    end

    context "scopes" do
      let(:user) { admin }
      let(:path) { '/users' }
      let(:api_call) { method(:api) }

      include_examples 'does not allow the "read_user" scope'
    end
  end

  describe "GET /users/sign_up" do
    it "redirects to sign in page" 

  end

  describe "PUT /users/:id" do
    let!(:admin_user) { create(:admin) }

    it "updates user with new bio" 


    it "updates user with new password and forces reset on next login" 


    it "updates user with organization" 


    it 'updates user with avatar' 


    it 'updates user with a new email' 


    it 'skips reconfirmation when requested' 


    it 'updates user with his own username' 


    it "updates user's existing identity" 


    it 'updates user with new identity' 


    it "updates admin status" 


    it "updates external status" 


    it "updates private profile" 


    it "does not update admin status" 


    it "does not allow invalid update" 


    context 'when the current user is not an admin' do
      it "is not available" 

    end

    it "returns 404 for non-existing user" 


    it "returns a 404 if invalid ID" 


    it 'returns 400 error if user does not validate' 


    it 'returns 400 if provider is missing for identity update' 


    it 'returns 400 if external UID is missing for identity update' 


    context "with existing user" do
      before do
        post api("/users", admin), { email: 'test@example.com', password: 'password', username: 'test', name: 'test' }
        post api("/users", admin), { email: 'foo@bar.com', password: 'password', username: 'john', name: 'john' }
        @user = User.all.last
      end

      it 'returns 409 conflict error if email address exists' 


      it 'returns 409 conflict error if username taken' 


      it 'returns 409 conflict error if username taken (case insensitive)' 

    end
  end

  describe "POST /users/:id/keys" do
    before do
      admin
    end

    it "does not create invalid ssh key" 


    it 'does not create key without title' 


    it "creates ssh key" 


    it "returns 400 for invalid ID" 

  end

  describe 'GET /user/:id/keys' do
    it 'returns 404 for non-existing user' 


    it 'returns array of ssh keys' 

  end

  describe 'DELETE /user/:id/keys/:key_id' do
    before do
      admin
    end

    context 'when unauthenticated' do
      it 'returns authentication error' 

    end

    context 'when authenticated' do
      it 'deletes existing key' 


      it_behaves_like '412 response' do
        let(:request) { api("/users/#{user.id}/keys/#{key.id}", admin) }
      end

      it 'returns 404 error if user not found' 


      it 'returns 404 error if key not foud' 

    end
  end

  describe 'POST /users/:id/keys' do
    before do
      admin
    end

    it 'does not create invalid GPG key' 


    it 'creates GPG key' 


    it 'returns 400 for invalid ID' 

  end

  describe 'GET /user/:id/gpg_keys' do
    before do
      admin
    end

    context 'when unauthenticated' do
      it 'returns authentication error' 

    end

    context 'when authenticated' do
      it 'returns 404 for non-existing user' 


      it 'returns 404 error if key not foud' 


      it 'returns array of GPG keys' 

    end
  end

  describe 'DELETE /user/:id/gpg_keys/:key_id' do
    before do
      admin
    end

    context 'when unauthenticated' do
      it 'returns authentication error' 

    end

    context 'when authenticated' do
      it 'deletes existing key' 


      it 'returns 404 error if user not found' 


      it 'returns 404 error if key not foud' 

    end
  end

  describe 'POST /user/:id/gpg_keys/:key_id/revoke' do
    before do
      admin
    end

    context 'when unauthenticated' do
      it 'returns authentication error' 

    end

    context 'when authenticated' do
      it 'revokes existing key' 


      it 'returns 404 error if user not found' 


      it 'returns 404 error if key not foud' 

    end
  end

  describe "POST /users/:id/emails" do
    before do
      admin
    end

    it "does not create invalid email" 


    it "creates unverified email" 


    it "returns a 400 for invalid ID" 


    it "creates verified email" 

  end

  describe 'GET /user/:id/emails' do
    before do
      admin
    end

    context 'when unauthenticated' do
      it 'returns authentication error' 

    end

    context 'when authenticated' do
      it 'returns 404 for non-existing user' 


      it 'returns array of emails' 


      it "returns a 404 for invalid ID" 

    end
  end

  describe 'DELETE /user/:id/emails/:email_id' do
    before do
      admin
    end

    context 'when unauthenticated' do
      it 'returns authentication error' 

    end

    context 'when authenticated' do
      it 'deletes existing email' 


      it_behaves_like '412 response' do
        let(:request) { api("/users/#{user.id}/emails/#{email.id}", admin) }
      end

      it 'returns 404 error if user not found' 


      it 'returns 404 error if email not foud' 


      it "returns a 404 for invalid ID" 

    end
  end

  describe "DELETE /users/:id" do
    let!(:namespace) { user.namespace }
    let!(:issue) { create(:issue, author: user) }

    before do
      admin
    end

    it "deletes user" 


    it_behaves_like '412 response' do
      let(:request) { api("/users/#{user.id}", admin) }
    end

    it "does not delete for unauthenticated user" 


    it "is not available for non admin users" 


    it "returns 404 for non-existing user" 


    it "returns a 404 for invalid ID" 


    context "hard delete disabled" do
      it "moves contributions to the ghost user" 

    end

    context "hard delete enabled" do
      it "removes contributions" 

    end
  end

  describe "GET /user" do
    let(:personal_access_token) { create(:personal_access_token, user: user).token }

    shared_examples 'get user info' do |version|
      context 'with regular user' do
        context 'with personal access token' do
          it 'returns 403 without private token when sudo is defined' 

        end

        it 'returns current user without private token when sudo not defined' 


        context "scopes" do
          let(:path) { "/user" }
          let(:api_call) { method(:api) }

          include_examples 'allows the "read_user" scope', version
        end
      end

      context 'with admin' do
        let(:admin_personal_access_token) { create(:personal_access_token, user: admin).token }

        context 'with personal access token' do
          it 'returns 403 without private token when sudo defined' 


          it 'returns initial current user without private token but with is_admin when sudo not defined' 

        end
      end

      context 'with unauthenticated user' do
        it "returns 401 error if user is unauthenticated" 

      end
    end

    it_behaves_like 'get user info', 'v3'
    it_behaves_like 'get user info', 'v4'
  end

  describe "GET /user/keys" do
    context "when unauthenticated" do
      it "returns authentication error" 

    end

    context "when authenticated" do
      it "returns array of ssh keys" 


      context "scopes" do
        let(:path) { "/user/keys" }
        let(:api_call) { method(:api) }

        include_examples 'allows the "read_user" scope'
      end
    end
  end

  describe "GET /user/keys/:key_id" do
    it "returns single key" 


    it "returns 404 Not Found within invalid ID" 


    it "returns 404 error if admin accesses user's ssh key" 


    it "returns 404 for invalid ID" 


    context "scopes" do
      let(:path) { "/user/keys/#{key.id}" }
      let(:api_call) { method(:api) }

      include_examples 'allows the "read_user" scope'
    end
  end

  describe "POST /user/keys" do
    it "creates ssh key" 


    it "returns a 401 error if unauthorized" 


    it "does not create ssh key without key" 


    it 'does not create ssh key without title' 


    it "does not create ssh key without title" 

  end

  describe "DELETE /user/keys/:key_id" do
    it "deletes existed key" 


    it_behaves_like '412 response' do
      let(:request) { api("/user/keys/#{key.id}", user) }
    end

    it "returns 404 if key ID not found" 


    it "returns 401 error if unauthorized" 


    it "returns a 404 for invalid ID" 

  end

  describe 'GET /user/gpg_keys' do
    context 'when unauthenticated' do
      it 'returns authentication error' 

    end

    context 'when authenticated' do
      it 'returns array of GPG keys' 


      context 'scopes' do
        let(:path) { '/user/gpg_keys' }
        let(:api_call) { method(:api) }

        include_examples 'allows the "read_user" scope'
      end
    end
  end

  describe 'GET /user/gpg_keys/:key_id' do
    it 'returns a single key' 


    it 'returns 404 Not Found within invalid ID' 


    it "returns 404 error if admin accesses user's GPG key" 


    it 'returns 404 for invalid ID' 


    context 'scopes' do
      let(:path) { "/user/gpg_keys/#{gpg_key.id}" }
      let(:api_call) { method(:api) }

      include_examples 'allows the "read_user" scope'
    end
  end

  describe 'POST /user/gpg_keys' do
    it 'creates a GPG key' 


    it 'returns a 401 error if unauthorized' 


    it 'does not create GPG key without key' 

  end

  describe 'POST /user/gpg_keys/:key_id/revoke' do
    it 'revokes existing GPG key' 


    it 'returns 404 if key ID not found' 


    it 'returns 401 error if unauthorized' 


    it 'returns a 404 for invalid ID' 

  end

  describe 'DELETE /user/gpg_keys/:key_id' do
    it 'deletes existing GPG key' 


    it 'returns 404 if key ID not found' 


    it 'returns 401 error if unauthorized' 


    it 'returns a 404 for invalid ID' 

  end

  describe "GET /user/emails" do
    context "when unauthenticated" do
      it "returns authentication error" 

    end

    context "when authenticated" do
      it "returns array of emails" 


      context "scopes" do
        let(:path) { "/user/emails" }
        let(:api_call) { method(:api) }

        include_examples 'allows the "read_user" scope'
      end
    end
  end

  describe "GET /user/emails/:email_id" do
    it "returns single email" 


    it "returns 404 Not Found within invalid ID" 


    it "returns 404 error if admin accesses user's email" 


    it "returns 404 for invalid ID" 


    context "scopes" do
      let(:path) { "/user/emails/#{email.id}" }
      let(:api_call) { method(:api) }

      include_examples 'allows the "read_user" scope'
    end
  end

  describe "POST /user/emails" do
    it "creates email" 


    it "returns a 401 error if unauthorized" 


    it "does not create email with invalid email" 

  end

  describe "DELETE /user/emails/:email_id" do
    it "deletes existed email" 


    it_behaves_like '412 response' do
      let(:request) { api("/user/emails/#{email.id}", user) }
    end

    it "returns 404 if email ID not found" 


    it "returns 401 error if unauthorized" 


    it "returns 400 for invalid ID" 

  end

  describe 'POST /users/:id/block' do
    before do
      admin
    end

    it 'blocks existing user' 


    it 'does not re-block ldap blocked users' 


    it 'does not be available for non admin users' 


    it 'returns a 404 error if user id not found' 

  end

  describe 'POST /users/:id/unblock' do
    let(:blocked_user)  { create(:user, state: 'blocked') }

    before do
      admin
    end

    it 'unblocks existing user' 


    it 'unblocks a blocked user' 


    it 'does not unblock ldap blocked users' 


    it 'does not be available for non admin users' 


    it 'returns a 404 error if user id not found' 


    it "returns a 404 for invalid ID" 

  end

  context "user activities", :clean_gitlab_redis_shared_state do
    let!(:old_active_user) { create(:user, last_activity_on: Time.utc(2000, 1, 1)) }
    let!(:newly_active_user) { create(:user, last_activity_on: 2.days.ago.midday) }

    context 'last activity as normal user' do
      it 'has no permission' 

    end

    context 'as admin' do
      it 'returns the activities from the last 6 months' 


      context 'passing a :from parameter' do
        it 'returns the activities from the given date' 

      end
    end
  end

  describe 'GET /user/status' do
    let(:path) { '/user/status' }
    it_behaves_like 'rendering user status'
  end

  describe 'PUT /user/status' do
    it 'saves the status' 


    it 'renders errors when the status was invalid' 


    it 'deletes the status when passing empty values' 

  end

  describe 'GET /users/:user_id/impersonation_tokens' do
    let!(:active_personal_access_token) { create(:personal_access_token, user: user) }
    let!(:revoked_personal_access_token) { create(:personal_access_token, :revoked, user: user) }
    let!(:expired_personal_access_token) { create(:personal_access_token, :expired, user: user) }
    let!(:impersonation_token) { create(:personal_access_token, :impersonation, user: user) }
    let!(:revoked_impersonation_token) { create(:personal_access_token, :impersonation, :revoked, user: user) }

    it 'returns a 404 error if user not found' 


    it 'returns a 403 error when authenticated as normal user' 


    it 'returns an array of all impersonated tokens' 


    it 'returns an array of active impersonation tokens if state active' 


    it 'returns an array of inactive personal access tokens if active is set to false' 

  end

  describe 'POST /users/:user_id/impersonation_tokens' do
    let(:name) { 'my new pat' }
    let(:expires_at) { '2016-12-28' }
    let(:scopes) { %w(api read_user) }
    let(:impersonation) { true }

    it 'returns validation error if impersonation token misses some attributes' 


    it 'returns a 404 error if user not found' 


    it 'returns a 403 error when authenticated as normal user' 


    it 'creates a impersonation token' 

  end

  describe 'GET /users/:user_id/impersonation_tokens/:impersonation_token_id' do
    let!(:personal_access_token) { create(:personal_access_token, user: user) }
    let!(:impersonation_token) { create(:personal_access_token, :impersonation, user: user) }

    it 'returns 404 error if user not found' 


    it 'returns a 404 error if impersonation token not found' 


    it 'returns a 404 error if token is not impersonation token' 


    it 'returns a 403 error when authenticated as normal user' 


    it 'returns a personal access token' 

  end

  describe 'DELETE /users/:user_id/impersonation_tokens/:impersonation_token_id' do
    let!(:personal_access_token) { create(:personal_access_token, user: user) }
    let!(:impersonation_token) { create(:personal_access_token, :impersonation, user: user) }

    it 'returns a 404 error if user not found' 


    it 'returns a 404 error if impersonation token not found' 


    it 'returns a 404 error if token is not impersonation token' 


    it 'returns a 403 error when authenticated as normal user' 


    it_behaves_like '412 response' do
      let(:request) { api("/users/#{user.id}/impersonation_tokens/#{impersonation_token.id}", admin) }
    end

    it 'revokes a impersonation token' 

  end

  it_behaves_like 'custom attributes endpoints', 'users' do
    let(:attributable) { user }
    let(:other_attributable) { admin }
  end
end

