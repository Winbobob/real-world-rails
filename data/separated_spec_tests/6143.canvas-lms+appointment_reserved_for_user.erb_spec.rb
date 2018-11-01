#
# Copyright (C) 2017 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/messages_helper')

describe 'appointment_reserved_for_user' do
  include MessagesCommon

  before :once do
    @user = user_model
    @course = course_model
    cat = group_category
    @group = cat.groups.create(context: @course)
    @group.users << @user
    appointment_participant_model(participant: @group, course: @course)
  end

  let(:notification_name) { :appointment_reserved_for_user }
  let(:asset) { @event }
  let(:message_options) { { data: { updating_user_name: @teacher.name } } }

  context ".email" do
    let(:path_type) { :email }
    it "should render" 


    context "for groups" do
      it "should render group name" 

    end
  end

  context ".sms" do
    let(:path_type) { :sms }
    it "should render" 

  end

  context ".summary" do
    let(:path_type) { :summary }
    it "should render" 

  end

  context ".twitter" do
    let(:path_type) { :twitter }
    it "should render" 

  end
end

