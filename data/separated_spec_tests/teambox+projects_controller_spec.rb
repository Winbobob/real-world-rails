require 'spec_helper'

describe ProjectsController do
  render_views
  
  describe "#index" do
    before do
      @user = Factory(:confirmed_user)
      @project = Factory(:project)
      @project.add_user @user
    end
    
    it "should show a project when using mobile views" 

    
    it "should not shown private objects we cant see in feeds" 

    
    it "should not shown private objects we cant see in ical" 

  end
  
  describe "#show" do
    before do
      @user = Factory(:confirmed_user)
      @project = Factory(:project)
      @project.add_user @user
      
      @task = Factory.create(:task, :project => @project, :name => 'Silence the critics', :comments_attributes => {'0' => {'body' => 'People are asking too many questions'} }, :is_private => true, :due_on => Time.now)
    end
    
    it "should not show private objects we cant see in feeds" 

    
    it "should not show private objects we cant see in ical" 

  end
  
  describe "#create" do
    it "creates a project with invitations" 


    it "creates invitations for newly created project" 


  end
  
  describe "#create" do
    it "creates a project with an existing organization" 

  end
  
  describe "#join" do
    it "should let admins from the projects organization add themselves" 

    
    it "should let people add themselves to public projects as commenters" 

    
    it "should not allow people to add themselves to non-public projects" 

  end
end

