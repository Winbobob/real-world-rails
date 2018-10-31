# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/tasks/complete" do
  include TasksHelper

  before do
    login
    assign(:bucket, [])
  end

  describe "complete from Tasks tab (pending view)" do
    before do
      @task = build_stubbed(:task)
      assign(:task, @task)
      assign(:view, "pending")
      assign(:empty_bucket, :due_asap)
      assign(:task_total, stub_task_total("pending"))
    end

    it "should fade out completed task partial" 


    it "should update tasks sidebar" 

  end

  describe "complete from related asset" do
    it "should replace pending partial with the completed one" 


    it "should update recently viewed items" 

  end
end

