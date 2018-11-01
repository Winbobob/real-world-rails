# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FatFreeCRM::Permissions do
  before :each do
    build_model(:user_with_permission) do
      uses_user_permissions
      string :access
    end
  end

  describe "initialization" do
    it "should add 'has_many permissions' to the model" 

    it "should add scope called 'my'" 

  end

  describe "user_ids" do
    before(:each) do
      @entity = UserWithPermission.create(access: "Shared")
    end

    it "should assign permissions to the object" 


    it "should handle [] permissions" 


    it "should replace existing permissions" 

  end

  describe "group_ids" do
    before(:each) do
      @entity = UserWithPermission.create(access: "Shared")
    end
    it "should assign permissions to the object" 


    it "should handle [] permissions" 


    it "should replace existing permissions" 

  end

  describe "access" do
    before(:each) do
      @entity = UserWithPermission.create
    end
    it "should delete all permissions if access is set to Public" 

    it "should delete all permissions if access is set to Private" 

    it "should not remove permissions if access is set to Shared" 

  end

  describe "save_with_model_permissions" do
    it "should copy permissions from original model" 

  end

  describe 'remove_permissions' do
    context 'with a new record' do
      before :each do
        @entity = UserWithPermission.new
      end
      it 'should have no relationships to destroy' 

    end

    context 'with an existing record' do
      before :each do
        @entity = UserWithPermission.create

        @permission1 = Permission.create(user_id: 1, group_id: 1, asset_id: @entity.id, asset_type: 'UserWithPermission')
        @permission2 = Permission.create(user_id: 1, group_id: 2, asset_id: @entity.id, asset_type: 'UserWithPermission')
      end
      it 'should remove the related permissions' 

    end
  end
end

