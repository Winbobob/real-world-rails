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

require File.expand_path(File.dirname(__FILE__) + '/../../common')
require File.expand_path(File.dirname(__FILE__) + '/../../helpers/calendar2_common')

describe "calendar2" do
  include_context "in-process server selenium tests"
  include Calendar2Common

  before(:each) do
    enable_all_rcs Account.default
    Account.default.tap do |a|
      a.settings[:show_scheduler]   = true
      a.save!
    end
  end

  context "as a teacher" do
    before(:each) do
      course_with_teacher_logged_in
      enable_all_rcs @course.account
      stub_rcs_config
    end

    describe "main month calendar" do

      it "more options link on assignments should go to assignment edit page" 


      it "should publish a new assignment when toggle is clicked" 

    end
  end
end

