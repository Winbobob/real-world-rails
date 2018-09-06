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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')
require 'lib/data_fixup/remove_extraneous_conversation_tags.rb'

describe 'DataFixup::RemoveExtraneousConversationTags' do
  before do
    @u1 = student_in_course(:active_all => true).user
    @u2 = student_in_course(:active_all => true, :course => @course).user
    @course1 = @course
    @course2 = course_factory(active_all: true)
    @course2.enroll_student(@u1).update_attribute(:workflow_state, 'active')
    @conversation = Conversation.initiate([@u1, @u2], true)
    @conversation.add_message(@u1, 'test', :tags => [@course1.asset_string])
    @message = @conversation.add_message(@u1, 'test')
    @cp1 = @u1.conversations.first
    @cp2 = @u2.conversations.first
  end

  describe "up" do
    it "should work" 

  end

  describe "fix_private_conversation!" do
    it "should remove tags not shared by at least two participants" 


    it "should fix invalid participant tags even if the conversation's tags are correct" 


    it "should do nothing if the tags are already correct" 

  end
end

