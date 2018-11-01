require 'spec_helper'

describe ApiV1::UsersController do
  before do
    @user = Factory.create(:confirmed_user)
    @fred = Factory.create(:confirmed_user)
    @project = Factory.create(:project)
    @owner = @project.user
    @project.add_user(@user)
  end

  describe "#index" do
    it "shows all users known to the current user" 


    it "limits all users known to the current user" 


    it "limits and offsets users known to the current user" 

  end

  describe "#show" do
    it "shows a user by name" 


    it "shows a user by id" 


    it "does not show a user not known to the current user" 

  end

  describe "#current" do
    it "shows the current user" 


    it "really shows the current user" 


    it "fails if you are not logged in" 

  end

  describe "#current" do
    it "should return the current api version" 

    
    it "should get the current user for oauth requests" 


    it "should not get the current user for expired oauth requests" 

  end
  
  describe "#create" do
    it "should create a user" 

    
    it "should not create an invalid user" 

  end
  
  describe "#update" do
    it "should update the specified user" 

    
    it "should not modify other users" 

  end
  
  def do_create(options = {})
    post :create, { :email       => 'testing@localhost.com',
                    :login       => 'testing',
                    :first_name  => 'Andrew',
                    :last_name   => 'Wiggin',
                    :password    => 'testing',
                    :password_confirmation => 'testing'}.merge(options)
  end
end

