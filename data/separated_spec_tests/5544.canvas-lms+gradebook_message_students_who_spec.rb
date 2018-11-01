#
# Copyright (C) 2015 - present Instructure, Inc.
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

require_relative '../../helpers/gradebook_common'
require_relative '../../helpers/groups_common'

describe "gradebook - message students who" do
  include_context "in-process server selenium tests"
  include GradebookCommon
  include GroupsCommon

  before(:once) { gradebook_data_setup }
  before(:each) { user_session(@teacher) }

  it "should send messages" 


  it "should only send messages to students who have not submitted and have not been graded" 


  it "should send messages when Scored more than X points" 


  it "should have a Have not been graded option" 


  it "should create separate conversations" 


  it "allows the teacher to remove students from the message" 


  it "disables the submit button if all students are filtered out" 


  it "disables the submit button if all students are manually removed" 


  it "should not send messages to inactive students" 

end

