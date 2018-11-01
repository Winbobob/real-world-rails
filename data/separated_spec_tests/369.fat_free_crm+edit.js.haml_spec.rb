# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/tasks/edit" do
  include TasksHelper

  before do
    login
    assign(:users, [current_user])
    assign(:bucket, Setting.task_bucket[1..-1] << ["On Specific Date...", :specific_time])
    assign(:category, Setting.unroll(:task_category))
  end

  %w[pending assigned].each do |view|
    it "cancel for #{view} view: should replace [Edit Task] form with the task partial" 


    it "edit: should hide [Create Task] form" 


    it "edit: should hide previously open [Edit Task] form" 


    it "edit: should remove previous [Edit Task] form if previous task is not available" 


    it "edit: should turn off highlight and replace current task with [Edit Task] form" 

  end
end

