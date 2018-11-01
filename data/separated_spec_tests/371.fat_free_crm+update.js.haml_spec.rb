# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/tasks/update" do
  include TasksHelper

  before do
    login
  end

  describe "Changing due date" do
    before do
      assign(:task_before_update, build_stubbed(:task, bucket: "due_asap"))
      assign(:task, @task = build_stubbed(:task, bucket: "due_tomorrow"))
      assign(:view, "pending")
      assign(:task_total, stub_task_total("pending"))
    end

    it "from Tasks tab: should remove task from current bucket and hide empty bucket" 


    it "from Tasks tab: should show updated task in a new bucket" 


    it "from Tasks tab: should update tasks sidebar" 


    it "from asset page: should update task partial in place" 


    it "from asset page: should update recently viewed items" 

  end

  describe "Reassigning" do
    before do
      assign(:task_total, stub_task_total("pending"))
    end

    it "pending task to somebody from Tasks tab: should remove the task and show flash message (assigned)" 


    it "assigned tasks to me from Tasks tab: should remove the task and show flash message (pending)" 


    it "assigned tasks to somebody else from Tasks tab: should re-render task partial" 


    it "from Tasks tab: should update tasks sidebar" 


    it "from asset page: should should re-render task partial" 


    it "from asset page: should update recently viewed items" 

  end

  it "error: should re-disiplay [Edit Task] form and shake it" 

end

