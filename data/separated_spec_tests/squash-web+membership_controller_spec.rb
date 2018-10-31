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

RSpec.describe Project::MembershipController, type: :controller do
  describe "#join" do
    before :each do
      @project = FactoryGirl.create(:project)
      @user    = FactoryGirl.create(:user)
    end

    it "should require a logged-in user" 


    context "[authenticated]" do
      before(:each) { login_as @user }

      it "should redirect given an existing membership" 


      it "should create a new membership" 

    end
  end

  describe "#update" do
    before(:each) { @membership = FactoryGirl.create(:membership) }

    it "should require a logged-in user" 


    context "[authenticated]" do
      before(:each) { login_as @membership.user }

      it "should modify the membership" 


      it "should not allow protected attributes to be updated" 

    end
  end

  describe "#destroy" do
    before(:each) { @membership = FactoryGirl.create(:membership) }

    it "should require a logged-in user" 


    it "should not allow the owner to delete his/her project" 


    context "[authenticated]" do
      before(:each) { login_as @membership.user }

      it "should delete the membership" 

    end
  end
end

