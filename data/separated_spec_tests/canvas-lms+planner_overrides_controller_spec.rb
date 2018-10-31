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

require_relative '../sharding_spec_helper'

describe PlannerOverridesController do
  before :once do
    course_with_teacher(active_all: true)
    student_in_course(active_all: true)
    @group = @course.assignment_groups.create(:name => "some group")
    @assignment = course_assignment
    @assignment2 = course_assignment
    @planner_override = PlannerOverride.create!(plannable_id: @assignment.id,
                                                plannable_type: "Assignment",
                                                marked_complete: false,
                                                user_id: @student.id)
  end

  def course_assignment
    assignment = @course.assignments.create(
      :title => "some assignment #{@course.assignments.count}",
      :assignment_group => @group,
      :due_at => Time.zone.now + 1.week
    )
    assignment
  end

  context "unauthenticated" do
    it "should return unauthorized" 

  end

  context "as student" do
    before :each do
      user_session(@student)
      @course.root_account.enable_feature!(:student_planner)
    end

    describe "GET #index" do
      it "returns http success" 

    end

    describe "GET #show" do
      it "returns http success" 

    end

    describe "PUT #update" do
      it "returns http success" 


      it "invalidates the planner cache" 

    end

    describe "POST #create" do
      it "returns http success" 


      it "invalidates the planner cache" 


      it "should save announcement overrides with a plannable_type of announcement" 

    end

    describe "DELETE #destroy" do
      it "returns http success" 


      it "invalidates the planner cache" 

    end
  end
end

