require File.dirname(__FILE__) + '/../spec_helper'

describe UploadsController do
  render_views
  
  before do
    make_a_typical_project
    
    @upload = @project.uploads.new({:asset => mock_uploader('semicolons.js', 'application/javascript', "alert('what?!')")})
    @upload.user = @user
    @upload.save!
    
    @page_upload = mock_file(@user, Factory.create(:page, :project => @project))
    @page = @page_upload.page
    @page.reload
  end
  
  route_matches("/downloads/22/original/test", 
    :get, 
    :controller => "uploads", 
    :action => "download", 
    :filename =>"test", :id => "22", :style => "original")
  route_matches("/downloads/22/original/test......", 
    :get, 
    :controller => "uploads", 
    :action => "download", 
    :filename =>"test......", :id => "22", :style => "original")
  route_matches("/downloads/22/original/test.test",          
    :get, 
    :controller => "uploads", 
    :action => "download", 
    :filename =>"test.test", :id => "22", :style => "original")
  route_matches("/downloads/22/original/test.jpg",           
    :get, 
    :controller => "uploads", 
    :action => "download", 
    :filename =>"test.jpg", :id => "22", :style => "original")
  route_matches("/downloads/22/original/test.test.jpg",      
    :get, 
    :controller => "uploads", 
    :action => "download", 
    :filename =>"test.test.jpg", :id => "22", :style => "original")
  route_matches("/downloads/22/original/test.test.test.jpg", 
    :get, 
    :controller => "uploads", 
    :action => "download", 
    :filename =>"test.test.test.jpg", :id => "22", :style => "original")

  describe "#index" do
    before do
      @conversation = Factory.create(:conversation, :is_private => true, :user => @project.user, :project => @project)
      @upload.is_private = true
      @upload.comment = @conversation.comments.first
      @upload.save!
    end
    
    it "should not show private uploads belonging to targets we are not watching" 

    
    it "shows private uploads belonging to objects we are a watcher of" 

  end

  describe "#download of private uploads" do
    before do
      @conversation = Factory.create(:conversation, :is_private => true, :user => @project.user, :project => @project)
      @upload = @project.uploads.new({:asset => mock_uploader('lawsuit.txt', 'text/plain', "1 million dolalrs please")})

      @upload.user = @user
      @upload.is_private = true
      @upload.comment = @conversation.comments.first
      @upload.save!
    end
    
    it "should not allow downloading of private uploads belonging to targets we are not watching" 

    
    it "allows downloading of private uploads belonging to objects we are a watcher of" 

  end
  
  describe "#create" do
    it "should allow participants to create uploads" 

    
    it "should insert uploads at the top of a page" 

    
    it "should insert uploads at the footer of a page" 

    
    it "should insert uploads before an existing widget" 

    
    it "should insert uploads after an existing widget" 

    
    it "should not allow observers to create uploads" 

  end

  describe "#destroy" do
    it "should allow participants to destroy uploads" 

    it  "should destroy the activty when the upload is destroyed" do
      login_as @user

      post :create,
           :project_id => @project.permalink,
           :upload => {:asset => mock_uploader('lawsuit.txt', 'text/plain', "1 million dollars please")}

      @upload = Upload.find(:first, :order => 'created_at desc')
      Activity.count(:conditions => {:target_type => @upload.class.name, :target_id => @upload.id}).should == 1
      lambda { delete :destroy, :project_id => @project.permalink, :id => @upload.id }.should change(Activity, :count)
    end
  end
<<<<<<< HEAD

  describe "#email_public" do
    it "should send email with download link" 

  end

  describe "#edit" do
    it "should allow user to edit an upload" 


    it "should not allow users with no rights to update uploads" 

  end

  describe "#rename" do
    before do 
      login_as @user
      # until rspec gets any_instance
      @uploads = mock(Object)
      Project.stub!(:find_by_id_or_permalink).with(@project.id).and_return(@project)
      @project.stub!(:uploads).and_return(@uploads)
      @uploads.stub!(:find).and_return(@upload)
    end
    
    describe "JS request" do
      it "should allow user to rename an upload" 


      it "should alert user on rename error" 

    end

    describe "HTML request" do
      it "should allow user to rename an upload" 


      it "should notify user on rename error" 

    end
  end

end
=======
end
>>>>>>> 62a8b022d8883e2252135a3b7cd1c4965e78e8c5

