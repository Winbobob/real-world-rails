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

require_relative '../common'
require_relative '../helpers/blueprint_common'


describe "master courses - add and remove course associations" do
  include_context "in-process server selenium tests"
  include BlueprintCourseCommon

  before :once do
    # create the master course
    Account.default.enable_feature!(:master_courses)
    @master = course_factory(active_all: true)
    @template = MasterCourses::MasterTemplate.set_as_master_course(@master)

    # create some courses
    @master_course = course_factory(:active_all => true)
    @template = MasterCourses::MasterTemplate.set_as_master_course(@master_course)
    @course0 = Course.create!(
      :account => @account, :name => "AlphaDog", :course_code => "CCC1", :sis_source_id => "SIS_A1"
    )
    @course0.offer!
    @course1 = Course.create!(
      :account => @account, :name => "AlphaMale", :course_code => "CCC2", :sis_source_id => "SIS_A2"
    )
    @course1.offer!
    c = Course.create!(
      :account => @account, :name => "Alphabet", :course_code => "CCC3", :sis_source_id => "SIS_A3"
    )
    c.offer!
    c = Course.create!(
      :account => @account, :name => "BetaCarotine", :course_code => "DDD4", :sis_source_id => "SIS_B4"
    )
    c.offer!
    c = Course.create!(
      :account => @account, :name => "BetaGetOuttaHere", :course_code => "DDD5", :sis_source_id => "SIS_B5"
    )
    c.offer!

    account_admin_user(active_all: true)
  end

  before :each do
    user_session(@admin)
  end

  it "should add associated courses", priority: "1", test_id: "3078972" 


  it "should remove an associated course", priority: "1", test_id: "3077488" 


  it "should add and remove a to-be-added course", priority: "1", test_id: "3077487" 

end

