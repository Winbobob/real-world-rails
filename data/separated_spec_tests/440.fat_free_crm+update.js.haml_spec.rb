# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/users/update" do
  include UsersHelper

  before do
    login
    assign(:user, @user = current_user)
  end

  describe "no errors:" do
    it "should flip [Edit Profile] form" 


    it "should update Welcome, user!" 


    it "should update actual user profile information" 

  end

  describe "validation errors :" do
    before do
      @user.errors.add(:first_name)
    end

    it "should redraw the [Edit Profile] form and shake it" 

  end
end

