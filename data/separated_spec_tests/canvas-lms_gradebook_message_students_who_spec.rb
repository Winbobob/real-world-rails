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

require_relative '../../helpers/gradezilla_common'
require_relative '../../helpers/groups_common'
require_relative '../pages/gradezilla_cells_page'
require_relative '../pages/gradezilla_page'

describe "Gradezilla - message students who" do
  include_context "in-process server selenium tests"
  include GradezillaCommon
  include GroupsCommon

  before(:once) { gradebook_data_setup }
  before do
    Account.default.enable_feature!(:new_gradebook)
    user_session(@teacher)
  end

  it "should send messages" 


  it "should only send messages to students who have not submitted and have not been graded" 


  it "should send messages when Scored more than X points" 


  it "should show not-submitted students", priority: "2", test_id: 3265183 do
    # student 2 has submitted assignment 3, but it hasn't been graded
    submission = @third_assignment.submit_homework(@student_2, :body => 'student 2 submission assignment 3')
    submission.save!

    Gradezilla.visit(@course)
    Gradezilla.click_assignment_header_menu_element(@third_assignment.id, "message students")
    # expect dialog to show Student1 and Student3
    visible_students = ffj('.student_list li:visible')

    expect(visible_students).to have_size 2
    expect(visible_students[0]).to include_text @student_name_1
  end

  it "should show ungraded students", priority: "2", test_id: 3440541 do
    # student 2 has submitted assignment 3, but it hasn't been graded
    submission = @third_assignment.submit_homework(@student_2, :body => 'student 2 submission assignment 3')
    submission.save!
    # set grade for first student, 3rd assignment
    @third_assignment.grade_student(@student_1, grade: 50, grader: @teacher)
    Gradezilla.visit(@course)
    Gradezilla.click_assignment_header_menu_element(@third_assignment.id, "message students")
    # expect dialog to show Student2 & Student3
    click_option('#message_assignment_recipients .message_types', "Haven't been graded")
    visible_students = ffj('.student_list li:visible')

    expect(visible_students).to have_size 2
    expect(visible_students[0]).to include_text @student_name_2
    expect(visible_students[1]).to include_text @student_name_3
  end

  it "should create separate conversations" 


  it "allows the teacher to remove students from the message" 


  it "disables the submit button if all students are filtered out" 


  it "disables the submit button if all students are manually removed" 


  it "should not send messages to inactive students" 

end

