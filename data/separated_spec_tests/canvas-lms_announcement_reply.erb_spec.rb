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

describe 'announcement_reply' do
  include MessagesCommon

  before :once do
    course_with_teacher(active_all: true)
    @announcement = announcement_model(user: @teacher, discussion_type: 'threaded')
    @announcement.reply_from(user: @teacher, text: 'hai')
  end

  let(:notification_name) { :announcement_reply }
  let(:asset) { @announcement }

  context ".email" do
    let(:path_type) { :email }

    it "should render" 


    it "should render correct footer if replys are enabled" 


    it "should render correct footer if replys are disabled" 


    it "the url to the image should exist on the internet" 

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

