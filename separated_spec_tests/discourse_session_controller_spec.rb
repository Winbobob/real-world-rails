require 'rails_helper'

describe SessionController do
  shared_examples 'failed to continue local login' do
    it 'should return the right response' 

  end

  describe '#become' do
    let!(:user) { Fabricate(:user) }

    it "does not work when in production mode" 


    it "works in developmenet mode" 

  end

  let(:logo_fixture) { "http://#{Discourse.current_hostname}/uploads/logo.png" }

  describe '#sso_login' do
    before do
      @sso_url = "http://somesite.com/discourse_sso"
      @sso_secret = "shjkfdhsfkjh"

      request.host = Discourse.current_hostname

      SiteSetting.sso_url = @sso_url
      SiteSetting.enable_sso = true
      SiteSetting.sso_secret = @sso_secret

      # We have 2 options, either fabricate an admin or don't
      # send welcome messages
      Fabricate(:admin)
      # skip for now
      # SiteSetting.send_welcome_message = false
    end

    def get_sso(return_path)
      nonce = SecureRandom.hex
      dso = DiscourseSingleSignOn.new
      dso.nonce = nonce
      dso.register_nonce(return_path)

      sso = SingleSignOn.new
      sso.nonce = nonce
      sso.sso_secret = @sso_secret
      sso
    end

    it 'can take over an account' 


    def sso_for_ip_specs
      sso = get_sso('/a/')
      sso.external_id = '666' # the number of the beast
      sso.email = 'bob@bob.com'
      sso.name = 'Sam Saffron'
      sso.username = 'sam'
      sso
    end

    it 'respects IP restrictions on create' 


    it 'respects IP restrictions on login' 


    it 'respects email restrictions' 


    it 'allows you to create an admin account' 


    it 'redirects to a non-relative url' 


    it 'redirects to random url if it is allowed' 


    it 'redirects to root if the host of the return_path is different' 


    it 'redirects to root if the host of the return_path is different' 


    it 'allows you to create an account' 


    context 'when sso emails are not trusted' do
      context 'if you have not activated your account' do
        it 'does not log you in' 


        it 'sends an activation email' 

      end

      context 'if you have activated your account' do
        it 'allows you to log in' 

      end
    end

    it 'allows login to existing account with valid nonce' 


    describe 'can act as an SSO provider' do
      before do
        stub_request(:any, /#{Discourse.current_hostname}\/uploads/).to_return(
          status: 200,
          body: lambda { |request| file_from_fixtures("logo.png") }
        )

        SiteSetting.enable_sso_provider = true
        SiteSetting.enable_sso = false
        SiteSetting.enable_local_logins = true
        SiteSetting.sso_secret = "topsecret"

        @sso = SingleSignOn.new
        @sso.nonce = "mynonce"
        @sso.sso_secret = SiteSetting.sso_secret
        @sso.return_sso_url = "http://somewhere.over.rainbow/sso"

        @user = Fabricate(:user, password: "myfrogs123ADMIN", active: true, admin: true)
        group = Fabricate(:group)
        group.add(@user)

        @user.create_user_avatar!
        UserAvatar.import_url_for_user(logo_fixture, @user)
        UserProfile.import_url_for_user(logo_fixture, @user, is_card_background: false)
        UserProfile.import_url_for_user(logo_fixture, @user, is_card_background: true)

        @user.reload
        @user.user_avatar.reload
        @user.user_profile.reload
        EmailToken.update_all(confirmed: true)
      end

      it "successfully logs in and redirects user to return_sso_url when the user is not logged in" 


      it "successfully redirects user to return_sso_url when the user is logged in" 


      it 'handles non local content correctly' 

    end

    describe 'local attribute override from SSO payload' do
      before do
        SiteSetting.email_editable = false
        SiteSetting.sso_overrides_email = true
        SiteSetting.sso_overrides_username = true
        SiteSetting.sso_overrides_name = true

        @user = Fabricate(:user)

        @sso = get_sso('/hello/world')
        @sso.external_id = '997'

        @reversed_username = @user.username.reverse
        @sso.username = @reversed_username
        @sso.email = "#{@reversed_username}@garbage.org"
        @reversed_name = @user.name.reverse
        @sso.name = @reversed_name

        @suggested_username = UserNameSuggester.suggest(@sso.username || @sso.name || @sso.email)
        @suggested_name = User.suggest_name(@sso.name || @sso.username || @sso.email)
        @user.create_single_sign_on_record(external_id: '997', last_payload: '')
      end

      it 'stores the external attributes' 


      it 'overrides attributes' 


      it 'does not change matching attributes for an existing account' 


    end
  end

  describe '#sso_provider' do
    before do
      stub_request(:any, /#{Discourse.current_hostname}\/uploads/).to_return(
        status: 200,
        body: lambda { |request| file_from_fixtures("logo.png") }
      )

      SiteSetting.enable_sso_provider = true
      SiteSetting.enable_sso = false
      SiteSetting.enable_local_logins = true
      SiteSetting.sso_secret = "topsecret"

      @sso = SingleSignOn.new
      @sso.nonce = "mynonce"
      @sso.sso_secret = SiteSetting.sso_secret
      @sso.return_sso_url = "http://somewhere.over.rainbow/sso"

      @user = Fabricate(:user, password: "myfrogs123ADMIN", active: true, admin: true)
      @user.create_user_avatar!
      UserAvatar.import_url_for_user(logo_fixture, @user)
      UserProfile.import_url_for_user(logo_fixture, @user, is_card_background: false)
      UserProfile.import_url_for_user(logo_fixture, @user, is_card_background: true)

      @user.reload
      @user.user_avatar.reload
      @user.user_profile.reload
      EmailToken.update_all(confirmed: true)
    end

    it "successfully logs in and redirects user to return_sso_url when the user is not logged in" 


    it "successfully redirects user to return_sso_url when the user is logged in" 

  end

  describe '#create' do

    let(:user) { Fabricate(:user) }

    context 'local login is disabled' do
      before do
        SiteSetting.enable_local_logins = false

        post :create, params: {
          login: user.username, password: 'myawesomepassword'
        }, format: :json
      end
      it_behaves_like "failed to continue local login"
    end

    context 'SSO is enabled' do
      before do
        SiteSetting.sso_url = "https://www.example.com/sso"
        SiteSetting.enable_sso = true

        post :create, params: {
          login: user.username, password: 'myawesomepassword'
        }, format: :json
      end
      it_behaves_like "failed to continue local login"
    end

    context 'when email is confirmed' do
      before do
        token = user.email_tokens.find_by(email: user.email)
        EmailToken.confirm(token.token)
      end

      it "raises an error when the login isn't present" 


      describe 'invalid password' do
        it "should return an error with an invalid password" 

      end

      describe 'invalid password' do
        it "should return an error with an invalid password if too long" 

      end

      describe 'suspended user' do
        it 'should return an error' 

      end

      describe 'deactivated user' do
        it 'should return an error' 

      end

      describe 'success by username' do
        it 'logs in correctly' 

      end

      context 'when user has 2-factor logins' do
        let!(:user_second_factor) { Fabricate(:user_second_factor, user: user) }

        describe 'when second factor token is missing' do
          it 'should return the right response' 

        end

        describe 'when second factor token is invalid' do
          it 'should return the right response' 

        end

        describe 'when second factor token is valid' do
          it 'should log the user in' 

        end
      end

      describe 'with a blocked IP' do
        before do
          screened_ip = Fabricate(:screened_ip_address)
          ActionDispatch::Request.any_instance.stubs(:remote_ip).returns(screened_ip.ip_address)
          post :create, params: {
            login: "@" + user.username, password: 'myawesomepassword'
          }, format: :json

          user.reload
        end

        it "doesn't log in" 

      end

      describe 'strips leading @ symbol' do
        before do
          post :create, params: {
            login: "@" + user.username, password: 'myawesomepassword'
          }, format: :json

          user.reload
        end

        it 'sets a session id' 

      end

      describe 'also allow login by email' do
        before do
          post :create, params: {
            login: user.email, password: 'myawesomepassword'
          }, format: :json
        end

        it 'sets a session id' 

      end

      context 'login has leading and trailing space' do
        let(:username) { " #{user.username} " }
        let(:email) { " #{user.email} " }

        it "strips spaces from the username" 


        it "strips spaces from the email" 

      end

      describe "when the site requires approval of users" do
        before do
          SiteSetting.expects(:must_approve_users?).returns(true)
        end

        context 'with an unapproved user' do
          before do
            post :create, params: {
              login: user.email, password: 'myawesomepassword'
            }, format: :json
          end

          it "doesn't log in the user" 


          it "shows the 'not approved' error message" 

        end

        context "with an unapproved user who is an admin" do
          before do
            User.any_instance.stubs(:admin?).returns(true)

            post :create, params: {
              login: user.email, password: 'myawesomepassword'
            }, format: :json
          end

          it 'sets a session id' 

        end
      end

      context 'when admins are restricted by ip address' do
        let(:permitted_ip_address) { '111.234.23.11' }
        before do
          Fabricate(:screened_ip_address, ip_address: permitted_ip_address, action_type: ScreenedIpAddress.actions[:allow_admin])
          SiteSetting.use_admin_ip_whitelist = true
        end

        it 'is successful for admin at the ip address' 


        it 'returns an error for admin not at the ip address' 


        it 'is successful for non-admin not at the ip address' 

      end
    end

    context 'when email has not been confirmed' do
      def post_login
        post :create, params: {
          login: user.email, password: 'myawesomepassword'
        }, format: :json
      end

      it "doesn't log in the user" 


      it "shows the 'not activated' error message" 


      context "and the 'must approve users' site setting is enabled" do
        before { SiteSetting.expects(:must_approve_users?).returns(true) }

        it "shows the 'not approved' error message" 

      end
    end

    context 'rate limited' do
      it 'rate limits login' 


      it 'rate limits second factor attempts' 

    end
  end

  describe '.destroy' do
    before do
      @user = log_in
      delete :destroy, params: { id: @user.username }, format: :json
    end

    it 'removes the session variable' 


    it 'removes the auth token cookie' 

  end

  describe '.forgot_password' do

    it 'raises an error without a username parameter' 


    context 'for a non existant username' do
      it "doesn't generate a new token for a made up username" 


      it "doesn't enqueue an email" 

    end

    context 'for an existing username' do
      let(:user) { Fabricate(:user) }

      context 'local login is disabled' do
        before do
          SiteSetting.enable_local_logins = false
          post :forgot_password, params: { login: user.username }, format: :json
        end
        it_behaves_like "failed to continue local login"
      end

      context 'SSO is enabled' do
        before do
          SiteSetting.sso_url = "https://www.example.com/sso"
          SiteSetting.enable_sso = true

          post :create, params: {
            login: user.username, password: 'myawesomepassword'
          }, format: :json
        end
        it_behaves_like "failed to continue local login"
      end

      it "generates a new token for a made up username" 


      it "enqueues an email" 

    end

    context 'do nothing to system username' do
      let(:system) { Discourse.system_user }

      it 'generates no token for system username' 


      it 'enqueues no email' 

    end

    context 'for a staged account' do
      let!(:staged) { Fabricate(:staged) }

      it 'generates no token for staged username' 


      it 'enqueues no email' 

    end
  end

  describe '#current' do
    context "when not logged in" do
      it "retuns 404" 

    end

    context "when logged in" do
      let!(:user) { log_in }

      it "returns the JSON for the user" 

    end
  end
end

