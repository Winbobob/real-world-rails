require "spec_helper"

describe SessionsController do

  before(:all) do
    unless (@user = User.find_by_username('session_controller_spec')) &&
           (@connected_user = User.find_by_username('oauth_session_controller_spec'))
      truncate_all_tables
      Language.create_english
      CuratorLevel.create_enumerated
      @user = User.gen(:username => 'session_controller_spec', :password => 'password')
      @connected_user = User.gen(:username => 'oauth_session_controller_spec')
      @connected_user.open_authentications_attributes = [{ :provider => 'facebook',
                                                           :guid => 'facebookuserguid' },
                                                         { :provider => 'google',
                                                           :guid => 'googleuserguid' },
                                                         { :provider => 'twitter',
                                                           :guid => 'twitteruserguid' },
                                                         { :provider => 'yahoo',
                                                           :guid => 'yahoouserguid' }]
      @connected_user.save
    end
  end

  describe "GET new" do

    it 'should be successful' 

    it 'should redirect to user show if user is logged in' 


    context 'extended for open authentication' do
      it 'should clear obsolete session data from different provider' 

      it 'should redirect to authorize uri before log in with Facebook' 

      it 'should redirect to authorize uri before log in with Google' 

      it 'should redirect to authorize uri before log in with Twitter' 

      it 'should redirect to authorize uri before log with Yahoo' 

      it 'should redirect and flash error if user denies access when logging in with Twitter' 

      it 'should redirect and flash error if user denies access when logging in with Facebook' 

      it 'should redirect and flash error if user denies access when logging in with Google' 

      it 'should prevent log in, render new and flash error if oauth account is not connected to an EOL user' 
     it 'should log in user with Facebook' 
      it 'should log in user with Google' 

      it 'should log in user with Twitter' 

      it 'should log in user with Yahoo' 


      it 'should redirect user to return to url after log in' 


    end
  end

  describe "POST create" do
    it "should render new with flash error if EOL credentials are invalid" 


    it 'should log in and redirect to user newsfeed if EOL credentials are valid' 


    it 'should redirect user to return_to url after log in' 


  end

end



