#
# Copyright (C) 2016 - present Instructure, Inc.
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

require 'spec_helper'

RSpec.describe GradebookSettingsController, type: :controller do
  let!(:teacher) do
    course_with_teacher
    @teacher
  end

  before do
    user_session(teacher)
    request.accept = "application/json"
  end

  describe "PUT update" do
    let(:json_response) { JSON.parse(response.body) }

    context "given valid params" do
      let(:show_settings) do
        {
          "enter_grades_as" => {
            "2301" => "points"
          },
          "filter_columns_by" => {
            "grading_period_id" => "1401",
            "assignment_group_id" => "888"
          },
          "filter_rows_by" => {
            "section_id" => "null"
          },
          "selected_view_options_filters" => ["assignmentGroups"],
          "show_inactive_enrollments" => "true", # values must be strings
          "show_concluded_enrollments" => "false",
          "show_unpublished_assignments" => "true",
          "student_column_display_as" => "last_first",
          "student_column_secondary_info" => "login_id",
          "sort_rows_by_column_id" => "student",
          "sort_rows_by_setting_key" => "sortable_name",
          "sort_rows_by_direction" => "descending",
          "colors" => {
            "late" => "#000000",
            "missing" => "#000001",
            "resubmitted" => "#000002",
            "dropped" => "#000003",
            "excused" => "#000004"
          }
        }
      end

      let(:show_settings_massaged) do
        show_settings.merge('filter_rows_by' => { 'section_id' => nil })
      end

      let(:valid_params) do
        {
          "course_id" => @course.id,
          "gradebook_settings" => show_settings
        }
      end

      it "saves new gradebook_settings in preferences" 


      it "transforms 'null' string values to nil" 


      it "allows saving gradebook settings for multiple courses" 


      it "is allowed for courses in concluded enrollment terms" 


      it "is allowed for courses with concluded workflow state" 

    end

    context "given invalid params" do
      it "give an error response" 


      it "does not store invalid status colors" 

    end
  end
end

