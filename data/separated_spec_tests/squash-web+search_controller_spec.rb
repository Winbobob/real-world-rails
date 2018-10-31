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

RSpec.describe SearchController, type: :controller do
  before :each do
    @project     = FactoryGirl.create(:project, name: 'Example Project')
    @environment = FactoryGirl.create(:environment, name: 'production', project: @project)
    @bug         = FactoryGirl.create(:bug, environment: @environment)
    @occurrence  = FactoryGirl.create(:rails_occurrence, bug: @bug)

    FactoryGirl.create :project, name: 'Example Other'
    FactoryGirl.create :environment, name: 'prodother', project: @project
    FactoryGirl.create :environment, name: 'producother'
  end

  describe "#search" do
    context "[user]" do
      it "should respond with the URL for a user given a @username" 


      it "should respond with nil for an unknown username" 

    end

    context "[project]" do
      it "should respond with the URL for a project given a project slug" 


      it "should respond with the URL for a project given a project prefix" 


      it "should respond with nil given an unknown project" 


      it "should respond with nil given an ambiguous project prefix" 

    end

    context "[environment]" do
      it "should respond with the URL for an environment given a project & environment slug" 


      it "should respond with the URL for an environment given a project & environment prefix" 


      it "should respond with nil given an unknown project" 


      it "should respond with nil given an unknown environment" 


      it "should respond with nil given an ambiguous project prefix" 


      it "should respond with nil given an ambiguous environment prefix" 

    end

    context "[bug]" do
      it "should respond with the URL for a bug given a project & environment slug and bug number" 


      it "should respond with the URL for a bug given a project & environment prefix and bug number" 


      it "should respond with nil given an unknown project" 


      it "should respond with nil given an unknown environment" 


      it "should respond with nil given an unknown bug number" 


      it "should respond with nil given an ambiguous project prefix" 


      it "should respond with nil given an ambiguous environment prefix" 

    end

    context "[occurrence]" do
      it "should respond with the URL for an occurrence given a project & environment slug and bug & occurrence number" 


      it "should respond with the URL for an occurrence given a project & environment prefix and a bug & occurrence number" 


      it "should respond with nil given an unknown project" 


      it "should respond with nil given an unknown environment" 


      it "should respond with nil given an unknown occurrence number" 


      it "should respond with nil given an unknown bug number" 


      it "should respond with nil given an ambiguous project prefix" 


      it "should respond with nil given an ambiguous environment prefix" 

    end
  end

  describe "#suggestions" do
    before :all do
      Environment.delete_all
      Project.delete_all
      Slug.delete_all
      User.delete_all
      Rails.cache.clear
    end

    context "[user]" do
      it "should respond with a list of username suggestions" 

    end

    context "[project]" do
      it "should respond with a list of project suggestions" 

    end

    context "[environment]" do
      it "should respond with a list of environment suggestions" 


      it "should respond with an empty list for an unknown project" 

    end

    context "[bug]" do
      before(:all) { @bug = FactoryGirl.create :bug }

      it "should respond with the bug" 


      it "should respond with an empty list for an unknown project" 


      it "should respond with an empty list for an unknown environment" 


      it "should respond with an empty list for an unknown bug" 

    end

    context "[occurrence]" do
      before(:all) { @occurrence = FactoryGirl.create(:rails_occurrence) }

      it "should respond with the occurrence" 


      it "should respond with an empty list for an unknown project" 


      it "should respond with an empty list for an unknown environment" 


      it "should respond with an empty list for an unknown bug" 


      it "should respond with an empty list for an unknown occurrence" 

    end

    it "should respond with an empty list for other queries" 

  end
end

