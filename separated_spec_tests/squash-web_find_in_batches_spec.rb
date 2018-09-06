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

RSpec.describe "ActiveRecord::Base.find_in_batches" do
  context "[single surrogate key]" do
    before :all do
      Project.delete_all; User.delete_all
      @users = FactoryGirl.create_list(:user, 48).in_groups_of(10, false)
    end

    before(:each) { @batches = [] }

    it "should yield all records for lists < batch size" 


    it "should yield all records for lists = batch size" 


    it "should yield groups of records for lists > batch size" 


    it "should allow a custom start" 

  end

  context "[composite primary keys]" do
    before :all do
      Membership.delete_all
      project = FactoryGirl.create(:project)
      FactoryGirl.create_list(:membership, 47, project: project)
      @memberships = Membership.order(Membership.all.send(:batch_order)).in_groups_of(10, false) # get project owner membership
    end

    before(:each) { @batches = [] }

    it "should yield all records for lists < batch size" 


    it "should yield all records for lists = batch size" 


    it "should yield groups of records for lists > batch size" 


    it "should allow a custom start" 

  end
end

