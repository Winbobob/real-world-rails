require 'spec_helper'

describe 'OpenID Connect requests' do
  let(:user) do
    create(
      :user,
      name: 'Alice',
      username: 'alice',
      email: 'private@example.com',
      emails: [public_email],
      public_email: public_email.email,
      website_url: 'https://example.com',
      avatar: fixture_file_upload('spec/fixtures/dk.png')
    )
  end

  let(:public_email) { build :email, email: 'public@example.com' }

  let(:access_grant) { create :oauth_access_grant, application: application, resource_owner_id: user.id }
  let(:access_token) { create :oauth_access_token, application: application, resource_owner_id: user.id }

  let(:hashed_subject) do
    Digest::SHA256.hexdigest("#{user.id}-#{Rails.application.secrets.secret_key_base}")
  end

  let(:id_token_claims) do
    {
      'sub'        => user.id.to_s,
      'sub_legacy' => hashed_subject
    }
  end

  let(:user_info_claims) do
    {
      'name'           => 'Alice',
      'nickname'       => 'alice',
      'email'          => 'public@example.com',
      'email_verified' => true,
      'website'        => 'https://example.com',
      'profile'        => 'http://localhost/alice',
      'picture'        => "http://localhost/uploads/-/system/user/avatar/#{user.id}/dk.png",
      'groups'         => kind_of(Array)
    }
  end

  def request_access_token!
    login_as user

    post '/oauth/token',
      grant_type: 'authorization_code',
      code: access_grant.token,
      redirect_uri: application.redirect_uri,
      client_id: application.uid,
      client_secret: application.secret
  end

  def request_user_info!
    get '/oauth/userinfo', nil, 'Authorization' => "Bearer #{access_token.token}"
  end

  context 'Application without OpenID scope' do
    let(:application) { create :oauth_application, scopes: 'api' }

    it 'token response does not include an ID token' 


    it 'userinfo response is unauthorized' 

  end

  context 'Application with OpenID scope' do
    let(:application) { create :oauth_application, scopes: 'openid' }

    it 'token response includes an ID token' 


    context 'UserInfo payload' do
      let!(:group1) { create :group }
      let!(:group2) { create :group }
      let!(:group3) { create :group, parent: group2 }
      let!(:group4) { create :group, parent: group3 }

      before do
        group1.add_user(user, GroupMember::OWNER)
        group3.add_user(user, Gitlab::Access::DEVELOPER)

        request_user_info!
      end

      it 'includes all user information and group memberships' 


      it 'does not include any unknown claims' 

    end

    context 'ID token payload' do
      before do
        request_access_token!
        @payload = JSON::JWT.decode(json_response['id_token'], :skip_verification)
      end

      it 'includes the subject claims' 


      it 'includes the GitLab root URL' 


      it 'includes the time of the last authentication', :clean_gitlab_redis_shared_state do
        expect(@payload['auth_time']).to eq user.current_sign_in_at.to_i
      end

      it 'does not include any unknown properties' 

    end

    # These 2 calls shouldn't actually throw, they should be handled as an
    # unauthorized request, so we should be able to check the response.
    #
    # This was not possible due to an issue with Warden:
    # https://github.com/hassox/warden/pull/162
    #
    # When the patch gets merged and we update Warden, these specs will need to
    # updated to check the response instead of a raised exception.
    # https://gitlab.com/gitlab-org/gitlab-ce/issues/40218
    context 'when user is blocked' do
      it 'returns authentication error' 

    end

    context 'when user is ldap_blocked' do
      it 'returns authentication error' 

    end
  end

  context 'OpenID configuration information' do
    it 'correctly returns the configuration' 

  end
end

