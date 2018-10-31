# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/users/upload_avatar" do
  include UsersHelper

  before do
    login
  end

  describe "no errors:" do
    before do
      @avatar = build_stubbed(:avatar, entity: current_user)
      allow(current_user).to receive(:avatar).and_return(@avatar)
      assign(:user, @user = current_user)
    end

    it "should flip [Upload Avatar] form" 

  end

  describe "validation errors:" do
    before do
      @avatar = build_stubbed(:avatar, entity: current_user)
      @avatar.errors.add(:image, "error")
      allow_any_instance_of(User).to receive(:avatar).and_return(@avatar)
      assign(:user, @user = current_user)
    end

    it "should redraw the [Upload Avatar] form and shake it" 

  end
end

