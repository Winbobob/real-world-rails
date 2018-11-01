# encoding: utf-8

# Copyright 2014 Square Inc.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "#index" do
    before :all do
      membership = FactoryGirl.create(:membership)
      @env       = FactoryGirl.create(:environment, project: membership.project)
      @bug       = FactoryGirl.create(:bug, environment: @env)
      @comments  = FactoryGirl.create_list(:comment, 100, bug: @bug, user: @bug.environment.project.owner)
      @user      = membership.user
    end

    it "should require a logged-in user" 


    context '[authenticated]' do
      before(:each) { login_as @user }

      it_should_behave_like "action that 404s at appropriate times", :get, :index, 'polymorphic_params(@bug, true)'

      it "should load the 50 most recent comments" 


      it "should return the next 50 comments when given a last parameter" 


      it "should decorate the response" 

    end
  end

  describe "#create" do
    before :all do
      membership = FactoryGirl.create(:membership)
      @env       = FactoryGirl.create(:environment, project: membership.project)
      @bug       = FactoryGirl.create(:bug, environment: @env)
      @user      = membership.user
    end

    it "should require a logged-in user" 


    context '[authenticated]' do
      before(:each) { login_as @bug.environment.project.owner }

      it_should_behave_like "action that 404s at appropriate times", :get, :index, 'polymorphic_params(@bug, true)'

      it "should create the comment" 


      it "should discard fields not accessible to creators" 


      it "should render the errors with status 422 if invalid" 

    end
  end

  describe "#update" do
    before(:each) { @comment = FactoryGirl.create(:comment) }

    it "should require a logged-in user" 


    context '[authenticated]' do
      before(:each) { login_as @comment.user }

      it_should_behave_like "action that 404s at appropriate times", :get, :index, 'polymorphic_params(@comment, false)'
      it_should_behave_like "singleton action that 404s at appropriate times", :patch, :update, 'polymorphic_params(@comment, false, bug: { fixed: true })'

      it "should update the comment" 


      it "should allow admins to update any comment" 


      it "should allow owners to update any comment" 


      it "should not allow other members to update any comment" 


      it "should not allow inaccessible fields to be updated" 

    end
  end

  describe "#destroy" do
    before(:each) { @comment = FactoryGirl.create(:comment) }

    it "should require a logged-in user" 


    context '[authenticated]' do
      before(:each) { login_as @comment.user }

      it_should_behave_like "action that 404s at appropriate times", :delete, :destroy, 'polymorphic_params(@comment, false, format: "json")'
      it_should_behave_like "singleton action that 404s at appropriate times", :delete, :destroy, 'polymorphic_params(@comment, false, bug: { fixed: true }, format: "json")'

      it "should destroy the comment" 

    end
  end
end

