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

require_relative '../common'
require_relative '../helpers/assignments_common'

describe "assignments index grading period filter" do
  include_context "in-process server selenium tests"

  before(:once) do
    course_with_teacher(:active_all => true, :account => @account, :mgp_flag_enabled => true,
                        :grading_periods => [:old, :current, :future])
    @assignments = []
    GradingPeriod.for(@course).sort_by(&:start_date).each do |grading_period|
      @assignments << @course.assignments.create!(:name => grading_period.title, :due_at => grading_period.start_date + 1.second)
    end
    @undated_assignment = @course.assignments.create!(:name => "Undated")
  end

  def select_grading_period(index)
    f("#grading_period_selector option[value=\"#{index}\"]").click
    wait_for_animations
  end

  it "filters assignments by grading period" 


  it "retains the selected grading period in local storage" 


  context "VDD" do
    before(:once) do
      @vdd_assignment = @course.assignments.create! :name => "VDD", :due_at => 3.months.ago

      @other_section = @course.course_sections.create! :name => "other section"
      override = @vdd_assignment.assignment_overrides.build
      override.set = @other_section
      override.due_at_overridden = true
      override.due_at = 3.months.from_now
      override.save!
    end

    it "filters an assignment into all applicable grading periods for teachers" 


    it "uses the applicable due date for students" 

  end
end

