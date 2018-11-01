describe Users::OmniauthCallbacksController, type: 'controller' do
  def stub_env_for_github_omniauth(login, token = nil, email = "user@example.com")
    # This a Devise specific thing for functional tests. See https://github.com/plataformatec/devise/issues/closed#issue/608
    request.env["devise.mapping"] = Devise.mappings[:user]
    env = {
      "omniauth.auth" => Hashie::Mash.new(
        provider:    'github',
        extra:       { raw_info: { login: login, email: email } },
        credentials: { token: token }
      )
    }
    allow(@controller).to receive(:env).and_return(env)
  end

  def stub_client_for_github_omniauth(emails = [])
    mock_gh_client = double
    expect(mock_gh_client).to receive(:organizations) { [OpenStruct.new(id: 42), OpenStruct.new(id: 43)] }
    expect(mock_gh_client).to receive(:api_endpoint=)
    allow(mock_gh_client).to receive(:emails) { emails }
    expect(Octokit::Client).to receive(:new) { mock_gh_client }
  end

  context 'Linking a GitHub account to a signed in user' do
    before do
      sign_in @user = Fabricate(:user)
    end

    it "should show an error if another user already has that github login" 


    it "should link an authorized GitHub account" 

  end

  context 'Creating a new user via Github authentication' do
    before do
      Errbit::Config.github_org_id = 42
    end
    after do
      Errbit::Config.github_org_id = nil
    end

    context 'User has valid emails defined' do
      it "should log in the user" 

    end

    context 'User has no email defined' do
      it 'should return an error' 

    end
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

