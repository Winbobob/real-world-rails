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

RSpec.describe CommitsController, type: :controller do
  describe '#index' do
    before :all do
      Project.where(repository_url: 'https://github.com/RISCfuture/better_caller.git').delete_all
      @project = FactoryGirl.create(:project, repository_url: 'https://github.com/RISCfuture/better_caller.git')
    end

    it "should require a logged-in user" 


    context '[authenticated]' do
      before(:each) { login_as @project.owner }

      it "should return the 10 most recent commits" 

    end
  end

  describe "#context" do
    before :all do
      Project.where(repository_url: 'https://github.com/RISCfuture/better_caller.git').delete_all
      @project = FactoryGirl.create(:project, repository_url: 'https://github.com/RISCfuture/better_caller.git')
    end
    before(:each) { @valid_params = {project_id: @project.to_param, id: '30e7c2ff8758f4f19bfbc0a57e26c19ab69d1d44', file: 'lib/better_caller/extensions.rb', line: 7, format: 'json'} }

    it "should require a logged-in user" 


    context '[authenticated]' do
      before(:each) { login_as @project.owner }

      it "should return an error if the project has no repository" 


      it "should return an error if the file param is missing" 


      it "should return an error if the line param is missing" 


      it "should return an error if the line param is less than 1" 


      it "should return an error if the line param is greater than the number of lines in the file" 


      it "should use 3 lines of context by default" 


      it "should use 3 lines context if an invalid value for the context param is given" 


      it "should use a custom number of lines of context" 


      it "should clamp the context at the top of the file" 


      it "should clamp the context at the bottom of the file" 


      it "should return an error given a nonexistent path" 


      it "should update the repo given an unknown revision" 


      it "should return an error given a nonexistent file" 


      it "should pick an appropriate brush" 


      it "should return a correct first_line value" 


      it "should reject blank lines from the top of the snippet" 

    end
  end
end

