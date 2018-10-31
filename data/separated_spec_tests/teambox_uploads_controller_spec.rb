require 'spec_helper'

describe ApiV1::UploadsController do
  before do
    make_a_typical_project

    @upload = @project.uploads.new({:asset => mock_uploader('semicolons.js', 'application/javascript', "alert('what?!')")})
    @upload.user = @user
    @upload.save!

    @page_upload = mock_file(@user, Factory.create(:page, :project_id => @project.id))
    @page = @page_upload.page
  end

  describe "#index" do
    it "shows uploads in the project" 


    it "shows uploads with a JSONP callback" 


    it "shows uploads as JSON when requested with the :text format" 


    it "shows uploads in all projects" 


    it "shows no uploads for archived projects" 


    it "shows uploads created by a user" 


    it "shows no uploads created by a ficticious user" 


    it "shows uploads on a page" 


    it "limits uploads" 


    it "limits and offsets uploads" 


    describe "private uploads" do
      before do
        @conversation = Factory.create(:conversation, :is_private => true, :user => @project.user, :project => @project)
        @upload.is_private = true
        @upload.comment = @conversation.comments.first
        @upload.save!
      end

      it "does not show private uploads belonging to objects we aren't a target of" 


      it "shows private uploads belonging to objects we are a watcher of" 

    end
  end

  describe "#show" do
    it "shows an upload with references" 


    it "does not show a private upload" 

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
    it "should allow participants to destroy an upload" 


    it "should not allow observers to destroy an upload" 

  end
end

