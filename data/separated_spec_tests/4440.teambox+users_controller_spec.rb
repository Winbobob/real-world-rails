require File.dirname(__FILE__) + '/../spec_helper'

describe UsersController do

  route_matches("/account/settings", :get, :controller => "users", :action => "edit", :sub_action => 'settings')
  route_matches("/account/profile", :get, :controller => "users", :action => "edit", :sub_action => 'profile')
  route_matches("/account/profile", :get, :controller => "users", :action => "edit", :sub_action => 'profile')
  route_matches("/account/notifications", :get, :controller => "users", :action => "edit", :sub_action => 'notifications')
      
  it 'allows signup' 

  
  it 'requires email on signup' 


  describe "on POST to create with bad params" do
    before do
      post :create, :user => {}
    end

    it "should render the new template" 


    it "should have errors on the user" 


    it "should render the new user view" 

  end
  
  describe "#show" do
    render_views
    
    before do
      @first_project = make_a_typical_project
      @first_user = @user
      @another_first_user = Factory(:confirmed_user, :first_name => 'Frank', :last_name => 'Sinatra')
      @first_project.add_user(@another_first_user)

      @second_project = make_a_typical_project
      @second_user = @user
    end
    
    it "should not show unknown users" 

    
    it "should show known users" 

    
    it "should show the selected user in the title and not the logged in user" 

    
    it "should show projects that you share with this user and not projects that you don't" 

  end

    
  def do_create(options = {})
    post :create, :user => { :email       => 'testing@localhost.com',
                             :login       => 'testing',
                             :first_name  => 'Andrew',
                             :last_name   => 'Wiggin',
                             :password    => 'testing',
                             :password_confirmation => 'testing'}.merge(options)
  end
    
end  
  

