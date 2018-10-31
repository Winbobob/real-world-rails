require 'spec_helper'

describe UsersController, :type => :controller do
  before do
    fake_admin_login
    fake_session = Session.new
    allow(fake_session).to receive(:admin?).with(no_args).and_return(true)
    allow(Session).to receive(:get).and_return(fake_session)
  end

  def mock_user(stubs = {})
    @mock_user ||= stub_model(User, stubs)
  end

  describe 'GET index' do
    before do
      @user = mock_user(:merge => {}, :user_name => 'someone')
    end

    it 'shows the page name' 


    context 'filter and sort users' do
      before do
        @active_user_one = mock_user(:merge => {}, :user_name => 'active_user_one', :disabled => false, :full_name => 'XYZ')
        @active_user_two = mock_user(:merge => {}, :user_name => 'active_user_two', :disabled => false, :full_name => 'ABC')
        @inactive_user = mock_user(:merge => {}, :user_name => 'inactive_user', :disabled => true, :full_name => 'inactive_user')

      end
      it 'should filter active users and sort them by full_name by default' 


      it 'should filter all users and sort them by full_name' 


      it 'should filter all users and sort them by user_name' 


      it 'should filter active users and sort them by full_name' 


      it 'should filter active users and sort them by user_name' 

    end

    it 'assigns users_details for backbone' 


    it 'should return error if user is not authorized' 


    it 'should authorize index page for read only users' 

  end

  describe 'GET show' do
    it 'assigns the requested user as @user' 


    it 'should flash an error and go to listing page if the resource is not found' 


    it 'should show self user for non-admin' 


    it 'should not show non-self user for non-admin' 

  end

  describe 'GET new' do
    it 'assigns a new user as @user' 


    it 'should assign all the available roles as @roles' 


    it 'should throw error if an user without authorization tries to access' 

  end

  describe 'GET edit' do
    it 'assigns the requested user as @user' 


    it 'should not allow editing a non-self user for users without access' 


    it 'should allow editing a non-self user for user having edit permission' 

  end

  describe 'DELETE destroy' do
    it 'destroys the requested user' 


    it 'redirects to the users list' 


    it 'should not allow a destroy' 


    it 'should allow user deletion for relevant user role' 

  end

  describe 'POST update' do
    context 'when not admin user' do
      it 'should not allow to edit admin specific fields' 

    end

    context 'disabled flag' do
      it 'should not allow to edit disable fields for non-disable users' 


      it 'should allow to edit disable fields for disable users' 


    end
    context 'create a user' do
      it 'should create admin user if the admin user type is specified' 


      it 'should render new if the given user is invalid and assign user,roles' 

    end
  end

  describe 'POST update unverified user' do
    it 'should set verify to true, if user is invalid' 


    it 'should update all the children of recently verified users' 


    it 'should call verify_children only for recently verified users' 

  end

  describe 'GET change_password' do
    before :each do
      @user = User.new(:user_name => 'fakeuser')
      @mock_change_form = double
      fake_login @user
      @mock_params = {'mock' => 'mock'}
      allow(Forms::ChangePasswordForm).to receive(:new).with(@mock_params).and_return(@mock_change_form)
    end

    it 'should show update password form' 


    it 'should make password request from parameters' 


    it 'should show error when any of the fields is wrong' 

  end

  describe 'register_unverified' do
    it 'should set verified status to false' 


    it 'should not attempt to create a user if already exists' 

  end

  describe 'index unverified users' do
    it 'should list all unverfied users' 


    it 'should show page name' 

  end

end

