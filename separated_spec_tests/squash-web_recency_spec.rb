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

RSpec.describe Blamer::Recency do
  before :each do
    Project.delete_all
    @project   = FactoryGirl.create(:project)
    @env       = FactoryGirl.create(:environment, project: @project)
    @bug       = FactoryGirl.create(:bug,
                                    file:            'lib/better_caller/extensions.rb',
                                    line:            2,
                                    environment:     @env,
                                    blamed_revision: '30e7c2ff8758f4f19bfbc0a57e26c19ab69d1d44')
    @shell_bug = FactoryGirl.build(:bug, environment: @env)
  end

  it "should raise an error if it can't find a commit" 


  it "should resolve duplicate bugs" 


  context "[hosted projects]" do
    it "should match an existing bug in the same environment" 


    it "should match an existing closed bug in the same environment" 


    it "should create a new bug if no existing bug could be found" 


    it "should not match an existing bug in a different environment" 


    it "should not match an existing bug of a different class name" 

  end

  context "[distributed projects]" do
    before :each do
      @deploy = FactoryGirl.create(:deploy, environment: @env, revision: '30e7c2ff8758f4f19bfbc0a57e26c19ab69d1d44')
      @deploy = FactoryGirl.create(:deploy, environment: @env, revision: '30e7c2ff8758f4f19bfbc0a57e26c19ab69d1d44')
      @bug.update_attribute :deploy, @deploy
    end

    it "should match an existing bug in the same deploy" 


    it "should match an existing closed bug in the same deploy" 


    it "should otherwise match an existing open bug in another deploy, and advance the deploy ID" 


    it "should not otherwise match an existing closed bug" 

  end

  context "[blame]" do
    it "should set the bug's file and line using git-blame" 


    it "should use the topmost file if the backtrace is all library files" 


    it "should use the topmost project file if none of the project files have associated commits" 


    it "should set special_file for unsymbolicated bugs" 


    it "should set special_file but use the backtrace elements for an obfuscated Java bug" 


    it "should abs Java line numbers, which can apparently be negative" 

  end

  context "[message filtering]" do
    it "should filter the message" 


    it "should use the DB error filters" 


    it "should not filter the message if filtering is disabled" 

  end

  context "[reopening]" do
    it "should not reopen a fixed but not deployed bug" 


    it "should reopen a fixed and deployed bug" 


    it "should reopen a fixed and stale bug" 


    it "should not reopen a distributed project's bug" 

  end
end


