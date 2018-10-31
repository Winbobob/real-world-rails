require 'spec_helper'
require 'oauth/client/action_controller_request'

describe OauthClientsController do
  fixtures :oauth_tokens
  before(:each) do
    login_as_application_owner
  end

  describe "index" do

    def do_get
      get :index
    end
    
    it "should be successful" 


    it "should render index template" 

  end
  
  describe "developer" do

    def do_get
      get :developer
    end
    
    before do
      @client_applications = @user.client_applications
    end

    it "should assign client_applications" 

  end

  describe "show" do

    def do_get
      get :show, :id => current_client_application.id
    end

    it "should be successful" 


    it "should assign client_applications" 


    it "should render show template" 


  end

  describe "new" do

    def do_get
      get :new
    end

    it "should be successful" 


    it "should assign client_applications" 


    it "should render show template" 


  end

  describe "edit" do
    def do_get
      get :edit, :id => current_client_application.id
    end

    it "should be successful" 


    it "should assign client_applications" 


    it "should render edit template" 


  end

  describe "create" do

    def do_valid_post
      post :create, 'client_application'=>{'name' => 'my site', :url=>"http://test.com"}
      @client_application = ClientApplication.last
    end

    def do_invalid_post
      post :create
    end

    it "should redirect to new client_application" 


    it "should render show template" 

  end

  describe "destroy" do

    def do_delete
      delete :destroy, :id => current_client_application.id
    end

    it "should destroy client applications" 


    it "should redirect to list" 


  end

  describe "update" do

    def do_valid_update
      put :update, :id => current_client_application.id, 'client_application'=>{'name' => 'updated site'}
    end

    def do_invalid_update
      put :update, :id => current_client_application.id, 'client_application'=>{'name' => nil}
    end

    it "should redirect to show client_application" 


    it "should assign client_applications" 


    it "should render show template" 

  end
end

