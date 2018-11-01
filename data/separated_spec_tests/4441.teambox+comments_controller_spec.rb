require File.dirname(__FILE__) + '/../spec_helper'

describe CommentsController do
  before do
    @user = Factory(:confirmed_user)
    @project = Factory(:project)
    @project.add_user @user
  end

  describe "#create" do
    it "should set the current user as the author" 

  end
  
  describe "#destroy rollback" do
    before do
      task_comment_rollback_example(@project)
    end
    
    it "reverts the status back to the previous status when destroyed as the last comment with do_rollback" 

    
    it "maintains the status if any other comments are destroyed" 

  end
end

