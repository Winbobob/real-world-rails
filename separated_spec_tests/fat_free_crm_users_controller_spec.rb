# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Admin::UsersController do
  before(:each) do
    login_admin
    set_current_tab(:users)
  end

  # GET /admin/users
  # GET /admin/users.xml                                                   HTML
  #----------------------------------------------------------------------------
  describe "GET index" do
    it "assigns all users as @users and renders [index] template" 


    it "performs lookup using query string" 

  end

  # GET /admin/users/1
  # GET /admin/users/1.xml
  #----------------------------------------------------------------------------
  describe "GET show" do
    it "assigns the requested user as @user and renders [show] template" 

  end

  # GET /admin/users/1/edit                                                AJAX
  #----------------------------------------------------------------------------
  describe "GET edit" do
    it "assigns the requested user as @user and renders [edit] template" 


    it "assigns the previous user as @previous when necessary" 


    it "reloads current page with the flash message if user got deleted" 


    it "notifies the view if previous user got deleted" 

  end

  # PUT /admin/users/1
  # PUT /admin/users/1.xml                                                 AJAX
  #----------------------------------------------------------------------------
  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested user, assigns it to @user, and renders [update] template" 


      it "reloads current page is the user got deleted" 


      it "assigns admin rights when requested so" 


      it "revokes admin rights when requested so" 

    end

    describe "with invalid params" do
      it "doesn't update the requested user, but assigns it to @user and renders [update] template" 

    end
  end

  # GET /admin/users/1/confirm                                             AJAX
  #----------------------------------------------------------------------------
  describe "GET confirm" do
    it "assigns the requested user as @user and renders [confirm] template" 


    it "reloads current page is the user got deleted" 

  end

  # DELETE /admin/users/1
  # DELETE /admin/users/1.xml                                              AJAX
  #----------------------------------------------------------------------------
  describe "DELETE destroy" do
    it "destroys the requested user and renders [destroy] template" 


    it "handles the case when the requested user can't be deleted" 

  end

  # POST /users/auto_complete/query                                        AJAX
  #----------------------------------------------------------------------------
  describe "POST auto_complete" do
    before(:each) do
      @auto_complete_matches = [create(:user, first_name: "Hello")]
    end

    it_should_behave_like("auto complete")
  end

  # PUT /admin/users/1/suspend
  # PUT /admin/users/1/suspend.xml                                         AJAX
  #----------------------------------------------------------------------------
  describe "PUT suspend" do
    it "suspends the requested user" 


    it "doesn't suspend current user" 


    it "reloads current page is the user got deleted" 

  end

  # PUT /admin/users/1/reactivate
  # PUT /admin/users/1/reactivate.xml                                      AJAX
  #----------------------------------------------------------------------------
  describe "PUT reactivate" do
    it "re-activates the requested user" 


    it "reloads current page is the user got deleted" 

  end
end

