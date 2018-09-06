# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/users/password" do
  include UsersHelper

  before do
    login
    assign(:user, current_user)
  end

  it "cancel: should hide [Change Password] form and restore title" 


  it "edit profile: should hide [Edit Profile] and [Upload Avatar] forms and show [Change Password]" 

end

