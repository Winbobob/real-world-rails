require 'spec_helper'

describe ApiV1::CommentsController do
  before do
    make_a_typical_project

    @target = Factory.create(:conversation, :project => @project, :user => @user)
    @comment = @target.comments.first
  end

  describe "#index" do
    it "shows comments in the project" 


    it "shows comments with a JSONP callback" 


    it "shows comments as JSON when requested with the :text format" 


    it "shows comments in all projects" 


    it "shows no comments for archived projects" 


    it "shows comments created by a user" 


    it "shows no comments created by a ficticious user" 


    it "shows comments on conversations" 


    it "shows comments on tasks" 


    it "shows comments on tasks only when set" 


    it "shows comments on conversations with the basic routes" 


    it "shows comments on tasks with the basic routes" 


    it "shows returns 404's for ficticious targets" 


    it "shows no comments for private objects" 


    it "limits comments" 


    it "limits and offsets comments" 


    it "returns references for linked objects" 


    it "does not show unwatched private comments in a project" 

  end

  describe "#show" do
    it "shows a comment with references" 


    it "shows a comment in any project" 


    it "does not show a comment in another project" 


    it "does not show private comments with targets unwatched by the user" 


    it "shows private private comments with targets watched by the user" 

  end

  describe "#create" do
    it "show allow commenters to post a comment in a task" 


    it "show allow commenters to post a comment in a conversation" 


    it "should not allow observers to post a comment" 


    it "should not allow oauth users without :write_projects to post a comment" 


    it "should allow oauth users with :write_projects to post a comment" 

  end


  describe "#update" do
    it "should allow the owner to modify a comment within 15 minutes" 


    it "should not allow anyone else to modify another comment" 

  end

  describe "#destroy" do
    it "should allow an admin to destroy a comment" 


    it "should allow the owner to destroy a comment" 


    it "should not allow a non-admin to destroy another comment" 

  end
  
  describe "#destroy rollback" do
    before do
      task_comment_rollback_example(@project)
    end
    
    it "reverts the status back to the previous status when destroyed as the last comment with do_rollback" 

    
    it "maintains the status if any other comments are destroyed" 

  end
end

