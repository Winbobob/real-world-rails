# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/tasks/create" do
  include TasksHelper

  before do
    login
  end

  (TASK_STATUSES - ['completed']).each do |status|
    describe "create from #{status} tasks page" do
      before do
        assign(:view, status)
        assign(:task, @task = stub_task(status))
        assign(:task_total, stub_task_total(status))
        controller.request.env["HTTP_REFERER"] = "http://localhost/tasks?view=#{status}"
        render
      end

      it "should hide [Create Task] form and insert task partial" 


      it "should update tasks title" 


      it "should update tasks sidebar" 

    end
  end

  it "should show flash message when assigning a task from pending tasks view" 


  it "should update recent items when assigning a task from pending tasks view" 


  it "should show flash message when creating a pending task from assigned tasks view" 


  it "should update recent items when creating a pending task from assigned tasks view" 


  (TASK_STATUSES - ['assigned']).each do |status|
    describe "create from outside the Tasks tab" do
      before do
        @task = build_stubbed(:task, id: 42)
        assign(:view, status)
        assign(:task, @task)
        render
      end

      it "should update tasks title" 


      it "should insert #{status} partial and highlight it" 


      it "should update recently viewed items" 

    end
  end

  it "create failure: should re-render [create] template in :create_task div" 

end

