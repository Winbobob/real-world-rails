# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HomeController do
  # GET /
  #----------------------------------------------------------------------------
  describe "responding to GET /" do
    before(:each) do
      login
    end

    it "should get a list of activities" 


    it "should not include views in the list of activities" 


    it "should get a list of my tasks ordered by due_at" 


    it "should not display completed tasks" 


    it "should get a list of my opportunities ordered by closes_on" 


    it "should get a list of my accounts ordered by name" 

  end

  # GET /home/options                                                      AJAX
  #----------------------------------------------------------------------------
  describe "responding to GET options" do
    before(:each) do
      login
    end

    it "should assign instance variables for user preferences" 


    it "should not assign instance variables when hiding options" 

  end

  # GET /home/redraw                                                       AJAX
  #----------------------------------------------------------------------------
  describe "responding to GET redraw" do
    before(:each) do
      login
    end

    it "should save user selected options" 


    it "should get a list of activities" 

  end

  # GET /home/toggle                                                       AJAX
  #----------------------------------------------------------------------------
  describe "responding to GET toggle" do
    before(:each) do
      login
    end

    it "should toggle expand/collapse state of form section in the session (delete existing session key)" 


    it "should toggle expand/collapse state of form section in the session (save new session key)" 

  end

  describe "activity_user" do
    before(:each) do
      @user = double(User, id: 1, is_a?: true)
      @cur_user = double(User)
    end

    it "should find a user by email" 


    it "should find a user by first name or last name" 


    it "should find a user by first name and last name" 


    it "should return nil when 'all_users' is specified" 

  end

  describe "timeline" do
    before(:each) do
      login
    end

    it "should collapse all comments and emails on a specific contact" 


    it "should expand all comments and emails on a specific contact" 


    it "should not do anything when state neither Expanded nor Collapsed" 


    it "should collapse all comments and emails on Contact" 


    it "should not allow an arbitary state (sanitizes input)" 


    it "should not update an arbitary model (sanitizes input)" 

  end
end

