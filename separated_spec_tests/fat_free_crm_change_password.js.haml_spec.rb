# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/users/change_password" do
  include UsersHelper

  before do
    login
    assign(:user, @user = current_user)
  end

  describe "no errors:" do
    it "should flip [Change Password] form" 


    it "should show flash message" 

  end

  describe "validation errors:" do
    it "should redraw the [Change Password] form and shake it" 


    it "should redraw the [Change Password] form and correctly set focus" 

  end
end

