require 'spec_helper'

describe ApiV1::TaskListsController do
  before do
    make_a_typical_project

    @task_list = @project.create_task_list(@owner, {:name => 'A TODO list'})
    @task_list.save!

    @other_task_list = @project.create_task_list(@owner, {:name => 'Another TODO list'})
    @other_task_list.archived = true
    @other_task_list.save!
  end

  describe "#index" do
    it "shows task lists in the project" 

    
    describe "include" do
      before do
        login_as @user
        @first_task = @project.create_task(@owner,@task_list,{:name => 'Something TODO', 
                                                              :comments_attributes => {'0' => {'body' => 'First test comment'}}})
        @second_task = @project.create_task(@owner,@other_task_list,{:name => 'Something Else TODO',
                                                                     :assigned_id => @project.people.first.id,
                                                                     :status => Task::STATUSES[:resolved],
                                                                     :comments_attributes => {'0' => {'body' => 'Second test comment'}}})
        
        @task_list.archived_tasks.length.should == 0
        @task_list.unarchived_tasks.length.should == 1
        @other_task_list.archived_tasks.length.should == 1
        @other_task_list.unarchived_tasks.length.should == 0
      end
      
      it "shows task lists with tasks with include=tasks" 


      it "shows task lists with tasks with include=unarchived_tasks" 

      
      it "shows task lists with tasks with include=archived_tasks" 


      it "shows a task list with tasks with include=unarchived_tasks" 

    end

    it "shows task lists as JSON when requested with the :text format" 


    it "shows task lists with a JSONP callback" 


    it "shows task lists in all projects" 


    it "shows no task lists for archived projects" 


    it "shows task lists created by a user" 


    it "shows no task lists created by a ficticious user" 


    it "restricts by archived lists" 


    it "restricts by unarchived lists" 


    it "limits task lists" 


    it "limits and offsets task lists" 

  end

  describe "#show" do
    it "shows a task list with references" 

  end

  describe "#create" do
    it "should allow participants to create task lists" 


    it "should not allow observers to create task lists" 


    it "should allow participants to create task lists from template with optional task list name" 


  end

  describe "#update" do
    it "should allow participants to modify a task list" 


    it "should not allow observers to modify a task list" 

  end

  describe "#archive" do
    it "should allow participants to archive a task list" 


    it "should not allow observers to archive a task list" 


    it "should not allow a task list to be archived twice" 

  end

  describe "#unarchive" do
    it "should allow participants to unarchive a task list" 


    it "should not allow observers to unarchive a task list" 


    it "should not allow a task list to be unarchived twice" 

  end

  describe "#reorder" do

    it "should allow a user to reorder task lists" 

  end

  describe "#destroy" do
    it "should allow the creator to destroy a task list" 


    it "should allow an admin to destroy a task list" 


    it "should not allow observers to destroy a task list" 

  end
end

