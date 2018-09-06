require 'rails_helper'

# In the ghetto ... getting the spec to run in autospec
#  thing is we need to load up all auth really early pre-fork
#  it means that the require is not going to get a new copy
Auth.send(:remove_const, :GithubAuthenticator)
load 'auth/github_authenticator.rb'

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

    it 'can authenticate and create a user record for already existing users' 


    it 'should use primary email for new user creation over other available emails' 


    it 'will not authenticate for already existing users with an unverified email' 


    it 'can create a proper result for non existing users' 


    it 'will skip blacklisted domains for non existing users' 


    it 'will find whitelisted domains for non existing users' 


  end

  describe 'avatar retrieval' do
    let(:job_klass) { Jobs::DownloadAvatarFromUrl }

    before { SiteSetting.queue_jobs = true }

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

