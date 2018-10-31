# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/tasks/uncomplete" do
  include TasksHelper

  before do
    login
    assign(:bucket, [])
  end

  describe "uncomplete from Tasks tab (completed view)" do
    before do
      @task = build_stubbed(:task)
      assign(:task, @task)
      assign(:view, "completed")
      assign(:empty_bucket, :due_asap)
      assign(:task_total, stub_task_total("completed"))
    end

    it "should slide up uncompleted task partial" 


    it "should update tasks sidebar" 

  end
end

