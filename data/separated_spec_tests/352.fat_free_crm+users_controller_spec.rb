# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe UsersController do
  # GET /users/1
  # GET /users/1.xml                                                       HTML
  #----------------------------------------------------------------------------
  describe "responding to GET show" do
    before(:each) do
      login
    end

    it "should render [show] template" 


    it "should expose current user as @user if no specific user was requested" 


    it "should show user if admin user" 


    it "should not show user if not admin user" 


    describe "with mime type of JSON" do
      before(:each) do
        request.env["HTTP_ACCEPT"] = "application/json"
      end

      it "should render the requested user as JSON" 


      it "should render current user as JSON if no specific user was requested" 

    end

    describe "with mime type of xml" do
      before(:each) do
        request.env["HTTP_ACCEPT"] = "application/xml"
      end

      it "should render the requested user as XML" 


      it "should render current user as XML if no specific user was requested" 

    end
  end

  # GET /users/1/edit                                                      AJAX
  #----------------------------------------------------------------------------
  describe "responding to GET edit" do
    it "should expose current user as @user and render [edit] template" 


    it "should not allow current user to edit another user" 


    it "should allow admin to edit another user" 

  end

  # PUT /users/1
  # PUT /users/1.xml                                                       AJAX
  #----------------------------------------------------------------------------
  describe "responding to PUT update" do
    before(:each) do
      login
      @user = current_user
    end

    describe "with valid params" do
      it "should update user information and render [update] template" 

    end

    describe "with invalid params" do
      it "should not update the user information and redraw [update] template" 

    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml                HTML and AJAX (not directly exposed yet)
  #----------------------------------------------------------------------------
  describe "responding to DELETE destroy" do
    before(:each) do
      login
    end

    it "should destroy the requested user" 


    it "should redirect to the users list" 

  end

  # GET /users/1/avatar
  # GET /users/1/avatar.xml                                                AJAX
  #----------------------------------------------------------------------------
  describe "responding to GET avatar" do
    before(:each) do
      login
      @user = current_user
    end

    it "should expose current user as @user and render [avatar] template" 

  end

  # PUT /users/1/upload_avatar
  # PUT /users/1/upload_avatar.xml                                         AJAX
  #----------------------------------------------------------------------------
  describe "responding to PUT update_avatar" do
    before(:each) do
      login
      @user = current_user
    end

    it "should delete avatar if user chooses to use Gravatar" 


    it "should do nothing if user hasn't specified the avatar file to upload" 


    it "should save the user avatar if it was successfully uploaded and resized" 


    # -------------------------- Fix later --------------------------------
    #    it "should return errors if the avatar failed to get uploaded and resized" do
    #      @image = fixture_file_upload("spec/fixtures/rails.png", "image/png")
    #      @user.stub(:save).and_return(false) # make it fail

    #      put :upload_avatar, :id => @user.id, :avatar => { :image => @image }
    #      @user.avatar.errors.should_not be_empty
    #      @user.avatar.should have(1).error # .error_on(:image)
    #      response.should render_template("users/upload_avatar")
    #    end
  end

  # GET /users/1/password
  # GET /users/1/password.xml                                              AJAX
  #----------------------------------------------------------------------------
  describe "responding to GET avatar" do
    before(:each) do
      login
      @user = current_user
    end

    it "should expose current user as @user and render [pssword] template" 

  end

  # PUT /users/1/change_password
  # PUT /users/1/change_password.xml                                       AJAX
  #----------------------------------------------------------------------------
  describe "responding to PUT change_password" do
    before(:each) do
      @old_password = 'foobar123'
      @user = FactoryBot.create(:user, password: @old_password, password_confirmation: @old_password)
      perform_login(@user)
      @old_encrypted_password = @user.encrypted_password
      @new_password = 'secret?!'
    end

    it "should set new user password" 


    it "should not allow to change password if current password is blank" 


    it "should not change user password if password field is blank" 


    it "should require valid current password" 


    it "should require new password and password confirmation to match" 

  end

  # GET /users/opportunities
  # GET /users/opportunities.xml                                         HTML
  #----------------------------------------------------------------------------
  describe "responding to GET opportunities_overview" do
    before(:each) do
      login
      @user = current_user
      @user.update_attributes(first_name: "Apple", last_name: "Boy")
    end

    it "should assign @users_with_opportunities" 


    it "@users_with_opportunities should be ordered by name" 


    it "should assign @unassigned_opportunities with only open unassigned opportunities" 


    it "@unassigned_opportunities should be ordered by stage" 


    it "should not include users who have no assigned opportunities" 


    it "should not include users who have no open assigned opportunities" 


    it "should render opportunities overview" 

  end
end

