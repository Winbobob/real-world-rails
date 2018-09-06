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

RSpec.describe Service::JIRA do
  describe ".new_issue_link" do
    it "should return a proper issue link" 

  end

  describe ".issue" do
    it "should locate a JIRA issue by key" 


    it "should return nil for an unknown issue" 

  end

  describe ".statuses" do
    it "should return all known issue statuses" 

  end

  describe ".projects" do
    it "should return all known projects" 

  end
end unless Squash::Configuration.jira.disabled?

