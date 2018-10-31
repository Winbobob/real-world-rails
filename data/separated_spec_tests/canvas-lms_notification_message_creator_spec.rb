#
# Copyright (C) 2011 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../sharding_spec_helper.rb')

## Helpers
def notification_set(opts = {})
  user_opts = opts.delete(:user_opts) || {}
  notification_opts = opts.delete(:notification_opts)  || {}

  assignment_model
  notification_model({:subject => "<%= t :subject, 'This is 5!' %>", :name => "Test Name"}.merge(notification_opts))
  user_model({:workflow_state => 'registered'}.merge(user_opts))
  communication_channel_model.confirm!
  notification_policy_model(:notification => @notification,
                            :communication_channel => @communication_channel)

  @notification.reload
end

describe NotificationMessageCreator do
  context 'create_message' do
    before(:each) do
      allow_any_instance_of(Message).to receive(:get_template).and_return('template')
    end

    it "should only send dashboard messages for users with non-validated channels" 


    it "should only send messages to active communication channels" 


    it "should use the default channel if no policies apply" 


    it "should not use the default if a policy does apply" 


    it 'uses the default channel and the push channel if only the push channel has a policy' 


    it "should not send dispatch messages for pre-registered users" 


    it "should send registration messages for pre-registered users" 


    it "should send registration messages to the communication channels in the to list" 


    it "should send dashboard and dispatch messages for registered users based on default policies" 


    it "should not dispatch non-immediate message based on default policies" 


    it "should make a delayed message for each user policy with a delayed frequency" 


    it "should make a delayed message for the default channel based on the notification's default frequency when there is no policy on any channel for the notification" 


    it "should send dashboard (but not dispatch messages) for registered users based on default policies" 


    it "should not send dashboard messages for non-feed or non-dashboard messages" 


    it "should replace messages when a similar notification occurs" 


    it "should create stream items" 


    it "should not get confused with nil values in the to list" 


    it "should not send messages after the user's limit" 


    it "should not send to bouncing channels" 


    it "should not use notification policies for unconfirmed communication channels" 


    it "should not use notification policies for unconfirmed communication channels even if that's all the user has" 


    it "should force certain categories to send immediately" 


    it "should not use retired channels for summary messages" 


    it "should not use non-email channels for summary messages" 

  end

  context "localization" do
    before(:each) do
      notification_set
      allow_any_instance_of(Message).to receive(:body).and_return('template')
    end

    it "should translate ERB in the notification" 


    it "should disrespect browser locales" 


    it "should respect user locales" 


    it "should respect course locales" 


    it "should respect account locales" 

  end

  context "sharding" do
    specs_require_sharding

    it "should create the message on the user's shard" 


    it "should create policies and summary messages on the user's shard" 


    it "should properly find the root account for cross-shard summary messages" 


    it "should find an already existing notification policy" 

  end
end

