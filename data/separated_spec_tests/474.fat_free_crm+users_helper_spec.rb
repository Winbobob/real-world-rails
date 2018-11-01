# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UsersHelper do
  let(:myself) { create(:user, id: 54) }
  let(:user1) { create(:user,  id: 60, first_name: 'Bob', last_name: "Hope") }
  let(:user2) { create(:user,  id: 75, first_name: 'Billy', last_name: "Joel") }

  describe "user_options_for_select" do
    it "includes 'myself'" 


    it "includes other users" 

  end

  describe "user_select" do
    it "includes blank option" 


    it "includes myself" 


    it "includes other users" 

  end
end

