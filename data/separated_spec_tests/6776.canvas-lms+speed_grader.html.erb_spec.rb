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

require_relative '../../spec_helper'
require_relative '../views_helper'
require_relative '../../selenium/helpers/groups_common'

describe "/gradebooks/speed_grader" do
  include GroupsCommon

  let(:locals) do
    { anonymize_students: false }
  end

  before(:once) do
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

    teacher_in_course(active_all: true)
    assign(:current_user, @teacher)
  end

  it "renders without error" 


  it "includes a mount pount for submission comments" 


  it "includes a mount pount for comment textarea" 


  it "includes a mount pount for speed grader settings" 


  it "includes a link back to the gradebook (gradebook by default)" 


  it 'includes the comment auto-save message' 


  it 'includes the link to publish' 


  it 'it renders the plagiarism resubmit button if the assignment has a plagiarism tool' 


  describe 'submission comments form' do
    it 'is rendered when @can_comment_on_submission is true' 


    it 'is not rendered when @can_comment_on_submission is false' 

  end

  describe 'mute button' do
    it 'is rendered' 


    it 'is enabled if user can mute assignment' 


    it 'is disabled if user cannot mute assignment' 

  end

  context 'when group assignment' do
    before do
      assign(:can_comment_on_submission, true)
    end

    it 'shows radio buttons if individually graded' 


    it 'renders hidden checkbox if group graded' 

  end

  context 'grading box' do
    let(:html) do
      render template: 'gradebooks/speed_grader', locals: locals
      Nokogiri::HTML.fragment(response.body)
    end

    it 'renders the possible points for a points-based assignment' 


    it 'renders rounded possible points for a non-GPA-scale-based assignment' 


    it 'renders a placeholder for the submission score for a non-points and non-GPA-scale-based assignment' 


    it 'does not render a placeholder for the submission score for a GPA-scale-based assignment' 

  end

  context "hide student names checkbox" do
    let(:html) do
      render template: "gradebooks/speed_grader", locals: locals
      Nokogiri::HTML.fragment(response.body)
    end

    before(:once) do
      @assignment = @course.assignments.create!(assignment_valid_attributes)
      assign(:assignment, @assignment)
    end

    it "is not rendered when anonymous grading is enabled" 


    it "is rendered when anonymous grading is not enabled" 

  end
end

