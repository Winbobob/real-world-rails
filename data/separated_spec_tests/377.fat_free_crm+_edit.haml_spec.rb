# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/tasks/_edit" do
  include TasksHelper

  before do
    login
    assign(:task, build_stubbed(:task, asset: build_stubbed(:account), bucket: "due_asap"))
    assign(:users, [current_user])
    assign(:bucket, %w[due_asap due_today])
    assign(:category, %w[meeting money])
  end

  it "should render [edit task] form" 


  ["As Soon As Possible", "Today", "Tomorrow", "This Week", "Next Week", "Sometime Later"].each do |day|
    it "should render move to [#{day}] link" 

  end

  it "should render background info if Settings request so" 


  it "should not render background info if Settings do not request so" 

end

