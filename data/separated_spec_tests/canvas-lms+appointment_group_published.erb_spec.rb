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

describe 'appointment_group_published' do
  include MessagesCommon

  before :once do
    course_with_student(:active_all => true)
    @cat = @course.group_categories.create(:name => 'teh category')
    appointment_group_model(:contexts => [@course], :sub_context => @cat)
  end

  let(:notification_name) { :appointment_group_published }
  let(:asset) { @appointment_group }
  let(:message_data) { { user: @user } }

  context ".email" do
    let(:path_type) { :email }
    it "should render" 


    it "should render for groups" 

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

