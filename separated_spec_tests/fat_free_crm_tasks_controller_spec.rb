# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TasksController do
  def update_sidebar
    @task_total = { key: :value, pairs: :etc }
    allow(Task).to receive(:totals).and_return(@task_total)
  end

  def produce_tasks(user, view)
    settings = (view != "completed" ? Setting.task_bucket : Setting.task_completed)

    settings.each_with_object({}) do |due, hash|
      hash[due] ||= []
      if Date.tomorrow == Date.today.end_of_week && due == :due_tomorrow
        due = :due_this_week
        hash[due] ||= []
      end
      hash[due] << case view
                   when "pending"
                     create(:task, user: user, bucket: due.to_s)
                   when "assigned"
                     create(:task, user: user, bucket: due.to_s, assigned_to: 1)
                   when "completed"
                     completed_at = case due
                                    when :completed_today
                                      Date.yesterday + 1.day
                                    when :completed_yesterday
                                      Date.yesterday
                                    when :completed_last_week
                                      Date.today.beginning_of_week - 7.days
                                    when :completed_this_month
                                      Date.today.beginning_of_month
                                    when :completed_last_month
                                      Date.today.beginning_of_month - 1.day
                     end
                     create(:task, user: user, bucket: due.to_s, completed_at: completed_at)
      end
      hash
    end
  end

  before(:each) do
    login
    set_current_tab(:tasks)
  end

  # GET /tasks
  # GET /tasks.xml
  #----------------------------------------------------------------------------
  describe "responding to GET index" do
    before do
      update_sidebar
      @timezone = Time.zone
      Time.zone = 'UTC'
    end

    after do
      Time.zone = @timezone
    end

    TASK_STATUSES.each do |view|
      it "should expose all tasks as @tasks and render [index] template for #{view} view" 


      it "should render all tasks as JSON for #{view} view" 


      it "should render all tasks as xml for #{view} view" 

    end
  end

  # GET /tasks/1
  # GET /tasks/1.xml
  #----------------------------------------------------------------------------
  describe "responding to GET show" do
    TASK_STATUSES.each do |view|
      it "should render the requested task as JSON for #{view} view" 


      it "should render the requested task as xml for #{view} view" 

    end
  end

  # GET /tasks/new
  # GET /tasks/new.xml                                                     AJAX
  #----------------------------------------------------------------------------
  describe "responding to GET new" do
    it "should expose a new task as @task and render [new] template" 


    it "should find related asset when necessary" 


    describe "(when creating related task)" do
      it "should redirect to parent asset's index page with the message if parent asset got deleted" 


      it "should redirect to parent asset's index page with the message if parent asset got protected" 

    end
  end

  # GET /tasks/1/edit                                                      AJAX
  #----------------------------------------------------------------------------
  describe "responding to GET edit" do
    it "should expose the requested task as @task and render [edit] template" 


    it "should find previously open task when necessary" 


    describe "(task got deleted or reassigned)" do
      it "should reload current page with the flash message if the task got deleted" 


      it "should reload current page with the flash message if the task got reassigned" 

    end

    describe "(previous task got deleted or reassigned)" do
      before(:each) do
        @task = create(:task, user: current_user)
        @previous = create(:task, user: create(:user), assignee: current_user)
      end

      it "should notify the view if previous task got deleted" 


      it "should notify the view if previous task got reassigned" 

    end
  end

  # POST /tasks
  # POST /tasks.xml                                                        AJAX
  #----------------------------------------------------------------------------
  describe "responding to POST create" do
    describe "with valid params" do
      it "should expose a newly created task as @task and render [create] template" 


      ["", "?view=pending", "?view=assigned", "?view=completed"].each do |view|
        it "should update tasks sidebar when [create] is being called from [/tasks#{view}] page" 

      end
    end

    describe "with invalid params" do
      it "should expose a newly created but unsaved task as @lead and still render [create] template" 

    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.xml                                                       AJAX
  #----------------------------------------------------------------------------
  describe "responding to PUT update" do
    describe "with valid params" do
      it "should update the requested task, expose it as @task, and render [update] template" 


      ["", "?view=pending", "?view=assigned", "?view=completed"].each do |view|
        it "should update tasks sidebar when [update] is being called from [/tasks#{view}] page" 

      end
    end

    describe "with invalid params" do
      it "should not update the task, but still expose it as @task and render [update] template" 

    end

    describe "task got deleted or reassigned" do
      it "should reload current page with the flash message if the task got deleted" 


      it "should reload current page with the flash message if the task got reassigned" 

    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.xml                                                    AJAX
  #----------------------------------------------------------------------------
  describe "responding to DELETE destroy" do
    it "should destroy the requested task and render [destroy] template" 


    ["", "?view=pending", "?view=assigned", "?view=completed"].each do |view|
      it "should update sidebar when [destroy] is being called from [/tasks#{view}]" 

    end

    it "should not update sidebar when [destroy] is being called from asset page" 


    describe "task got deleted or reassigned" do
      it "should reload current page with the flash message if the task got deleted" 


      it "should reload current page with the flash message if the task got reassigned" 

    end
  end

  # PUT /tasks/1/complete
  # PUT /leads/1/complete.xml                                              AJAX
  #----------------------------------------------------------------------------
  describe "responding to PUT complete" do
    it "should change task status, expose task as @task, and render [complete] template" 


    it "should change task status, expose task as @task, and render [complete] template where task.bucket = 'specific_time'" 


    it "should change update tasks sidebar if bucket is not empty" 


    describe "task got deleted or reassigned" do
      it "should reload current page with the flash message if the task got deleted" 


      it "should reload current page with the flash message if the task got reassigned" 

    end
  end

  # PUT /tasks/1/complete
  # PUT /leads/1/complete.xml                                              AJAX
  #----------------------------------------------------------------------------
  describe "responding to PUT uncomplete" do
    it "should change task status, expose task as @task, and render template" 


    describe "task got deleted" do
      it "should reload current page with the flash message if the task got deleted" 

    end
  end

  # Ajax request to filter out a list of tasks.                            AJAX
  #----------------------------------------------------------------------------
  describe "responding to GET filter" do
    TASK_STATUSES.each do |view|
      it "should remove a filter from session and render [filter] template for #{view} view" 


      it "should add a filter from session and render [filter] template for #{view} view" 

    end
  end
end

