
#
# Copyright (C) 2011 - 2013 Instructure, Inc.
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
require File.expand_path(File.dirname(__FILE__) + '/../file_uploads_spec_helper')

describe 'Submissions Comment API', type: :request do

  describe '#create_file' do
    before :once do
      teacher_in_course active_all: true
      student_in_course active_all: true
      @assignment = @course.assignments.create! name: "blah",
        submission_types: "online_upload"
    end

    include_examples "file uploads api"
    def has_query_exemption?; true; end

    def preflight(preflight_params)
      api_call :post,
        "/api/v1/courses/#{@course.id}/assignments/#{@assignment.id}/submissions/#{@student.id}/comments/files",
      {controller: "submission_comments_api", action: "create_file",
       format: "json", course_id: @course.to_param,
       assignment_id: @assignment.to_param, user_id: @student.to_param},
       preflight_params
    end


    it "checks permissions" 


    it "creates an attachment with the right the user_id" 

  end

end

