#
# Copyright (C) 2012 - present Instructure, Inc.
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
require File.expand_path(File.dirname(__FILE__) + '/common')

describe "profile communication settings" do
  include_context "in-process server selenium tests"
  before :each do
    user_logged_in(:username => 'somebody@example.com')

    Notification.create(:name => "Conversation Message", :category => "DiscussionEntry")
    Notification.create(:name => "Added To Conversation", :category => "Discussion")
    Notification.create(:name => "GradingStuff1", :category => "Grading")
    @sub_comment = Notification.create(:name => "Submission Comment1", :category => "Submission Comment")
  end

  # Using javascript, trigger a mouseenter event to hide text and display buttons.
  def mouse_enter_cell(category, channel_id)
    driver.execute_script("$('#notification-preferences .comm-event-option[data-category=#{category}][data-channelid=#{channel_id}]').trigger('mouseenter')")
  end

  # Using javascript, trigger a mouseleave event to hide buttons and display text.
  def mouse_leave_cell(category, channel_id)
    driver.execute_script("$('#notification-preferences .comm-event-option[data-category=#{category}][data-channelid=#{channel_id}]').trigger('mouseleave')")
  end

  # Find the frequency cell for the category and channel.
  def find_frequency_cell(category, channel_id)
    fj("td.comm-event-option[data-category='#{category}'][data-channelid=#{channel_id}]")
  end

  it "should render" 


  it "should display the users email address as channel" 


  it "should display an SMS number as channel" 


  let(:sns_response) { double(data: {endpointarn: 'endpointarn'}) }
  let(:sns_client) { double(create_platform_endpoint: sns_response) }
  let(:sns_developer_key_sns_field) { sns_client }

  let(:sns_developer_key) do
    allow(DeveloperKey).to receive(:sns).and_return(sns_developer_key_sns_field)
    dk = DeveloperKey.default
    dk.sns_arn = 'apparn'
    dk.save!
    dk
  end

  let(:sns_access_token) { @user.access_tokens.create!(developer_key: sns_developer_key) }
  let(:sns_channel) { @user.communication_channels.create(path_type: CommunicationChannel::TYPE_PUSH, path: 'push') }

  it "should display an sns channel" 


  it "should only display asap and never for sns channels" 


  it "should load the initial state of a user-pref checkbox" 


  it "should save a user-pref checkbox change" 


  it "should load an existing frequency setting and save a change" 


  context "accessibility usage" do
    it "should be navigable by keyboard only"
  end
end

