require 'rails_helper'

def auth_token_for(user)
  {
    extra: {
      all_emails: [{
        email: user.email,
        primary: true,
        verified: true,
      }]
    },
    info: {
      email: user.email,
      nickname: user.username,
      name: user.name,
      image: "https://avatars3.githubusercontent.com/u/#{user.username}",
    },
    uid: '100'
  }
end

describe Auth::GithubAuthenticator do
  let(:authenticator) { described_class.new }
  let(:user) { Fabricate(:user) }

  context 'after_authenticate' do
    let(:data) do
      {
        extra: {
          all_emails: [{
            email: user.email,
            primary: true,
            verified: true,
          }]
        },
        info: {
          email: user.email,
          nickname: user.username,
          name: user.name,
        },
        uid: "100"
      }
    end

    it 'can authenticate and create a user record for already existing users' 


    it 'should use primary email for new user creation over other available emails' 


    it 'should not error out if user already has a different old github account attached' 


    it 'will not authenticate for already existing users with an unverified email' 


    it 'can create a proper result for non existing users' 


    it 'will skip blacklisted domains for non existing users' 


    it 'will find whitelisted domains for non existing users' 


    it 'can connect to a different existing user account' 


  end

  context 'revoke' do
    let(:user) { Fabricate(:user) }
    let(:authenticator) { Auth::GithubAuthenticator.new }

    it 'raises exception if no entry for user' 


      it 'revokes correctly' 


  end

  describe 'avatar retrieval' do
    let(:job_klass) { Jobs::DownloadAvatarFromUrl }

    context 'when user has a custom avatar' do
      let(:user_avatar) { Fabricate(:user_avatar, custom_upload: Fabricate(:upload)) }
      let(:user_with_custom_avatar) { Fabricate(:user, user_avatar: user_avatar) }

      it 'does not enqueue a download_avatar_from_url job' 

    end

    context 'when user does not have a custom avatar' do
      it 'enqueues a download_avatar_from_url job' 

    end
  end
end

