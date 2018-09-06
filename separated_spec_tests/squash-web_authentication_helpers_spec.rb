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

class FakeController < ApplicationController
  def self.helper_method(*args) end
  def logger(*args) Rails.logger end
  def session() @session ||= Hash.new end

  def _current_user() @current_user end
  def _current_user=(u) @current_user = u end

  include AuthenticationHelpers
end

RSpec.describe AuthenticationHelpers, type: :integration do
  before(:all) { @user = FactoryGirl.create(:user) }
  before(:each) { @controller = FakeController.new }

  describe "#log_out" do
    it "should clear the session and @current_user" 

  end

  describe "#current_user" do
    it "should return the cached user" 


    it "should locate the user from the session" 


    it "should return nil if the session is blank, even if there is a cached user" 

  end

  describe "#logged_in?" do
    it "should return true if the user is logged in" 


    it "should return false if the user is logged out" 

  end

  describe "#logged_out?" do
    it "should return true if the user is logged out" 


    it "should return false if the user is logged in" 

  end

  describe "#login_required" do
    it "should return true if the user is logged in" 


    it "should return false and redirect if the user is logged out" 

  end

  describe "#must_be_unauthenticated" do
    it "should return false and redirect if the user is logged in" 


    it "should return true if the user is logged out" 

  end

  describe "#log_in_user" do
    it "should set the session and the cached user" 

  end
end

