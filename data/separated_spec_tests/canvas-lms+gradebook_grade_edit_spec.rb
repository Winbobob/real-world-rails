#
# Copyright (C) 2012 - present Instructure, Inc.
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

require_relative '../../helpers/gradebook_common'
require_relative '../pages/gradebook_page'
require_relative '../pages/grading_curve_page'

describe "editing grades" do
  include_context "in-process server selenium tests"
  include GradebookCommon

  before(:once) do
    gradebook_data_setup
  end

  before(:each) do
    user_session(@teacher)
  end

  after(:each) do
    clear_local_storage
  end

  context 'submission details dialog', priority: "1", test_id: 220305 do
    it 'successfully grades a submission' 

  end

  it "should update a graded quiz and have the points carry over to the quiz attempts page", priority: "1", test_id: 220310 do
    points = 50
    q = factory_with_protected_attributes(@course.quizzes, title: "new quiz", points_possible: points, quiz_type: 'assignment', workflow_state: 'available')
    q.save!
    qs = q.generate_submission(@student_1)
    Quizzes::SubmissionGrader.new(qs).grade_submission
    q.reload

    Gradebook.visit_gradebook(@course)
    edit_grade('#gradebook_grid .container_1 .slick-row:nth-child(1) .b5', points.to_s)

    get "/courses/#{@course.id}/quizzes/#{q.id}/history?quiz_submission_id=#{qs.id}"
    expect(f('.score_value')).to include_text points.to_s
    expect(f('#after_fudge_points_total')).to include_text points.to_s
  end

  it "should treat ungraded as 0s when asked, and ignore when not", priority: "1", test_id: 164222 do
    Gradebook.visit_gradebook(@course)

    # make sure it shows like it is not treating ungraded as 0's by default
    expect(is_checked('#include_ungraded_assignments')).to be_falsey
    expect(final_score_for_row(0)).to eq @student_1_total_ignoring_ungraded
    expect(final_score_for_row(1)).to eq @student_2_total_ignoring_ungraded

    # set the "treat ungraded as 0's" option in the header

    f('#gradebook_settings').click
    f('label[for="include_ungraded_assignments"]').click

    # now make sure that the grades show as if those ungraded assignments had a '0'
    expect(is_checked('#include_ungraded_assignments')).to be_truthy
    expect(final_score_for_row(0)).to eq @student_1_total_treating_ungraded_as_zeros
    expect(final_score_for_row(1)).to eq @student_2_total_treating_ungraded_as_zeros

    # reload the page and make sure it remembered the setting
    Gradebook.visit_gradebook(@course)
    expect(is_checked('#include_ungraded_assignments')).to be_truthy
    expect(final_score_for_row(0)).to eq @student_1_total_treating_ungraded_as_zeros
    expect(final_score_for_row(1)).to eq @student_2_total_treating_ungraded_as_zeros

    # NOTE: gradebook1 does not handle 'remembering' the `include_ungraded_assignments` setting

    # check that reverting back to unchecking 'include_ungraded_assignments' also reverts grades
    f('#gradebook_settings').click
    f('label[for="include_ungraded_assignments"]').click
    expect(is_checked('#include_ungraded_assignments')).to be_falsey
    expect(final_score_for_row(0)).to eq @student_1_total_ignoring_ungraded
    expect(final_score_for_row(1)).to eq @student_2_total_ignoring_ungraded
  end

  it "should validate initial grade totals are correct", priority: "1", test_id: 220311 do
    Gradebook.visit_gradebook(@course)

    expect(final_score_for_row(0)).to eq @student_1_total_ignoring_ungraded
    expect(final_score_for_row(1)).to eq @student_2_total_ignoring_ungraded
  end

  it "should change grades and validate course total is correct", priority: "1", test_id: 220312 do
    expected_edited_total = "33.33%"
    Gradebook.visit_gradebook(@course)

    # editing grade for first row, first cell
    edit_grade('#gradebook_grid .container_1 .slick-row:nth-child(1) .b2', 0)

    # editing grade for second row, first cell
    edit_grade('#gradebook_grid .container_1 .slick-row:nth-child(2) .b2', 0)

    # refresh page and make sure the grade sticks
    Gradebook.visit_gradebook(@course)
    expect(final_score_for_row(0)).to eq expected_edited_total
    expect(final_score_for_row(1)).to eq expected_edited_total
  end

  it "should allow setting a letter grade on a no-points assignment", priority: "1", test_id: 220313 do
    assignment_model(course: @course, grading_type: 'letter_grade', points_possible: nil, title: 'no-points')
    Gradebook.visit_gradebook(@course)

    edit_grade('#gradebook_grid .container_1 .slick-row:nth-child(1) .b5', 'A-')
    expect(f('#gradebook_grid .container_1 .slick-row:nth-child(1) .b5')).to include_text('A-')
    submissions = @assignment.submissions.where('grade is not null')
    expect(submissions.count).to eq 1
    sub = submissions.first
    expect(sub.grade).to eq 'A-'
    expect(sub.score).to eq 0.0
  end

  it "should not update default grades for users not in this section", priority: "1", test_id: 220314 do
    # create new user and section

    Gradebook.visit_gradebook(@course)
    switch_to_section(@other_section)

    set_default_grade(2, 13)
    @other_section.users.each { |u| expect(u.submissions.map(&:grade)).to include '13' }
    @course.default_section.users.each { |u| expect(u.submissions.map(&:grade)).not_to include '13' }
  end

  it "should edit a grade, move to the next cell and validate focus is not lost", priority: "1", test_id: 220318 do
    Gradebook.visit_gradebook(@course)

    first_cell = f('#gradebook_grid .container_1 .slick-row:nth-child(1) .b2')
    first_cell.click
    grade_input = first_cell.find_element(:css, '.grade')
    set_value(grade_input, 3)
    grade_input.send_keys(:tab)
    expect(f('#gradebook_grid .container_1 .slick-row:nth-child(1) .b3')).to have_class('editable')
  end

  it "should display dropped grades correctly after editing a grade", priority: "1", test_id: 220316 do
    @course.assignment_groups.first.update_attribute :rules, 'drop_lowest:1'
    Gradebook.visit_gradebook(@course)

    assignment_1_sel = '#gradebook_grid .container_1 .slick-row:nth-child(1) .b3'
    assignment_2_sel= '#gradebook_grid .container_1 .slick-row:nth-child(1) .b4'
    a1 = f(assignment_1_sel)
    a2 = f(assignment_2_sel)
    expect(a1).to have_class 'dropped'
    expect(a2).not_to have_class 'dropped'

    a2.click
    grade_input = a2.find_element(:css, '.grade')
    set_value(grade_input, 3)
    grade_input.send_keys(:tab)
    expect(f(assignment_1_sel)).not_to have_class 'dropped'
    expect(f(assignment_2_sel)).to have_class 'dropped'
  end

  it "should update a grade when clicking outside of slickgrid", priority: "1", test_id: 220319 do
    Gradebook.visit_gradebook(@course)

    first_cell = f('#gradebook_grid .container_1 .slick-row:nth-child(1) .b2')
    first_cell.click
    grade_input = first_cell.find_element(:css, '.grade')
    set_value(grade_input, 3)
    f('body').click
    expect(f("body")).not_to contain_css('.gradebook_cell_editable')
  end

  it "should validate curving grades option", priority: "1", test_id: 220320 do
    curved_grade_text = "8"

    Gradebook.visit_gradebook(@course)

    open_assignment_options(0)
    f('[data-action="curveGrades"]').click
    curve_form = GradingCurvePage.new
    curve_form.edit_grade_curve(curved_grade_text)
    curve_form.curve_grade_submit
    accept_alert
    expect(find_slick_cells(1, f('#gradebook_grid .container_1'))[0]).to include_text curved_grade_text
  end

  it "should optionally assign zeroes to unsubmitted assignments during curving", priority: "1", test_id: 220321 do
    skip_if_safari(:alert)
    Gradebook.visit_gradebook(@course)

    edit_grade('#gradebook_grid .container_1 .slick-row:nth-child(2) .b2', '')

    open_assignment_options(0)
    f('[data-action="curveGrades"]').click

    f('#assign_blanks').click
    fj('.ui-dialog-buttonpane button:visible').click
    accept_alert
    expect(find_slick_cells(1, f('#gradebook_grid .container_1'))[0]).to include_text '0'
  end

  it "should not factor non graded assignments into group total", priority: "1", test_id: 220323 do
    expected_totals = [@student_1_total_ignoring_ungraded, @student_2_total_ignoring_ungraded]
    ungraded_submission = @ungraded_assignment.submit_homework(@student_1, body: 'student 1 submission ungraded assignment')
    @ungraded_assignment.grade_student(@student_1, grade: 20, grader: @teacher)
    ungraded_submission.save!
    Gradebook.visit_gradebook(@course)
    assignment_group_cells = ff('.assignment-group-cell')
    expected_totals.zip(assignment_group_cells) do |expected, cell|
      expect(cell).to include_text expected
    end
  end

  it "should validate setting default grade for an assignment", priority: "1", test_id: 220383 do
    expected_grade = "45"
    Gradebook.visit_gradebook(@course)
    set_default_grade(2, expected_grade)
    grade_grid = f('#gradebook_grid .container_1')
    StudentEnrollment.count.times do |n|
      expect(find_slick_cells(n, grade_grid)[2]).to include_text expected_grade
    end
  end

  it "should display an error on failed updates", priority: "1", test_id: 220384 do
    # forces a 400
    expect_any_instance_of(SubmissionsApiController).to receive(:get_user_considering_section).and_return(nil)
    Gradebook.visit_gradebook(@course)
    edit_grade('#gradebook_grid .container_1 .slick-row:nth-child(1) .b2', 0)
    expect_flash_message :error, "refresh"
  end

  context "for a moderated assignment" do
    before(:each) do
      # turn on the moderation flag
      Account.default.enable_feature!(:anonymous_marking)

      # create 1 teacher
      @teacher_one = user_factory(active_all: true)
      @course.enroll_teacher(
        @teacher_one,
        enrollment_state: 'active'
      )

      now = Time.zone.now
      # create a moderated assignment
      @moderated_assignment = @course.assignments.create!(
        title: 'Moderated Assignment',
        submission_types: 'online_text_entry',
        grader_count: 1,
        final_grader: @teacher_one,
        due_at: 1.week.from_now(now),
        moderated_grading: true,
        points_possible: 10
      )

      user_session(@teacher_one)
      Gradebook.visit_gradebook(@course)
    end

    it "is not allowed until grades are posted", priority: "1", test_id: 3492444 do
      Gradebook.cell_click(3, 0)
      expect(Gradebook.grading_cell_attributes(3, 0).attribute("class")).to include "cannot_edit"
      expect(Gradebook.cell_tooltip(3, 0).text).to eq("Moderated Assignment")
    end

    it "is allowed if grades are posted ",priority: "1", test_id: 3492444 do
      @moderated_assignment.update!(grades_published_at: Time.zone.now)
      @moderated_assignment.unmute!
      refresh_page
      Gradebook.enter_grade("20000", 3, 0)
      expect(Gradebook.cell_graded?("20,000", 3, 0)).to be true
    end
  end

  context 'with grading periods' do
    before(:once) do
      root_account = @course.root_account = Account.default

      group = Factories::GradingPeriodGroupHelper.new.create_for_account(root_account)
      group.enrollment_terms << @course.enrollment_term
      group.save!

      period_helper = Factories::GradingPeriodHelper.new
      @first_period = period_helper.create_presets_for_group(group, :past).first
      @first_period.save!
      @second_period = period_helper.create_presets_for_group(group, :current).first
      @second_period.save!

      @first_assignment.due_at = @first_period.close_date - 1.day
      @first_assignment.save!
      @first_assignment.reload

      @second_assignment.due_at = @second_period.close_date - 1.day
      @second_assignment.save!
      @second_assignment.reload
    end

    context 'for assignments with at least one due date in a closed grading period' do
      before(:each) do
        get "/courses/#{@course.id}/gradebook?grading_period_id=0"
        Gradebook.assignment_header_menu_select(@first_assignment.id)
      end

      describe 'the Curve Grades menu item' do
        before(:each) do
          @curve_grades_menu_item = Gradebook.assignment_header_menu_item_find('Curve Grades')
        end

        it 'is disabled' 


        it 'gives an error when clicked' 

      end

      describe 'the Set Default Grade menu item' do
        before(:each) do
          @set_default_grade_menu_item = Gradebook.assignment_header_menu_item_find('Set Default Grade')
        end

        it 'is disabled' 


        it 'gives an error when clicked' 

      end
    end
  end
end

