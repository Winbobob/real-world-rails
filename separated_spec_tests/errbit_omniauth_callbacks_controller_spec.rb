describe Users::OmniauthCallbacksController, type: 'controller' do
  def stub_env_for_github_omniauth(login, token = nil)
    # This a Devise specific thing for functional tests. See https://github.com/plataformatec/devise/issues/closed#issue/608
    request.env["devise.mapping"] = Devise.mappings[:user]
    env = {
      "omniauth.auth" => Hashie::Mash.new(
        provider:    'github',
        extra:       { raw_info: { login: login } },
        credentials: { token: token }
      )
    }
    allow(@controller).to receive(:env).and_return(env)
  end

  context 'Linking a GitHub account to a signed in user' do
    before do
      sign_in @user = Fabricate(:user)
    end

    it "should show an error if another user already has that github login" 


    it "should link an authorized GitHub account" 

  end

  def stub_env_for_google_omniauth(login, _token = nil)
    # This a Devise specific thing for functional tests. See https://github.com/plataformatec/devise/issues/closed#issue/608
    request.env["devise.mapping"] = Devise.mappings[:user]
    env = {
      "omniauth.auth" => Hashie::Mash.new(
        credentials: {
          provider: 'google_oauth2'
        },
        info:        { email: "#{login}@example.com", name: "John Smith" },
        uid:         login
      )
    }
    allow(@controller).to receive(:env).and_return(env)
  end

  context 'Linking a Google account to a signed in user' do
    before do
      sign_in @user = Fabricate(:user)
    end

    it "should show an error if another user already has that google login" 


    it "should link an authorized Google account" 

  end

  # See spec/acceptance/sign_in_with_github_spec.rb for 'Signing in with github' integration tests.
end

