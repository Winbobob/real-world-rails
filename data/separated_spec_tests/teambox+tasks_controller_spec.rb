require 'spec_helper'

describe ApiV1::TasksController do
  before do
    make_a_typical_project

    @task_list = @project.create_task_list(@owner, {:name => 'A TODO list'})
    @task_list.save!

    @other_list = @project.create_task_list(@owner, {:name => 'A TODO list'})
    @other_list.save!

    @task = @project.create_task(@owner,@task_list,{:name => 'Something TODO'})
    @task.save!
    @other_task = @project.create_task(@owner,@other_list,{:name => 'Something else TODO'})
    @other_task.status = 3
    @other_task.save!
  end

  describe "#index" do
    it "shows tasks in the project" 


    it "shows no tasks in archived projects" 


    it "shows tasks with a JSONP callback" 


    it "shows tasks as JSON when requested with :text format" 


    it "shows tasks in a task list" 


    it "shows tasks created by a user" 


    it "shows no tasks created by a ficticious user" 


    it "shows tasks assigned to a person" 


    it "shows tasks assigned to a user" 


    it "shows tasks in all the users projects" 


    it "restricts by status" 


    it "limits tasks" 


    it "limits and offsets tasks" 


    it "returns references for linked objects" 


    it "does not show unwatched private tasks in a project" 

  end

  describe "#show" do
    it "shows a task with references" 


    it "shows a task in a task list" 


    it "does not show a task in another list" 


    it "does not show private tasks unwatched by the user" 


    it "shows private tasks watched by the user" 

  end

  describe "#create" do
    it "should allow participants to create tasks" 

    
    it "should create an inbox in the desired project if no task list is specified" 


    it "should not allow observers to create tasks" 

  end

  describe "#update" do
    it "should allow participants to modify a task" 


    it "should use the logged in user as the modifier of the task" 


    it "should not allow observers to modify a task" 


    it "should not allow participants not watching to modify a private task" 

    
    it "should not allow commenters to modify the task list" 

    
    it "should allow users to modify the task list" 


    it "should return updated task and any references" 

  end

  describe "#watch" do
    it "should allow participants watch a task" 


    it "should not allow observers to watch a task" 


    it "should not allow participants to watch private conversations" 

  end

  describe "#unwatch" do
    it "should allow participants to unwatch a task" 

  end

  describe "#destroy" do
    it "should allow the owner to destroy a task" 


    it "should allow an admin to destroy a task" 


    it "should not allow observers to destroy a task" 


    it "should not allow admins not watching to modify a private task" 

  end

  describe "#reorder" do

    before do
      @tl = Factory(:task_list, :project => @project)
    end

    it "should allow a user to reorder tasks" 


    it "should return not found for unexisting tasks" 

  end
end

