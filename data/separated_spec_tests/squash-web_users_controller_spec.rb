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

RSpec.describe UsersController, type: :controller do
  describe "#index" do
    before :all do
      [Project, User].each &:destroy_all
      @users = 20.times.map { |i| FactoryGirl.create :user, username: "filter-#{i}" }
    end

    it "should require a logged-in user" 


    context '[authenticated]' do
      before(:each) { login_as @users.first } # log in as any user

      it "should return an empty array given no query" 


      it "should load the first 10 filtered users sorted by username" 


      it "should include membership information when given a project ID" 


      it "should load the next 10 filtered users when given a last parameter" 

    end
  end

  describe "#create" do
    before :each do
      User.where(username: 'newguy').delete_all
      @attrs = {
          'username'              => 'newguy',
          'password'              => 'newguy123',
          'password_confirmation' => 'newguy123',
          'first_name'            => 'New',
          'last_name'             => 'Guy',
          'email_address'         => 'new@guy.example.com'
      }
    end

    if Squash::Configuration.authentication.registration_enabled?
      it "should create the new user" 


      it "should log the new user in" 


      it "should redirect to the :next parameter" 


      it "should render the login page for invalid attributes" 

    else
      it "should not be possible to create a new user" 

    end
  end if Squash::Configuration.authentication.strategy == 'password'
end

