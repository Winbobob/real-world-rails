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

RSpec.describe EmailsController, type: :controller do
  describe "#index" do
    before :each do
      @user   = FactoryGirl.create(:user)
      @emails = FactoryGirl.create_list(:email, 11, user: @user)
    end

    it "should require a logged in user" 


    context "[authenticated]" do
      before(:each) { login_as @user }

      it "should load the first 10 emails" 


      it "should filter emails given a query" 


      it "should not include primary emails" 


      it "should not include project-specific emails if project_id is not set" 


      it "should only include project-specific emails if project_id is set" 

    end
  end

  describe "#create" do
    before(:all) { @user = FactoryGirl.create(:user) }
    before(:each) { @user.emails.redirected.delete_all }

    it "should require a logged in user" 


    context "[authenticated]" do
      before(:each) { login_as @user }

      it "should create a new redirected email" 


      it "should not allow a primary email to be created" 


      it "should handle validation errors" 


      it "should set project_id if given" 

    end
  end

  describe "#destroy" do
    before(:all) { @user = FactoryGirl.create(:user) }

    before :each do
      @user.emails.redirected.delete_all
      @email = FactoryGirl.create(:email, user: @user)
    end

    it "should require a logged in user" 


    context "[authenticated]" do
      before(:each) { login_as @user }

      it "should 404 given an unknown email" 


      it "should not allow a primary email to be deleted" 


      it "should delete a redirected email" 

    end
  end
end

