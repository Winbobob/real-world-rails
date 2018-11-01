# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "admin/users/new" do
  before do
    login_admin
    assign(:user, User.new)
  end

  describe "new user" do
    it "shows [create user] form" 

  end

  describe "cancel new user" do
    it "hides [create user] form" 

  end
end

