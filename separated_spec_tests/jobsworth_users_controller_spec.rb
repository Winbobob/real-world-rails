require 'spec_helper'

describe UsersController do

  describe "GET 'index'" do
    before :each do
      Setting.contact_creation_allowed = true
      sign_in_admin
    end

    it 'should be successful' 


    it 'should render the right template' 

  end

  shared_examples_for 'user with permission to admin exclusive actions' do

    before(:each) do
      @dummy_user = User.make(:company => @logged_user.company)
    end

    it 'should be able to update user access' 

  end

  shared_examples_for 'user without permission to admin exclusive actions' do

    before(:each) do
      @dummy_user = User.make(:company => @logged_user.company)
    end

    it 'should not be able to update user access' 

  end

  shared_examples_for 'user with permission to all actions' do

    before(:each) do
      @dummy_user = User.make(:company => @logged_user.company)
    end

    it 'should be able to GET index' 


    it 'should be able to GET new' 


    it 'should be able to GET edit' 


    it 'should be able to GET destroy' 


    it 'should be able to delete a user' 


    it 'should be able to POST create' 


    it 'should be able to create a new user' 


    it 'should be able to update any user' 

  end

  shared_examples_for 'user without permission to admin protected actions' do

    before(:each) do
      @dummy_user = User.make(:company => @logged_user.company)
    end

    it 'should not be able to GET index' 


    it 'should not be able to GET new' 


    it 'should not be able to GET edit' 


    it 'should not be able to destroy any user' 


    it 'should not be able to create a new user' 


    it 'should not be able to update any user' 

  end


  context 'when logged in user is admin,' do
    before(:each) do
      Setting.contact_creation_allowed = true
      sign_in_admin
    end

    it_should_behave_like 'user with permission to admin exclusive actions'
    it_should_behave_like 'user with permission to all actions'
  end

  context 'when logged in user is not admin,' do
    before(:each) do
      Setting.contact_creation_allowed = true
      sign_in_normal_user
    end

    it_should_behave_like 'user without permission to admin protected actions'
    it_should_behave_like 'user without permission to admin exclusive actions'
  end

  context 'when logged in user is admin, but contact creation is disabled in app' do
    before(:each) do
      Setting.contact_creation_allowed = false
      sign_in_admin
    end

    it_should_behave_like 'user without permission to admin protected actions'
  end


  context 'when logged user is not admin but can edit clients,' do
    before(:each) do
      Setting.contact_creation_allowed = true
      sign_in_normal_user(:edit_clients => true)
    end

    it_should_behave_like 'user with permission to all actions'
    it_should_behave_like 'user without permission to admin exclusive actions'
  end
end

