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

RSpec.describe BugsController, type: :controller do
  describe "#index" do
    before :all do
      membership = FactoryGirl.create(:membership)
      @env       = FactoryGirl.create(:environment, project: membership.project)
      @bugs      = 10.times.map do |i|
        FactoryGirl.create :bug,
                           environment:      @env,
                           message_template: 'bug is ' + (i.even? ? 'even' : 'odd'),
                           irrelevant:       (i % 10 == 3)
        # set some random field values to filter on
      end
      @user      = membership.user

      # create an increasing number of occurrences per each bug
      # also creates a random first and latest occurrence
      @bugs.each_with_index do |bug, i|
        Bug.where(id: bug.id).update_all occurrences_count: i + 1,
                                         first_occurrence:  Time.now - rand*86400,
                                         latest_occurrence: Time.now - rand*86400
      end
      @bugs = @env.bugs(true).to_a # reload to get those fields set by triggers
    end

    before(:each) { stub_const 'BugsController::PER_PAGE', 5 } # speed it up

    def sort(bugs, field, reverse=false)
      bugs.sort_by! { |b| [b.send(field), b.number] }
      bugs.reverse! if reverse
      bugs
    end

    it "should require a logged-in user" 


    context '[authenticated]' do
      before(:each) { login_as @user }

      it_should_behave_like "action that 404s at appropriate times", :get, :index, 'polymorphic_params(@env, true)'

      context '[JSON]' do
        it "should load 50 of the most recently occurring bugs by default" 


        it "should also sort by first occurrence" 


        it "should also sort by occurrence count" 


        it "should return the next 50 bugs when given a last parameter" 


        it "should decorate the bug JSON" 


        it "should filter by bug attributes" 


        it "should treat deploy_id=nil as any deploy_id value" 


        it "should treat crashed=nil as any crashed value" 


        it "should treat assigned_user_id=anybody as all exceptions" 


        it "should treat assigned_user_id=nobody as all unassigned bugs" 


        it "should treat assigned_user_id=somebody as any assigned user" 


        it "should filter by search query" 


        it "should gracefully handle an invalid search query" 

      end
    end
  end

  describe "#show" do
    before(:each) do
      Project.where(repository_url: 'https://github.com/RISCfuture/better_caller.git').delete_all
      @project = FactoryGirl.create(:project, repository_url: 'https://github.com/RISCfuture/better_caller.git')
      @bug     = FactoryGirl.create(:bug, environment: FactoryGirl.create(:environment, project: @project))
      FactoryGirl.create :rails_occurrence, bug: @bug
      repo = double('Git::Repo')
    end

    it "should require a logged-in user" 


    context '[authenticated]' do
      before(:each) { login_as @bug.environment.project.owner }

      it_should_behave_like "action that 404s at appropriate times", :get, :show, 'polymorphic_params(@bug, false)'

      it "should set duplicate_of_number" 

    end
  end

  describe "#update" do
    before(:each) { @bug = FactoryGirl.create(:bug) }

    it "should require a logged-in user" 


    context '[authenticated]' do
      before(:each) { login_as @bug.environment.project.owner }

      it_should_behave_like "action that 404s at appropriate times", :patch, :update, 'polymorphic_params(@bug, false, bug: { fixed: true })'
      it_should_behave_like "singleton action that 404s at appropriate times", :patch, :update, 'polymorphic_params(@bug, false, bug: { fixed: true })'

      it "should update the bug" 


      it "should set the bug modifier" 


      it "should add a comment if in the params" 


      it "should not add a blank comment" 


      it "should limit owners to only updating owner-accessible fields"
      it "should limit admins to only updating admin-accessible fields"
      it "should limit members to only updating member-accessible fields"

      it "should set duplicate_of_id from duplicate_of_number" 


      it "should copy errors of duplicate_of_id to duplicate_of_number" 


      it "should add an error and not save the record if the duplicate-of number does not exist" 


      it "... unless no duplicate-of number was entered" 


      it "should allow the JIRA status to be nullified" 

    end
  end

  describe "#destroy" do
    before(:each) { @bug = FactoryGirl.create(:bug) }

    it "should require a logged-in user" 


    context '[authenticated]' do
      before(:each) { login_as @bug.environment.project.owner }

      it_should_behave_like "action that 404s at appropriate times", :delete, :destroy, 'polymorphic_params(@bug, false)'
      it_should_behave_like "singleton action that 404s at appropriate times", :delete, :destroy, 'polymorphic_params(@bug, false)'

      it "should destroy the bug" 


      it "should redirect with a notice" 

    end
  end

  describe "#watch" do
    before(:each) { @bug = FactoryGirl.create(:bug) }

    it "should require a logged-in user" 


    context '[authenticated]' do
      before(:each) { login_as(@user = @bug.environment.project.owner) }

      it_should_behave_like "action that 404s at appropriate times", :post, :watch, 'polymorphic_params(@bug, false, format: "json")'
      it_should_behave_like "singleton action that 404s at appropriate times", :post, :watch, 'polymorphic_params(@bug, false, format: "json")'

      it "should watch an unwatched bug" 


      it "should unwatch a watched bug" 

    end
  end

  describe "#notify_deploy" do
    before(:each) { @bug = FactoryGirl.create(:bug) }

    it "should require a logged-in user" 


    context '[authenticated]' do
      before(:each) { login_as(@user = @bug.environment.project.owner) }

      it_should_behave_like "action that 404s at appropriate times", :post, :notify_deploy, 'polymorphic_params(@bug, false, format: "json")'
      it_should_behave_like "singleton action that 404s at appropriate times", :post, :notify_deploy, 'polymorphic_params(@bug, false, format: "json")'

      it "should add the current user to the deploy notifications list" 


      it "should remove the current user from the deploy notifications list" 

    end
  end

  describe "#notify_occurrence" do
    before(:each) { @bug = FactoryGirl.create(:bug) }

    it "should require a logged-in user" 


    context '[authenticated]' do
      before(:each) { login_as(@user = @bug.environment.project.owner) }

      it_should_behave_like "action that 404s at appropriate times", :post, :notify_occurrence, 'polymorphic_params(@bug, false, format: "json")'
      it_should_behave_like "singleton action that 404s at appropriate times", :post, :notify_occurrence, 'polymorphic_params(@bug, false, format: "json")'

      it "should add the current user to the occurrence notifications list" 


      it "should remove the current user from the occurrence notifications list" 

    end
  end
end

