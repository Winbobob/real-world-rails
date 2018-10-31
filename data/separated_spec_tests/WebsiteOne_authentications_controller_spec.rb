require 'spec_helper'

describe AuthenticationsController do

  before(:each) do
    OmniAuth.config.mock_auth['agileventures'] = {
        'provider' => 'agileventures',
        'uid' => '12345678',
        'info' => {'email' => 'foo@agileventures.org'}
    }
    @provider = 'agileventures'
    @path = '/some/path'
    request.env['omniauth.origin'] = @path
  end

  it 'should render a failure message on unsuccessful authentication' 


  context 'destroying authentications' do
    before(:each) do
      @user = double(User, id: 1, friendly_id: 'my-id', encrypted_password: 'i-am-encrypted')
      request.env['warden'].stub :authenticate! => @user
      controller.stub :current_user => @user

      @auth = double(Authentication)
      @auths = [@auth]
      expect(@user).to receive(:authentications).at_least(1).and_return @auths
      expect(@auths).to receive(:find).and_return @auth
      @auth.stub(destroy: true)
    end

    it 'should require authentication' 


    it 'should be removable for users with a password' 


    it 'should not be allowed for users without any other means of authentication' 

  end

  before(:each) do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[@provider]
    request.env['omniauth.params'] = {}
  end

  context 'for not signed in users' do

    before(:each) do
      @user = double(User)
      @user.stub(:apply_omniauth)
    end

    it 'should sign in the correct user for existing profiles' 


    context 'for new profiles' do
      before(:each) do
        expect(Authentication).to receive(:find_by_provider_and_uid).and_return nil
        expect(User).to receive(:new).and_return(@user)
      end

      it 'should create a new user for non-existing profiles' 


      it 'should redirect to the new user form if there is an error' 

    end
    
    context 'for deactivated users' do
      before(:each) do
        expect(Authentication).to receive(:find_by_provider_and_uid).and_return nil
        expect(controller).to receive(:deactivated_user_with_email).with('foo@agileventures.org').and_return(@user)
      end
      
      it 'should redirect to root path with deactivated user alert message' 

    end
  end

  context 'for signed in users' do

    before(:each) do
      @user = double(User, id: 1, friendly_id: 'my-id', encrypted_password: 'i-am-encrypted')
      request.env['warden'].stub :authenticate! => @user
      controller.stub :current_user => @user
      @auth = double(Authentication, user: @user)
      controller.stub :user_signed_in? => true
    end

    it 'should not allow connecting to a profile when the profile already exists under a different user' 


    context 'connecting to a new profile' do

      before(:each) do
        Authentication.stub(:find_by_provider_and_uid).and_return nil
        @user.stub_chain(:authentications, :build).and_return @auth
      end

      it 'should be able to create other profiles' 


      it 'should not accept multiple profiles from the same source' 

    end
  end

  describe 'Github profile link' do
    before(:each) do
      controller.stub(authenticate_user!: true)

      request.env['omniauth.auth'] = {
          'provider' => 'github',
          'info' => { 'urls' => { 'GitHub' => 'http://github.com/test' } }
      }
    end

    it 'links Github profile when authenticate with GitHub' 


    it 'unlinks Github profile when Github profile is removed by user' 

  end
end

