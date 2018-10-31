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

require_relative '../../helpers/gradebook_common'
require_relative '../../helpers/groups_common'
require_relative '../pages/gradebook_page'

describe "gradebook" do
  include_context "in-process server selenium tests"
  include GradebookCommon
  include GroupsCommon

  before(:once) do
    gradebook_data_setup
  end

  before(:each) { user_session(@teacher) }

  it "page should load within acceptable time ", priority:"1" 


  it "hides unpublished/shows published assignments", priority: "1", test_id: 210016 do
    assignment = @course.assignments.create! title: 'unpublished'
    assignment.unpublish
    Gradebook.visit_gradebook(@course)
    expect(f('#gradebook_grid .container_1 .slick-header')).not_to include_text(assignment.title)

    @first_assignment.publish
    Gradebook.visit_gradebook(@course)
    expect(f('#gradebook_grid .container_1 .slick-header')).to include_text(@first_assignment.title)
  end

  it "should not show 'not-graded' assignments", priority: "1", test_id: 210017 do
    get "/courses/#{@course.id}/gradebook"

    expect(f('.slick-header-columns')).not_to include_text(@ungraded_assignment.title)
  end

  def filter_student(text)
    f('.gradebook_filter input').send_keys text
    sleep 1 # InputFilter has a delay
  end

  def visible_students
    ff('.student-name')
  end

  it 'should filter students', priority: "1", test_id: 210018 do
    Gradebook.visit_gradebook(@course)
    expect(visible_students).to have_size @all_students.size
    filter_student 'student 1'
    visible_after_filtering = visible_students
    expect(visible_after_filtering).to have_size 1
    expect(visible_after_filtering[0]).to include_text 'student 1'
  end

  it "should validate correct number of students showing up in gradebook", priority: "1", test_id: 210019 do
    get "/courses/#{@course.id}/gradebook"

    expect(ff('.student-name')).to have_size @course.students.count
  end

  it "should show students sorted by their sortable_name", priority: "1", test_id: 210022 do
    Gradebook.visit_gradebook(@course)
    dom_names = ff('.student-name').map(&:text)
    expect(dom_names).to eq @all_students.map(&:name)
  end

  it "should not show student avatars until they are enabled", priority: "1", test_id: 210023 do
    Gradebook.visit_gradebook(@course)

    expect(ff('.student-name')).to have_size @all_students.size
    expect(f("body")).not_to contain_css('.avatar img')

    @account = Account.default
    @account.enable_service(:avatars)
    @account.save!
    expect(@account.service_enabled?(:avatars)).to be_truthy
    get "/courses/#{@course.id}/gradebook"

    expect(ff('.student-name')).to have_size @all_students.size
    expect(ff('.avatar')).to have_size @all_students.size
  end

  it "should handle muting/unmuting correctly", priority: "1", test_id: 164227 do
    Gradebook.visit_gradebook(@course)
    Gradebook.toggle_assignment_mute_option(@second_assignment.id)
    expect(fj(".container_1 .slick-header-column[id*='assignment_#{@second_assignment.id}'] .muted")).to be_displayed
    expect(f('.total-cell .icon-muted')).to be_displayed
    expect(@second_assignment.reload).to be_muted

    # reload the page and make sure it remembered the setting
    get "/courses/#{@course.id}/gradebook"
    expect(fj(".container_1 .slick-header-column[id*='assignment_#{@second_assignment.id}'] .muted")).to be_displayed

    # make sure you can un-mute
    Gradebook.toggle_assignment_mute_option(@second_assignment.id)
    expect(f("#content")).not_to contain_jqcss(".container_1 .slick-header-column[id*='assignment_#{@second_assignment.id}'] .muted")
    expect(@second_assignment.reload).not_to be_muted
  end

  context "unpublished course" do
    before do
      @course.claim!
      Gradebook.visit_gradebook(@course)
    end

    it "should allow editing grades", priority: "1", test_id: 210026 do
      cell = f('#gradebook_grid .container_1 .slick-row:nth-child(1) .b2')
      expect(f('.gradebook-cell', cell)).to include_text '10'
      cell.click
      expect(ff('.grade', cell)).to_not be_blank
    end
  end

  it "should validate that gradebook settings is displayed when button is clicked", priority: "1", test_id: 164217 do
    Gradebook.visit_gradebook(@course)

    f('#gradebook_settings').click
    expect(f('.gradebook_dropdown')).to be_displayed
  end

  it "View Gradebook History menu item redirects to grading history page", priority: "2", test_id: 164218 do
    Gradebook.visit_gradebook(@course)

    f('#gradebook_settings').click
    fj('.ui-menu-item a:contains("View Gradebook History")').click
    expect(driver.current_url).to include("/courses/#{@course.id}/gradebook/history")
  end

  it "should validate assignment details", priority: "1", test_id: 210048 do
    submissions_count = @second_assignment.submissions.count.to_s + ' submissions'

    Gradebook.visit_gradebook(@course)

    open_assignment_options(1)
    f('[data-action="showAssignmentDetails"]').click
    details_dialog = f('#assignment-details-dialog')
    expect(details_dialog).to be_displayed
    table_rows = ff('#assignment-details-dialog-stats-table tr')
    expect(table_rows[3].find_element(:css, 'td')).to include_text submissions_count
  end

  it "should include student view student for grading" 


  it "should not include non-graded group assignment in group total" 


  it "should not show assignment mute warning in total column for 'not_graded', muted assignments" 


  it "should hide and show student names", priority: "2", test_id: 164220 do

    def toggle_hiding_students
      f('#gradebook_settings').click
      student_toggle = f('.student_names_toggle')
      expect(student_toggle).to be_displayed
      student_toggle.click
    end

    Gradebook.visit_gradebook(@course)

    toggle_hiding_students
    expect(f("#content")).not_to contain_jqcss('.student-name:visible')
    expect(fj('.student-placeholder:visible')).to be

    toggle_hiding_students
    expect(fj('.student-name:visible')).to be
    expect(f("#content")).not_to contain_jqcss('.student-placeholder:visible')
  end

  it "should hide and show notes", priority: "2", test_id: 164224 do
    Gradebook.visit_gradebook(@course)

    # show notes column
    Gradebook.gb_settings_cog_select
    Gradebook.show_notes_select
    expect(f("#content")).to contain_jqcss('.custom_column:visible')

    # hide notes column
    Gradebook.gb_settings_cog_select
    Gradebook.hide_notes_select
    expect(f("#content")).not_to contain_jqcss('.custom_column:visible')
  end

  context "downloading and uploading submissions" do
    it "updates the dropdown menu after downloading and processes submission uploads" 

  end

  it "should show late submissions" 


  it "should not display a speedgrader link for large courses", priority: "2", test_id: 210099 do
    allow_any_instance_of(Course).to receive(:large_roster?).and_return(true)

    Gradebook.visit_gradebook(@course)

    f('.gradebook-header-drop').click
    expect(f('.gradebook-header-menu')).not_to include_text("SpeedGrader")
  end

  context 'grading quiz submissions' do
    # set up course and users
    let(:test_course) { course_factory() }
    let(:teacher)     { user_factory(active_all: true) }
    let(:student)     { user_factory(active_all: true) }
    let!(:enroll_teacher_and_students) do
      test_course.enroll_user(teacher, 'TeacherEnrollment', enrollment_state: 'active')
      test_course.enroll_user(student, 'StudentEnrollment', enrollment_state: 'active')
    end
    # create quiz with essay question
    let(:essay_quiz_question) do
      {
        question_name: 'Short Essay',
        points_possible: 10,
        question_text: 'Write an essay',
        question_type: 'essay_question'
      }
    end
    let(:essay_quiz) { test_course.quizzes.create(title: 'Essay Quiz') }
    let(:essay_question) do
      essay_quiz.quiz_questions.create!(question_data: essay_quiz_question)
      essay_quiz.workflow_state = 'available'
      essay_quiz.save!
      essay_quiz
    end
    #create quiz with file upload question
    let(:file_upload_question) do
      {
        question_name: 'File Upload',
        points_possible: 5,
        question_text: 'Upload a file',
        question_type: 'file_upload_question'
      }
    end
    let(:file_upload_quiz) { test_course.quizzes.create(title: 'File Upload Quiz') }
    let(:file_question) do
      file_upload_quiz.quiz_questions.create!(question_data: file_upload_question)
      file_upload_quiz.workflow_state = 'available'
      file_upload_quiz.save!
      file_upload_quiz
    end
    # generate submissions
    let(:essay_submission) { essay_question.generate_submission(student) }
    let(:essay_text) { {"question_#{essay_question.id}": "Essay Response!"} }
    let(:file_submission) { file_question.generate_submission(student) }

    it 'should display the quiz icon for essay questions', priority: "1", test_id: 229430 do
      essay_submission.complete!(essay_text)
      user_session(teacher)

      Gradebook.visit_gradebook(@course)
      expect(f('#gradebook_grid .icon-quiz')).to be_truthy
    end

    it 'should display the quiz icon for file_upload questions', priority: "1", test_id: 498844 do
      file_submission.attachments.create!({
        filename: "doc.doc",
        display_name: "doc.doc", user: @user,
        uploaded_data: dummy_io
      })
      file_submission.complete!
      user_session(teacher)

      Gradebook.visit_gradebook(@course)
      expect(f('#gradebook_grid .icon-quiz')).to be_truthy
    end

    it 'should remove the quiz icon when graded manually', priority: "1", test_id: 491040 do
      essay_submission.complete!(essay_text)
      user_session(teacher)

      Gradebook.visit_gradebook(@course)
      # in order to get into edit mode with an icon in the way, a total of 3 clicks are needed
      f('#gradebook_grid .icon-quiz').click
      double_click('.online_quiz')

      replace_value('#gradebook_grid input.grade', '10')
      f('#gradebook_grid input.grade').send_keys(:enter)
      expect(f('#gradebook_grid')).not_to contain_css('.icon-quiz')
    end
  end
end

