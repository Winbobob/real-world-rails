#
# Copyright (C) 2012 - 2013 Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#
require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')

describe 'Account Notification API', type: :request do
  include Api
  include Api::V1::AccountNotifications

  before do
    @admin = account_admin_user
    user_with_pseudonym(:user => @admin)
  end

  describe 'user_index' do
    before do
      account_notification(message: 'default')
      @path = "/api/v1/accounts/#{@admin.account.id}/account_notifications"
      @api_params = {controller: 'account_notifications',
                     action: 'user_index',
                     format: 'json',
                     account_id: @admin.account.id.to_s}
    end

    it "should list notifications" 


    it "should still work on the old endpoint" 


    it "should catch a user_id mismatch on the old endpoint" 

  end

  describe 'show' do
    before do
      @an = account_notification(message: 'default')
      @path = "/api/v1/accounts/#{@admin.account.id}/account_notifications/#{@an.id}"
      @api_params = {controller: 'account_notifications',
                     action: 'show',
                     format: 'json',
                     id: @an.id,
                     account_id: @admin.account.id.to_s}
    end

    it "should show a notification" 


    it "should show the notification as a non admin" 

  end

  describe 'user_close_notification' do
    before do
      @a = account_notification(message: 'default')
      @path = "/api/v1/accounts/#{@admin.account.id}/account_notifications/#{@a.id}"
      @api_params = {controller: 'account_notifications',
                     action: 'user_close_notification',
                     format: 'json',
                     id: @a.id.to_param,
                     account_id: @admin.account.id.to_s}
    end

    it "should close notifications" 

  end

  describe 'create' do
    before :each do
      @path = "/api/v1/accounts/#{@admin.account.id}/account_notifications"
      @api_params = { :controller => 'account_notifications',
                      :action => 'create',
                      :format => 'json',
                      :account_id => @admin.account.id.to_s }
      @start_at = DateTime.now.utc
      @end_at = (DateTime.now + 1.day).utc
    end

   it 'should create an account notification' 
    it 'should default icon to warning' 


    it 'should create an account notification for specific roles using the old role names' 


    it 'should create an account notification for specific roles using role ids' 


    it 'should create an account notification for specific course-level roles using role ids' 


    it 'should create an account notification for the "nil enrollment"' 


    it 'should return not authorized for non admin user' 


    it 'should return an error for missing required params' 


    it 'should return an error for malformed dates' 


    it 'should not allow an end date to be before a start date' 

  end

  describe 'update' do
    before :each do
      @notification = account_notification(message: 'default')
      @path = "/api/v1/accounts/#{@admin.account.id}/account_notifications/#{@notification.id}"
      @api_params = { :controller => 'account_notifications',
                      :action => 'update',
                      :format => 'json',
                      :account_id => @admin.account.id.to_s,
                      :id => @notification.id.to_s }
      @start_at = Time.zone.now
      @end_at = Time.zone.now + 1.day
    end

    it 'should return not authorized for non admin user' 


    it 'should update an existing account notification' 


    it 'should update an account notification for specific roles using role names' 

  end
end

