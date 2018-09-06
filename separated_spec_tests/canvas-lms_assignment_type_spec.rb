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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../helpers/graphql_type_tester')

describe Types::AssignmentType do
  # create course
  let_once(:course) { course_factory(active_all: true) }

  # create users
  let_once(:teacher) do
      teacher_in_course(active_all:true, course: course)
      @teacher
  end
  let_once(:student) { student_in_course(course: course, active_all: true).user }

  # create assignment for course
  let(:assignment) do
    course.assignments.create(title: "some assignment",
                                   submission_types: ['online_text_entry'],
                                   workflow_state: "published")
  end
  # create assignment type from assignment
  let(:assignment_type) {GraphQLTypeTester.new(Types::AssignmentType, assignment)}

  it "has submissions that need grading" 


  it "has the same data" 


  describe "submissionsConnection" do
    let_once(:other_student) { student_in_course(course: course, active_all: true).user }

    it "returns 'real' submissions from with permissions" 


    it "can filter submissions according to workflow state" 

  end

  it "can access it's parent course" 


  it "has an assignmentGroup" 


  it "only returns valid submission types" 


  it "returns (valid) grading types" 

end

