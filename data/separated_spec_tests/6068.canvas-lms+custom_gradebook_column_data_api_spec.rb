#
# Copyright (C) 2011 Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')

describe CustomGradebookColumnDataApiController, type: :request do
  include Api
  include Api::V1::CustomGradebookColumn

  before :once do
    course_with_teacher active_all: true
    s1, s2 = 2.times.map { |i|
      @course.course_sections.create! name: "section #{i}"
    }
    @student1, @student2 = 2.times.map { user_factory(active_all: true) }
    s1.enroll_user @student1, 'StudentEnrollment', 'active'
    s2.enroll_user @student2, 'StudentEnrollment', 'active'

    @ta = user_factory(active_all: true)
    @course.enroll_user @ta, 'TaEnrollment',
      workflow_state: 'active', section: s2,
      limit_privileges_to_course_section: true

    @user = @teacher

    @col = @course.custom_gradebook_columns.create! title: "Notes", position: 1
    @second_col = @course.custom_gradebook_columns.create! title: "Notes2", position: 2
  end

  describe 'index' do
    before :once do
      [@student1, @student2].each_with_index { |s,i|
        @col.custom_gradebook_column_data.build(content: "Blah #{i}").tap { |d|
          d.user_id = s.id
          d.save!
        }
      }
    end

    it 'checks permissions' 


    it 'only shows students you have permission for' 


    it 'includes students with inactive enrollments' 


    it 'includes students with concluded enrollments' 


    it 'returns the column data' 


    it 'can paginate' 

  end

  describe 'update' do
    def update(student, content)
      api_call :put,
        "/api/v1/courses/#{@course.id}/custom_gradebook_columns/#{@col.id}/data/#{student.id}",
        {course_id: @course.to_param, id: @col.to_param,
         user_id: student.to_param, action: "update",
         controller: "custom_gradebook_column_data_api", format: "json"},
        "column_data[content]" => content
    end

    it 'checks permissions' 


    it 'only lets you make notes for students you can see' 


    it 'works for students with inactive enrollments' 


    it 'works for hidden custom columns' 


    it 'works for students with concluded enrollments' 


    it 'works' 

  end

  describe 'bulk update' do
    def bulk_update(args)
      api_call(:put,
        "/api/v1/courses/#{@course.id}/custom_gradebook_column_data",
        {
          course_id: @course.to_param,
          action: "bulk_update",
          controller: "custom_gradebook_column_data_api", format: "json"
        },
        {
          "column_data" => [
            {
              "column_id" => args.first[:column_id],
              "user_id" => args.first[:student_id],
              "content" => args.first[:content]
            }
          ]
        })
    end

    it 'passes the contents to the api call successfully' 


    it 'passes muliple contents to the api call successfully' 


    it 'throws 401 status when updating non existing student' 


    it 'throws 400 status when passing empty input' 


    it 'throws 400 status when passing empty array in column_data' 

  end
end

