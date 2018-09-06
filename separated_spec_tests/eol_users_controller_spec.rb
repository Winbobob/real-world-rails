require "spec_helper"

describe UsersController do

  before(:all) do
    unless @user = User.find_by_username('users_controller_spec')
      truncate_all_tables
      Language.create_english
      SpecialCollection.gen(:name => 'Watch')
      CuratorLevel.create_enumerated
      UserIdentity.create_enumerated
      Activity.create_enumerated
      @user = User.gen(:username => 'users_controller_spec')
      cot = ChangeableObjectType.gen(:ch_object_type => 'synonym')
    end
  end

  describe 'GET new' do
    it 'should render new unless logged in' 


    context 'extended for open authentication' do
      it 'should redirect to authorize uri when log in is with Facebook' 

      it 'should redirect to authorize uri when log in is with Google' 

      it 'should redirect to authorize uri when log in is with Twitter' 

      it 'should redirect to authorize uri when log in is with Yahoo' 


      it 'should clear session data when user cancels sign up at confirmation page' 


      it 'should render confirmation page when user signs up with Facebook' 


      it 'should redirect to new user URL and flash error if user denies access during Twitter sign up' 


      it 'should redirect to new user URL and flash error if user denies access during Facebook sign up' 


      it 'should redirect to new user URL and flash error if user denies access during Google sign up' 


    end
  end

  describe 'POST create' do
    context 'extended for open authentication' do
      it 'should create a new EOL account connected to a Facebook account, send welcome email and log in user'
      it 'should create a new EOL account connected to a Google account, send welcome email and log in user'
      it 'should create a new EOL account connected to a Twitter account, send welcome email and log in user'
      it 'should create a new EOL account connected to a Yahoo! account, send welcome email and log in user'
      it 'should not create an EOL account is third-party account is already connected to an EOL user'
    end

    it 'should create a new EOL user and send verification email if registration is valid'
    it 'should not create a new user if registration is invalid'
  end

  describe 'GET show' do
    it 'should render show' 

  end

  describe 'GET edit' do
    it 'should raise error if edit before log in' 

    it 'should raise security violation if edit wrong user' 

    it 'should render edit properly if editing self' 

  end

  describe 'PUT update' do

    it 'should raise error if not logged in' 

    it 'should update and render show if updating self' 


    it 'should render edit on validation errors' 


    it 'should ignore entered passwords when password confirmation is blank and entered password is same as existing password' do # i.e. passwords auto filled by browser
      user = User.gen(:password => 'secret')
      hashed_password = user.hashed_password
      username = user.username
      bio = user.bio
      put :update, { :id => user.id, :user => { :id => user.id, :entered_password => 'secret',
                                                :entered_password_confirmation => '',
                                                :username => 'myusername', :bio => 'My bio' } },
                   { :user => user, :user_id => user.id }
      user = User.find(user)
      user.hashed_password.should == hashed_password
      user.username.should_not == username
      user.username.should == 'myusername'
      user.bio.should_not == bio
      user.bio.should == 'My bio'
    end

    it 'should render curation privileges on validation errors for curator application' 


    it 'should allow instant approval for assistant curators without requirements' 

  end

  describe 'GET curation_privileges' do
    it 'should raise error when not logged in' 

    it 'should render curation privileges only if applying for self' 

    it 'should render curation privileges properly' 

  end

  describe 'GET verify' do
    it 'should not activate already active user' 

    it 'should activate inactive user with valid verification code' 

    it 'should not activate user with invalid verification code' 

    it 'should ignore validation errors on user model' 

  end

  describe 'GET pending' do
    it 'should render pending' 

  end

  describe 'GET activated' do
    it 'should render activated' 

    it 'should know whether its a valid conversion for tracking' 

  end

  describe 'GET terms_agreement' do

    before(:each) do
      @disagreeable_user = User.gen
      @disagreeable_user.update_column(:agreed_with_terms, 0)
    end

    it 'should render terms agreement' 


    it 'should force users to agree to terms before viewing other pages' 


    it 'should not allow users to render terms for another user' 

  end

  describe 'POST terms_agreement' do
    before(:each) do
      @disagreeable_user = User.gen
      @disagreeable_user.update_column(:agreed_with_terms, 0)
    end
    it 'should allow the current user to agree to terms' 


    it 'should not allow users to agree to terms for another user' 

  end

  describe 'GET recover account' do
    it 'should render recover account unless logged in' 

  end

  describe 'POST recover account' do
    before :all do
      unless @recover_user = User.find_by_username('recover_account_spec')
        @recover_user = User.gen(:username => 'recover_account_spec', :email => 'unique@address.com')
      end
    end

    it "should find user by email or flash error if it can't find user by email" 

    it 'should raise exception if user is hidden' 

    it 'should give user a new recover account token and send recover account email' 

    it 'should render choose account first if multiple accounts found' 

    it 'should ignore validation errors on user model' 


  end

  describe 'GET temporary_login' do
    it 'should log in users with valid token' 

    it 'should not log in users with invalid token' 

    it 'should not log in users with expired token' 

    it 'should not log in hidden users' 

  end

  describe 'GET verify_open_authentication' do
    it 'should redirect to new open authentication if user is logged' 

  end
  
  describe 'GET unsubscribe_notifications' do
    before(:each) do
      @user1 = User.gen(:email => 'test1@example.com', :disable_email_notifications => false)
      @user2 = User.gen(:email => 'test1@example.com', :disable_email_notifications => false)
      @user3 = User.gen(:email => 'test1@example.com', :disable_email_notifications => false)
      @user4 = User.gen(:email => 'test2@example.com', :disable_email_notifications => false)
      @user_already_gone = User.gen(:email => 'test3@example.com', :disable_email_notifications => true)
    end
    it 'should allow users to unsubscribe to notifications' 

    it 'should show users they are already unsubscribed to notifications if they are already unsubscribed' 

    it 'should show access_denied if the key provided while unsubscribing to notifications is not valid' 

  end
  
  describe 'GET unsubscribe_notifications' do
    before(:all) do
      @user1 = User.gen(:email => 'test1@example.com', :disable_email_notifications => false)
      @user2 = User.gen(:email => 'test1@example.com', :disable_email_notifications => false)
      @user3 = User.gen(:email => 'test1@example.com', :disable_email_notifications => false)
      @user4 = User.gen(:email => 'test2@example.com', :disable_email_notifications => false)
      @user_already_gone = User.gen(:email => 'test3@example.com', :disable_email_notifications => true)
    end
    it 'should allow users to unsubscribe to notifications' 

    it 'should show users they are already unsubscribed to notifications if they are already unsubscribed' 

    it 'should show access_denied if the key provided while unsubscribing to notifications is not valid' 

  end
end

