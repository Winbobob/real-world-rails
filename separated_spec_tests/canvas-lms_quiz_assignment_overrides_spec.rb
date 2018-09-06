#
# Copyright (C) 2014 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../api_spec_helper')

describe Quizzes::QuizAssignmentOverridesController, type: :request do

  describe '[GET] /courses/:course_id/quizzes/assignment_overrides' do
    before do
      course_with_teacher(:active_all => true)
      @quiz  = @course.quizzes.create! title: 'title'
      @quiz.workflow_state = 'available'
      @quiz.build_assignment
      @quiz.publish!
      @quiz.reload
    end

    it "should require authorization" 


    it "should include visible overrides" 

  end
end

