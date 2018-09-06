#
# Copyright (C) 2011 - present Instructure, Inc.
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
require File.expand_path(File.dirname(__FILE__) + '/../views_helper')
require_relative '../../selenium/helpers/groups_common'

describe "/gradebooks/speed_grader" do
  include GroupsCommon

  before do
    course_with_student(active_all: true)
    view_context
    assign(:students, [@user])

    @group_category = @course.group_categories.create!(name: "Test Group Set")
    @group = @course.groups.create!(name: "a group", group_category: @group_category)
    add_user_to_group(@user, @group, true)
    @assignment = @course.assignments.create!(assignment_valid_attributes.merge(
      group_category: @group_category,
      grade_group_students_individually: true
    ))

    assign(:assignment, @assignment)
    assign(:submissions, [])
    assign(:assessments, [])
    assign(:body_classes, [])
  end

  it "should render" 


  it "includes a link back to the gradebook (gradebook by default)" 


  it 'includes the comment auto-save message' 


  it 'includes the link to publish' 


  it 'it renders the plagiarism resubmit button if the assignment has a plagiarism tool' 


  describe 'submission comments form' do
    it 'is rendered when @can_comment_on_submission is true' 


    it 'is not rendered when @can_comment_on_submission is false' 

  end

  context 'when group assignment' do
    before do
      assign(:can_comment_on_submission, true)
    end

    it 'shows radio buttons if individually graded' 


    it 'renders hidden checkbox if group graded' 

  end
end

