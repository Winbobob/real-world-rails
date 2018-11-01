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

RSpec.describe Project::MembershipsController, type: :controller do
  describe "#index" do
    before :all do
      @project            = FactoryGirl.create(:project)
      User.where("username LIKE 'filter-%'").delete_all
      @filter_memberships = 11.times.map { |i| FactoryGirl.create(:membership, project: @project, created_at: Time.now - 1.month, user: FactoryGirl.create(:user, username: "filter-#{i}")) }
      FactoryGirl.create_list :membership, 11, project: @project
      @memberships = @project.memberships.to_a # get the owner's membership too
    end

    it "should require a logged-in user" 


    context '[authenticated]' do
      before(:each) { login_as @project.owner }

      it "should only allow projects that exist" 


      context '[JSON]' do
        it "should load the first 10 memberships" 


        it "should filter memberships by name when a query is given" 

      end
    end
  end

  describe "#create" do
    before :all do
      @project = FactoryGirl.create(:project)
      FactoryGirl.create_list :membership, 100, project: @project
      @memberships = @project.memberships.to_a # get the owner's membership too
    end

    before(:each) { @user = FactoryGirl.create(:user) }

    it "should require a logged-in user" 


    context '[authenticated]' do
      before(:each) { login_as @project.owner }

      it "should only allow projects that exist and the user has a membership for" 


      it "should create the membership (created by owner)" 


      it "should allow admins to add members" 


      it "should not allow members to add other members" 


      it "should allow owners to create admins" 


      it "should not allow admins to create admins" 


      it "should render the errors with status 422 if invalid" 

    end
  end

  describe "#update" do
    before(:all) { @project = FactoryGirl.create(:project) }
    before(:each) { @membership = FactoryGirl.create(:membership, project: @project) }

    it "should require a logged-in administrator or owner" 


    context('[authenticated]') do
      before(:each) { login_as @project.owner }

      it "should only allow projects that exist and the user has a membership for" 


      it "should allow owners to promote or demote admins" 


      it "should not allow admins to promote or demote admins" 


      it "should render the errors with status 422 if invalid"
    end
  end

  describe "#destroy" do
    before(:all) { @project = FactoryGirl.create(:project) }
    before(:each) { @membership = FactoryGirl.create(:membership, project: @project) }

    it "should require a logged-in administrator or owner" 


    context '[authenticated]' do
      before(:each) { login_as @project.owner }

      it "should only allow projects that exist and the user has a membership for" 


      it "should destroy the membership" 


      it "should not allow admins to delete other admins" 


      it "should allow the owner to delete other admins" 

    end
  end
end

