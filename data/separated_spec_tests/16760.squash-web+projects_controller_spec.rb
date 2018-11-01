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

RSpec.describe ProjectsController, type: :controller do
  describe "#index" do
    before(:all) { @user = FactoryGirl.create(:user) }

    it "should require a logged-in user" 


    context '[authenticated]' do
      before :all do
        26.times { |i| FactoryGirl.create :project, name: "Find me #{i}" }
        FactoryGirl.create :project, name: "Red Herring"
      end

      before(:each) { login_as @user }

      context '[JSON]' do
        it "should find up to 25 projects by search query" 


        it "should return all projects if the query is empty" 

      end
    end
  end

  describe "#create" do
    it "should require a logged-in user" 


    context '[authenticated]' do
      before :each do
        login_as(@user = FactoryGirl.create(:user))
        Project.delete_all
      end

      it "should create the new project" 


      it "should validate project connectivity" 


      it "should not allow protected fields to be set"
    end
  end

  describe "#edit" do
    before(:each) { @project = FactoryGirl.create(:project) }

    it "should require a logged-in user" 


    it "should allow a project member" 


    it "should allow a project admin" 


    context '[authenticated]' do
      before(:each) { login_as @project.owner }

      it "should create filter_paths_string and whitelist_paths_string attributes" 

    end
  end

  describe "#update" do
    before :each do
      Project.delete_all
      @project = FactoryGirl.create(:project, repository_url: 'https://github.com/RISCfuture/better_caller.git')
    end

    it "should require a logged-in user" 


    context '[authenticated]' do
      before(:each) { login_as @project.owner }

      it "should not allow admins to alter the project owner" 


      it "should not allow members to alter the project" 


      it "should allow owners to alter the project" 


      it "should convert filter_paths_string into filter_paths" 


      it "should convert whitelist_paths_string into whitelist_paths" 


      it "should not allow protected fields to be set"

      it "should set Project#uses_releases_override if uses_releases is changed" 


      it "should not set Project#uses_releases_override if uses_releases is not changed" 

    end
  end

  describe "#rekey" do
      before(:each) { @project = FactoryGirl.create(:project) }

      it "should require a logged-in user" 


      context '[authenticated]' do
        before(:each) { login_as @project.owner }

        it "should not allow members to generate an API key" 


        it "should allow admins to generate an API key" 


        it "should allow owners to generate an API key" 

      end
    end

  describe "#destroy" do
    before(:each) { @project = FactoryGirl.create(:project) }

    it "should require a logged-in user" 


    context '[authenticated]' do
      before(:each) { login_as @project.owner }

      it "should not allow admins to delete the project" 


      it "should not allow members to delete the project" 


      it "should allow owners to delete project" 

    end
  end
end

