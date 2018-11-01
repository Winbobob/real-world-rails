require 'rails_helper'

describe UsersController do
  let(:user) { Fabricate(:user) }

  describe '#perform_account_activation' do
    let(:token) do
      return @token if @token.present?
      email_token = EmailToken.create!(expired: false, confirmed: false, user: user, email: user.email)
      @token = email_token.token
      @token
    end

    before do
      UsersController.any_instance.stubs(:honeypot_or_challenge_fails?).returns(false)
    end

    context 'invalid token' do
      it 'return success' 

    end

    context 'valid token' do
      context 'welcome message' do
        it 'enqueues a welcome message if the user object indicates so' 


        it "doesn't enqueue the welcome message if the object returns false" 

      end

      context "honeypot" do
        it "raises an error if the honeypot is invalid" 

      end

      context 'response' do
        before do
          Guardian.any_instance.expects(:can_access_forum?).returns(true)
          EmailToken.expects(:confirm).with("#{token}").returns(user)
        end

        it 'correctly logs on user' 

      end

      context 'user is not approved' do
        before do
          SiteSetting.must_approve_users = true
          EmailToken.expects(:confirm).with("#{token}").returns(user)
          put "/u/activate-account/#{token}"
        end

        it 'should return the right response' 

      end
    end

    context 'when cookies contains a destination URL' do
      it 'should redirect to the URL' 

    end
  end

  describe '#password_reset' do
    let(:user) { Fabricate(:user) }
    let(:token) { SecureRandom.hex }

    context "you can view it even if login is required" do
      it "returns success" 

    end

    context 'missing token' do
      before do
        get "/u/password-reset/#{token}"
      end

      it 'disallows login' 

    end

    context 'invalid token' do
      it 'disallows login' 


      it "responds with proper error message" 

    end

    context 'valid token' do
      context 'when rendered' do
        it 'renders referrer never on get requests' 

      end

      it 'returns success' 


      it 'disallows double password reset' 


      it "doesn't redirect to wizard on get" 


      it "redirects to the wizard if you're the first admin" 


      it "doesn't invalidate the token when loading the page" 


      context "rate limiting" do

        before { RateLimiter.clear_all!; RateLimiter.enable }
        after  { RateLimiter.disable }

        it "rate limits reset passwords" 


      end

      context '2 factor authentication required' do
        let!(:second_factor) { Fabricate(:user_second_factor_totp, user: user) }

        it 'does not change with an invalid token' 


        it 'changes password with valid 2-factor tokens' 

      end
    end

    context 'submit change' do
      let(:token) { EmailToken.generate_token }

      before do
        EmailToken.expects(:confirm).with(token).returns(user)
      end

      it "fails when the password is blank" 


      it "fails when the password is too long" 


      it "logs in the user" 


      it "doesn't log in the user when not approved" 

    end
  end

  describe '#confirm_email_token' do
    let(:user) { Fabricate(:user) }

    it "token doesn't match any records" 


    it "token matches" 

  end

  describe '#admin_login' do
    let(:admin) { Fabricate(:admin) }
    let(:user) { Fabricate(:user) }

    context 'enqueues mail' do
      it 'enqueues mail with admin email and sso enabled' 

    end

    context 'when email is incorrect' do
      it 'should return the right response' 

    end

    context 'logs in admin' do
      it 'does not log in admin with invalid token' 


      context 'valid token' do
        it 'does log in admin with SSO disabled' 


        it 'logs in admin with SSO enabled' 

      end

      describe 'when 2 factor authentication is enabled' do
        let(:second_factor) { Fabricate(:user_second_factor_totp, user: admin) }
        let(:email_token) { Fabricate(:email_token, user: admin) }

        it 'does not log in when token required' 


        describe 'invalid 2 factor token' do
          it 'should display the right error' 

        end

        it 'logs in when a valid 2-factor token is given' 

      end
    end
  end

  describe '#toggle_anon' do
    it 'allows you to toggle anon if enabled' 

  end

  describe '#create' do
    def honeypot_magic(params)
      get '/u/hp.json'
      json = JSON.parse(response.body)
      params[:password_confirmation] = json["value"]
      params[:challenge] = json["challenge"].reverse
      params
    end

    before do
      UsersController.any_instance.stubs(:honeypot_value).returns(nil)
      UsersController.any_instance.stubs(:challenge_value).returns(nil)
      SiteSetting.allow_new_registrations = true
      @user = Fabricate.build(:user, password: "strongpassword")
    end

    let(:post_user_params) do
      { name: @user.name,
        username: @user.username,
        password: "strongpassword",
        email: @user.email }
    end

    def post_user
      post "/u.json", params: post_user_params
    end

    context 'when email params is missing' do
      it 'should raise the right error' 

    end

    context 'when creating a user' do
      it 'sets the user locale to I18n.locale' 

    end

    context 'when creating a non active user (unconfirmed email)' do
      it 'returns 403 forbidden when local logins are disabled' 


      it 'returns an error when new registrations are disabled' 


      it 'creates a user correctly' 


      context "`must approve users` site setting is enabled" do
        before { SiteSetting.must_approve_users = true }

        it 'creates a user correctly' 

      end

      context 'users already exists with given email' do
        let!(:existing) { Fabricate(:user, email: post_user_params[:email]) }

        it 'returns an error if hide_email_address_taken is disabled' 


        it 'returns success if hide_email_address_taken is enabled' 

      end
    end

    context "creating as active" do
      it "won't create the user as active" 


      context "with a regular api key" do
        let(:user) { Fabricate(:user) }
        let(:api_key) { Fabricate(:api_key, user: user) }

        it "won't create the user as active with a regular key" 

      end

      context "with an admin api key" do
        let(:admin) { Fabricate(:admin) }
        let(:api_key) { Fabricate(:api_key, user: admin) }

        it "creates the user as active with a regular key" 


        it "won't create the developer as active" 

      end
    end

    context "creating as staged" do
      it "won't create the user as staged" 


      context "with a regular api key" do
        let(:user) { Fabricate(:user) }
        let(:api_key) { Fabricate(:api_key, user: user) }

        it "won't create the user as staged with a regular key" 

      end

      context "with an admin api key" do
        let(:user) { Fabricate(:admin) }
        let(:api_key) { Fabricate(:api_key, user: user) }

        it "creates the user as staged with a regular key" 


        it "won't create the developer as staged" 

      end
    end

    context 'when creating an active user (confirmed email)' do
      before { User.any_instance.stubs(:active?).returns(true) }

      it 'enqueues a welcome email' 


      it "shows the 'active' message" 


      it "should be logged in" 


      it 'indicates the user is active in the response' 


      it 'doesn\'t succeed when new registrations are disabled' 


      context 'authentication records for' do
        let(:user) { Fabricate(:user) }

        before do
          OmniAuth.config.test_mode = true

          OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(
            provider: 'twitter',
            uid: '123545',
            info: OmniAuth::AuthHash::InfoHash.new(
              email: "osama@mail.com",
              nickname: "testosama"
            )
          )

          Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
          SiteSetting.enable_twitter_logins = true
          get "/auth/twitter/callback.json"
        end

        after do
          Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter] = nil
          OmniAuth.config.test_mode = false
        end

        it 'should create twitter user info if required' 


        it "returns an error when email has been changed from the validated email address" 


        it "will create the user successfully if email validation is required" 

      end
    end

    it "creates user successfully but doesn't activate the account" 


    shared_examples 'honeypot fails' do
      it 'should not create a new user' 


      it 'should not send an email' 


      it 'should say it was successful' 

    end

    context 'when honeypot value is wrong' do
      before do
        UsersController.any_instance.stubs(:honeypot_value).returns('abc')
      end
      let(:create_params) { { name: @user.name, username: @user.username, password: "strongpassword", email: @user.email, password_confirmation: 'wrong' } }
      include_examples 'honeypot fails'
    end

    context 'when challenge answer is wrong' do
      before do
        UsersController.any_instance.stubs(:challenge_value).returns('abc')
      end
      let(:create_params) { { name: @user.name, username: @user.username, password: "strongpassword", email: @user.email, challenge: 'abc' } }
      include_examples 'honeypot fails'
    end

    context "when 'invite only' setting is enabled" do
      before { SiteSetting.invite_only = true }

      let(:create_params) { {
        name: @user.name,
        username: @user.username,
        password: 'strongpassword',
        email: @user.email
      }}

      include_examples 'honeypot fails'
    end

    shared_examples 'failed signup' do
      it 'should not create a new User' 


      it 'should report failed' 

    end

    context 'when password is blank' do
      let(:create_params) { { name: @user.name, username: @user.username, password: "", email: @user.email } }
      include_examples 'failed signup'
    end

    context 'when password is too long' do
      let(:create_params) { { name: @user.name, username: @user.username, password: "x" * (User.max_password_length + 1), email: @user.email } }
      include_examples 'failed signup'
    end

    context 'when password param is missing' do
      let(:create_params) { { name: @user.name, username: @user.username, email: @user.email } }
      include_examples 'failed signup'
    end

    context 'with a reserved username' do
      let(:create_params) { { name: @user.name, username: 'Reserved', email: @user.email, password: "x" * 20 } }
      before { SiteSetting.reserved_usernames = 'a|reserved|b' }
      include_examples 'failed signup'
    end

    context 'when an Exception is raised' do
      before { User.any_instance.stubs(:save).raises(ActiveRecord::StatementInvalid.new('Oh no')) }

      let(:create_params) {
        { name: @user.name, username: @user.username,
          password: "strongpassword", email: @user.email }
      }

      include_examples 'failed signup'
    end

    context "with custom fields" do
      let!(:user_field) { Fabricate(:user_field) }
      let!(:another_field) { Fabricate(:user_field) }
      let!(:optional_field) { Fabricate(:user_field, required: false) }

      context "without a value for the fields" do
        let(:create_params) { { name: @user.name, password: 'watwatwat', username: @user.username, email: @user.email } }
        include_examples 'failed signup'
      end

      context "with values for the fields" do
        let(:create_params) { {
          name: @user.name,
          password: 'suChS3cuRi7y',
          username: @user.username,
          email: @user.email,
          user_fields: {
            user_field.id.to_s => 'value1',
            another_field.id.to_s => 'value2',
          }
        } }

        it "should succeed without the optional field" 


        it "should succeed with the optional field" 


        it "trims excessively long fields" 

      end
    end

    context "with only optional custom fields" do
      let!(:user_field) { Fabricate(:user_field, required: false) }

      context "without values for the fields" do
        let(:create_params) { {
          name: @user.name,
          password: 'suChS3cuRi7y',
          username: @user.username,
          email: @user.email,
        } }

        it "should succeed" 

      end
    end

    context "when taking over a staged account" do
      before do
        UsersController.any_instance.stubs(:honeypot_value).returns("abc")
        UsersController.any_instance.stubs(:challenge_value).returns("efg")
      end

      let!(:staged) { Fabricate(:staged, email: "staged@account.com", active: true) }

      it "succeeds" 

    end
  end

  describe '#username' do
    it 'raises an error when not logged in' 


    context 'while logged in' do
      let(:old_username) { "OrigUsrname" }
      let(:new_username) { "#{old_username}1234" }
      let(:user) { Fabricate(:user, username: old_username) }

      before do
        user.username = old_username
        sign_in(user)
      end

      it 'raises an error without a new_username param' 


      it 'raises an error when you don\'t have permission to change the username' 


      it 'raises an error when change_username fails' 


      it 'should succeed in normal circumstances' 


      it 'should fail if the user is old' 


      it 'should create a staff action log when a staff member changes the username' 


      it 'should return a JSON response with the updated username' 

    end
  end

  describe '#check_username' do
    it 'raises an error without any parameters' 


    shared_examples 'when username is unavailable' do
      it 'should return available as false in the JSON and return a suggested username' 

    end

    shared_examples 'when username is available' do
      it 'should return available in the JSON' 

    end

    it 'returns nothing when given an email param but no username' 


    context 'username is available' do
      before do
        get "/u/check_username.json", params: { username: 'BruceWayne' }
      end
      include_examples 'when username is available'
    end

    context 'username is unavailable' do
      let!(:user) { Fabricate(:user) }
      before do
        get "/u/check_username.json", params: { username: user.username }
      end
      include_examples 'when username is unavailable'
    end

    shared_examples 'checking an invalid username' do
      it 'should not return an available key but should return an error message' 

    end

    context 'has invalid characters' do
      before do
        get "/u/check_username.json", params: { username: 'bad username' }
      end
      include_examples 'checking an invalid username'

      it 'should return the invalid characters message' 

    end

    context 'is too long' do
      before do
        get "/u/check_username.json", params: { username: generate_username(User.username_length.last + 1) }
      end
      include_examples 'checking an invalid username'

      it 'should return the "too long" message' 

    end

    describe 'different case of existing username' do
      context "it's my username" do
        let!(:user) { Fabricate(:user, username: 'hansolo') }
        before do
          sign_in(user)

          get "/u/check_username.json", params: { username: 'HanSolo' }
        end
        include_examples 'when username is available'
      end

      context "it's someone else's username" do
        let!(:user) { Fabricate(:user, username: 'hansolo') }
        before do
          sign_in(Fabricate(:user))

          get "/u/check_username.json", params: { username: 'HanSolo' }
        end
        include_examples 'when username is unavailable'
      end

      context "an admin changing it for someone else" do
        let!(:user) { Fabricate(:user, username: 'hansolo') }
        before do
          sign_in(Fabricate(:admin))

          get "/u/check_username.json", params: { username: 'HanSolo', for_user_id: user.id }
        end
        include_examples 'when username is available'
      end
    end
  end

  describe '#invited' do
    it 'returns success' 


    it 'filters by email' 


    it 'filters by username' 


    context 'with guest' do
      context 'with pending invites' do
        it 'does not return invites' 

      end

      context 'with redeemed invites' do
        it 'returns invites' 

      end
    end

    context 'with authenticated user' do
      context 'with pending invites' do
        context 'with permission to see pending invites' do
          it 'returns invites' 

        end

        context 'without permission to see pending invites' do
          it 'does not return invites' 

        end
      end

      context 'with redeemed invites' do
        it 'returns invites' 

      end
    end
  end

  describe '#update' do
    context 'with guest' do
      it 'raises an error' 

    end

    context "when username contains a period" do
      before do
        sign_in(user)
      end
      let(:user) { Fabricate(:user) }

      it "should be able to update a user" 


      it "should be able to update a user" 

    end

    context "as a staff user" do
      context "uneditable field" do
        let!(:user_field) { Fabricate(:user_field, editable: false) }

        it "allows staff to edit the field" 

      end
    end

    context 'with authenticated user' do
      context 'with permission to update' do
        let!(:user) { sign_in(Fabricate(:user)) }

        it 'allows the update' 


        context 'a locale is chosen that differs from I18n.locale' do
          it "updates the user's locale" 

        end

        context "with user fields" do
          context "an editable field" do
            let!(:user_field) { Fabricate(:user_field) }
            let!(:optional_field) { Fabricate(:user_field, required: false) }

            it "should update the user field" 


            it "cannot be updated to blank" 


            it "trims excessively large fields" 


            it "should retain existing user fields" 

          end

          context "uneditable field" do
            let!(:user_field) { Fabricate(:user_field, editable: false) }

            it "does not update the user field" 

          end

          context "custom_field" do
            before do
              plugin = Plugin::Instance.new
              plugin.register_editable_user_custom_field :test2
            end

            after do
              User.plugin_editable_user_custom_fields.clear
            end

            it "only updates allowed user fields" 


            it "works alongside a user field" 


            it "is secure when there are no registered editable fields" 


          end
        end

        it 'returns user JSON' 

      end

      context 'without permission to update' do
        it 'does not allow the update' 

      end
    end
  end

  describe '#badge_title' do
    let(:user) { Fabricate(:user) }
    let(:badge) { Fabricate(:badge) }
    let(:user_badge) { BadgeGranter.grant(badge, user) }

    it "sets the user's title to the badge name if it is titleable" 


    context "with overrided name" do
      let(:badge) { Fabricate(:badge, name: 'Demogorgon', allow_title: true) }
      let(:user_badge) { BadgeGranter.grant(badge, user) }

      before do
        TranslationOverride.upsert!('en', 'badges.demogorgon.name', 'Boss')
      end

      after do
        TranslationOverride.revert!('en', ['badges.demogorgon.name'])
      end

      it "uses the badge display name as user title" 

    end
  end

  describe '#send_activation_email' do
    before do
      UsersController.any_instance.stubs(:honeypot_value).returns(nil)
      UsersController.any_instance.stubs(:challenge_value).returns(nil)
    end

    let(:post_user) do
      post "/u.json", params: {
        username: "osamatest",
        password: "strongpassword",
        email: "dsdsds@sasa.com"
      }

      User.find_by(username: "osamatest")
    end

    context 'for an existing user' do
      context 'for an activated account with email confirmed' do
        it 'fails' 

      end

      context 'for an activated account with unconfirmed email' do
        it 'should send an email' 

      end

      context "approval is enabled" do
        before do
          SiteSetting.must_approve_users = true
        end

        it "should raise an error" 

      end

      describe 'when user does not have a valid session' do
        it 'should not be valid' 


        it 'should allow staff regardless' 

      end

      context 'with a valid email_token' do
        it 'should send the activation email' 

      end

      context 'without an existing email_token' do
        let(:user) { post_user }
        before do
          user.email_tokens.each { |t| t.destroy }
          user.reload
        end

        it 'should generate a new token' 


        it 'should send an email' 

      end
    end

    context 'when username does not exist' do
      it 'should not send an email' 

    end
  end

  describe '#pick_avatar' do
    it 'raises an error when not logged in' 


    context 'while logged in' do
      before do
        sign_in(user)
      end

      let(:upload) do
        Fabricate(:upload, user: user)
      end

      it "raises an error when you don't have permission to toggle the avatar" 


      it "raises an error when sso_overrides_avatar is disabled" 


      it "raises an error when selecting the custom/uploaded avatar and allow_uploaded_avatars is disabled" 


      it 'can successfully pick the system avatar' 


      it 'can successfully pick a gravatar' 


      it 'can not pick uploads that were not created by user' 


      it 'can successfully pick a custom avatar' 

    end
  end

  describe '#select_avatar' do
    it 'raises an error when not logged in' 


    context 'while logged in' do

      let!(:user) { sign_in(Fabricate(:user)) }
      let(:avatar1) { Fabricate(:upload) }
      let(:avatar2) { Fabricate(:upload) }
      let(:url) { "https://www.discourse.org" }

      it 'raises an error when url is blank' 


      it 'raises an error when selectable avatars is disabled' 


      context 'selectable avatars is enabled' do

        before { SiteSetting.selectable_avatars_enabled = true }

        it 'raises an error when selectable avatars is empty' 


        context 'selectable avatars is properly setup' do

          before do
            SiteSetting.selectable_avatars = [avatar1.url, avatar2.url].join("\n")
          end

          it 'raises an error when url is not in selectable avatars list' 


          it 'can successfully select an avatar' 

        end
      end
    end
  end

  describe '#destroy_user_image' do

    it 'raises an error when not logged in' 


    context 'while logged in' do
      let(:another_user) { Fabricate(:user) }
      let(:user) { Fabricate(:user) }
      before do
        sign_in(user)
      end

      it 'raises an error when you don\'t have permission to clear the profile background' 


      it "requires the `type` param" 


      it "only allows certain `types`" 


      it 'can clear the profile background' 

    end
  end

  describe '#destroy' do
    it 'raises an error when not logged in' 


    context 'while logged in' do
      let(:user) { Fabricate(:user) }
      let(:another_user) { Fabricate(:user) }
      before do
        sign_in(user)
      end

      it 'raises an error when you cannot delete your account' 


      it "raises an error when you try to delete someone else's account" 


      it "deletes your account when you're allowed to" 

    end
  end

  describe '#my_redirect' do
    it "redirects if the user is not logged in" 


    context "when the user is logged in" do
      let!(:user) { sign_in(Fabricate(:user)) }

      it "will not redirect to an invalid path" 


      it "will redirect to an valid path" 


      it "permits forward slashes" 

    end
  end

  describe '#check_emails' do
    it 'raises an error when not logged in' 


    context 'while logged in' do
      let(:sign_in_admin) { sign_in(Fabricate(:admin)) }

      it "raises an error when you aren't allowed to check emails" 


      it "returns emails and associated_accounts when you're allowed to see them" 


      it "works on inactive users" 

    end
  end

  describe '#is_local_username' do
    let(:user) { Fabricate(:user) }
    let(:group) { Fabricate(:group, name: "Discourse") }
    let(:topic) { Fabricate(:topic) }
    let(:allowed_user) { Fabricate(:user) }
    let(:private_topic) { Fabricate(:private_message_topic, user: allowed_user) }

    it "finds the user" 


    it "finds the group" 


    it "supports multiples usernames" 


    it "never includes staged accounts" 


    it "returns user who cannot see topic" 


    it "never returns a user who can see the topic" 


    it "returns user who cannot see a private topic" 


    it "never returns a user who can see the topic" 

  end

  describe '#topic_tracking_state' do
    let(:user) { Fabricate(:user) }

    context 'anon' do
      it "raises an error on anon for topic_tracking_state" 

    end

    context 'logged on' do
      it "detects new topic" 

    end
  end

  describe '#summary' do
    it "generates summary info" 


    it "returns 404 for a hidden profile" 

  end

  describe '#confirm_admin' do
    it "fails without a valid token" 


    it "fails with a missing token" 


    it "succeeds with a valid code as anonymous" 


    it "succeeds with a valid code when logged in as that user" 


    it "fails if you're logged in as a different account" 


    describe "post" do
      it "gives the user admin access when POSTed" 

    end
  end

  describe '#update_activation_email' do
    before do
      UsersController.any_instance.stubs(:honeypot_value).returns(nil)
      UsersController.any_instance.stubs(:challenge_value).returns(nil)
    end

    let(:post_user) do
      post "/u.json", params: {
        username: "osamatest",
        password: "strongpassword",
        email: "osama@example.com"
      }
      user = User.where(username: "osamatest").first
      user.active = false
      user.save!
      user
    end

    context "with a session variable" do
      it "raises an error with an invalid session value" 


      it "raises an error for an active user" 


      it "raises an error when logged in" 


      it "raises an error when the new email is taken" 


      it "raises an error when the email is blacklisted" 


      it "can be updated" 

    end

    context "with a username and password" do
      it "raises an error with an invalid username" 


      it "raises an error with an invalid password" 


      it "raises an error for an active user" 


      it "raises an error when logged in" 


      it "raises an error when the new email is taken" 


      it "can be updated" 

    end
  end

  describe '#show' do
    context "anon" do
      let(:user) { Discourse.system_user }
      let(:other_user) { Fabricate(:user) }

      it "returns success" 


      it "returns a hidden profile" 


      it "should redirect to login page for anonymous user when profiles are hidden" 


      describe "user profile views" do
        let(:other_user) { Fabricate(:user) }

        it "should track a user profile view for an anon user" 


        it "skips tracking" 

      end
    end

    context "logged in" do
      before do
        sign_in(user)
      end

      let(:user) { Fabricate(:user) }

      it 'returns success' 


      it "returns not found when the username doesn't exist" 


      it 'returns not found when the user is inactive' 


      it 'returns success when show_inactive_accounts is true and user is logged in' 


      it "raises an error on invalid access" 


      describe "user profile views" do
        let(:other_user) { Fabricate(:user) }

        it "should track a user profile view for a signed in user" 


        it "should not track a user profile view for a user viewing his own profile" 


        it "skips tracking" 

      end

      context "fetching a user by external_id" do
        before { user.create_single_sign_on_record(external_id: '997', last_payload: '') }

        it "returns fetch for a matching external_id" 


        it "returns not found when external_id doesn't match" 

      end

      describe "include_post_count_for" do

        let(:admin) { Fabricate(:admin) }
        let(:topic) { Fabricate(:topic) }

        before do
          Fabricate(:post, user: user, topic: topic)
          Fabricate(:post, user: admin, topic: topic)
          Fabricate(:post, user: admin, topic: topic, post_type: Post.types[:whisper])
        end

        it "includes only visible posts" 


        it "includes all post types for staff members" 

      end
    end

    it "should be able to view a user" 


    describe 'when username contains a period' do
      before do
        user.update!(username: 'test.test')
      end

      it "should be able to view a user" 

    end
  end

  describe '#badges' do
    it "renders fine by default" 


    it "fails if badges are disabled" 

  end

  describe "#account_created" do
    it "returns a message when no session is present" 


    it "redirects when the user is logged in" 


    context 'when cookies contains a destination URL' do
      it 'should redirect to the URL' 

    end

    context "when the user account is created" do
      include ApplicationHelper

      it "returns the message when set in the session" 

    end
  end

  describe '#search_users' do
    let(:topic) { Fabricate :topic }
    let(:user)  { Fabricate :user, username: "joecabot", name: "Lawrence Tierney" }
    let(:post1) { Fabricate(:post, user: user, topic: topic) }

    before do
      SearchIndexer.enable
      post1
    end

    it "searches when provided the term only" 


    it "searches when provided the topic only" 


    it "searches when provided the term and topic" 


    it "searches only for users who have access to private topic" 


    context "when `enable_names` is true" do
      before do
        SiteSetting.enable_names = true
      end

      it "returns names" 

    end

    context "when `enable_names` is false" do
      before do
        SiteSetting.enable_names = false
      end

      it "returns names" 

    end

    context 'groups' do
      let!(:mentionable_group) do
        Fabricate(:group,
          mentionable_level: 99,
          messageable_level: 0,
          visibility_level: 0
        )
      end

      let!(:mentionable_group_2) do
        Fabricate(:group,
          mentionable_level: 99,
          messageable_level: 0,
          visibility_level: 1
        )
      end

      let!(:messageable_group) do
        Fabricate(:group,
          mentionable_level: 0,
          messageable_level: 99
        )
      end

      describe 'when signed in' do
        before do
          sign_in(user)
        end

        it "only returns visible groups" 


        it "doesn't search for groups" 


        it "searches for messageable groups" 


        it 'searches for mentionable groups' 

      end

      describe 'when not signed in' do
        it 'should not include mentionable/messageable groups' 

      end
    end
  end

  describe '#user_preferences_redirect' do
    it 'requires the user to be logged in' 


    it "redirects to their profile when logged in" 

  end

  describe '#email_login' do
    before do
      SiteSetting.enable_local_logins_via_email = true
    end

    it "enqueues the right email" 


    describe 'when enable_local_logins_via_email is disabled' do
      before do
        SiteSetting.enable_local_logins_via_email = false
      end

      it 'should return the right response' 

    end

    describe 'when username or email is not valid' do
      it 'should not enqueue the email to login' 

    end

    describe 'when hide_email_address_taken is true' do
      it 'should return the right response' 

    end

    describe "when user is already logged in" do
      it 'should redirect to the root path' 

    end
  end

  describe '#create_second_factor' do
    context 'when not logged in' do
      it 'should return the right response' 

    end

    context 'when logged in' do
      before do
        sign_in(user)
      end

      describe 'create 2fa request' do
        it 'fails on incorrect password' 


        describe 'when local logins are disabled' do
          it 'should return the right response' 

        end

        describe 'when SSO is enabled' do
          it 'should return the right response' 

        end

        it 'succeeds on correct password' 

      end
    end
  end

  describe '#update_second_factor' do
    let(:user_second_factor) { Fabricate(:user_second_factor_totp, user: user) }

    context 'when not logged in' do
      it 'should return the right response' 

    end

    context 'when logged in' do
      before do
        sign_in(user)
        user_second_factor
      end

      context 'when user has totp setup' do
        context 'when token is missing' do
          it 'returns the right response' 

        end

        context 'when token is invalid' do
          it 'returns the right response' 

        end

        context 'when token is valid' do
          it 'should allow second factor for the user to be enabled' 


          it 'should allow second factor for the user to be disabled' 

        end
      end

      context "when user is updating backup codes" do
        context 'when token is missing' do
          it 'returns the right response' 

        end

        context 'when token is invalid' do
          it 'returns the right response' 

        end

        context 'when token is valid' do
          it 'should allow second factor backup for the user to be disabled' 

        end
      end
    end
  end

  describe '#create_second_factor_backup' do
    let(:user_second_factor) { Fabricate(:user_second_factor_totp, user: user) }

    context 'when not logged in' do
      it 'should return the right response' 

    end

    context 'when logged in' do
      before do
        sign_in(user)
      end

      describe 'create 2fa request' do
        it 'fails on incorrect password' 


        describe 'when local logins are disabled' do
          it 'should return the right response' 

        end

        describe 'when SSO is enabled' do
          it 'should return the right response' 

        end

        it 'succeeds on correct password' 

      end
    end
  end

  describe '#revoke_account' do
    let(:other_user) { Fabricate(:user) }
    it 'errors for unauthorised users' 


    context 'while logged in' do
      before do
        sign_in(user)
      end

      it 'returns an error when there is no matching account' 


      context "with fake provider" do
        let(:authenticator) do
          Class.new(Auth::Authenticator) do
            attr_accessor :can_revoke
            def name
              "testprovider"
            end

            def enabled?
              true
            end

            def description_for_user(user)
              "an account"
            end

            def can_revoke?
              can_revoke
            end

            def revoke(user, skip_remote: false)
              true
            end
          end.new
        end

        before do
          DiscoursePluginRegistry.register_auth_provider(Auth::AuthProvider.new(authenticator: authenticator))
        end

        after do
          DiscoursePluginRegistry.reset!
        end

        it 'returns an error when revoking is not allowed' 


        it 'works' 

      end

    end

  end

  describe '#revoke_auth_token' do

    context 'while logged in' do
      before do
        2.times { sign_in(user) }
      end

      it 'logs user out' 


      it 'does not let user log out of current session' 


      it 'logs user out from everywhere if token_id is not present' 


    end

  end
end

