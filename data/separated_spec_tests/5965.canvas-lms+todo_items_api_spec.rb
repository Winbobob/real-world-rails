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


describe UsersController, type: :request do
  include Api
  include Api::V1::Assignment
  def update_assignment_json
    @a1_json['assignment'] = controller.assignment_json(@a1,@user,session).as_json
    @a2_json['assignment'] = controller.assignment_json(@a2,@user,session).as_json
  end

  def strip_secure_params(json)
    json['assignment'].delete('secure_params')
    json
  end

  before :once do
    course_with_teacher(:active_all => true, :user => user_with_pseudonym(:active_all => true))
    @teacher_course = @course
    @student_course = course_factory(active_course: true)
    @student_course.enroll_student(@user).accept!
    # an assignment i need to submit (needs_submitting)
    @a1 = Assignment.create!(:context => @student_course, :due_at => 6.days.from_now, :title => 'required work', :submission_types => 'online_text_entry', :points_possible => 10)

    # an assignment i created, and a student who submits the assignment (needs_grading)
    @a2 = Assignment.create!(:context => @teacher_course, :due_at => 1.day.from_now, :title => 'text', :submission_types => 'online_text_entry', :points_possible => 15)
    @me = @user
    student = user_factory(active_all: true)
    @user = @me
    @teacher_course.enroll_student(student).accept!
    @sub = @a2.reload.submit_homework(student, :submission_type => 'online_text_entry', :body => 'done')
    @a2.reload
  end

  before :each do
    @a1_json =
      {
        'type' => 'submitting',
        'assignment' => {},
        'ignore' => api_v1_users_todo_ignore_url(@a1.asset_string, 'submitting', :permanent => 0),
        'ignore_permanently' => api_v1_users_todo_ignore_url(@a1.asset_string, 'submitting', :permanent => 1),
        'html_url' => "#{course_assignment_url(@a1.context_id, @a1.id)}#submit",
        'context_type' => 'Course',
        'course_id' => @student_course.id,
      }
    @a2_json =
      {
        'type' => 'grading',
        'assignment' => {},
        'needs_grading_count' => 1,
        'ignore' => api_v1_users_todo_ignore_url(@a2.asset_string, 'grading', :permanent => 0),
        'ignore_permanently' => api_v1_users_todo_ignore_url(@a2.asset_string, 'grading', :permanent => 1),
        'html_url' => speed_grader_course_gradebook_url(@a2.context_id, :assignment_id => @a2.id),
        'context_type' => 'Course',
        'course_id' => @teacher_course.id,
      }
  end

  def another_submission
    @me = @user
    student2 = user_factory(active_all: true)
    @user = @me
    @teacher_course.enroll_student(student2).accept!
    @sub2 = @a2.reload.submit_homework(student2,
                                       :submission_type => 'online_text_entry',
                                       :body => 'me too')
    @a2.reload
  end

  it "should check for auth" 


  it "should return a global user todo list" 


  it "returns a course-specific todo list for a student" 


  it "returns a course-specific todo list for a teacher" 


  it "should return a list for users who are both teachers and students" 


  it 'should not crash when mixing items with/without due dates (users controller)' 


  it 'should not crash when mixing items with/without due dates (courses controller)' 


  it "should ignore a todo item permanently" 


  it "should ignore a todo item until the next change" 


  it "should ignore excused assignments for students" 


  it "should include future assignments that don't expect an online submission (courses endpoint)" 


  it "should include future assignments that don't expect an online submission (users endpoint)" 


  it "includes ungraded quizzes by request" 


  it "doesn't include ungraded quizzes if not assigned to user" 


  it "works correctly when turnitin is enabled" 


  it "doesnt include anything over 4 weeks old" 


  context 'when the assignment is differentiated/ has overrides' do
    before :each do
      @course = course_factory(active_all: true)
      @section = @course.course_sections.create!

      @user = user_factory(active_all: true)
      @course.enroll_student(@user, { :section => @section }).accept!

      ao = differentiated_assignment(:context => @course, :course_section => @section, :due_at => nil, :submission_types => 'online_text_entry')
      ao.due_at = 1.day.from_now
      ao.due_at_overridden = true
      ao.save!

      survey = @course.quizzes.create!(quiz_type: 'survey', only_visible_to_overrides: true, :due_at => nil)
      so = survey.assignment_overrides.create!(:set => @section)
      so.due_at = 1.day.from_now
      so.due_at_overridden = true
      so.save!
      survey.publish!
    end


    it "includes assignments/quizzes with no due_at (users controller)" 


    it "includes assignments/quizzes with no due_at (courses controller)" 

  end

  context 'with pagination' do
    before :once do
      @teacher = course_with_teacher(active_all: true).user
      @teacher_course = @course
      @student_course = course_factory(active_course: true)
      @student_course.enroll_student(@teacher).accept(true)
      # an assignment i need to submit (needs_submitting)
      batch = []
      [120, 13, 147, 79, 161, 119, 81, 57, 134, 21].each do |i|
        batch << {
          context_type: 'Course',
          context_id: @student_course.id,
          due_at: i.hours.from_now, # randomized due dates for the next 7ish days
          title: 'required work',
          submission_types: 'online_text_entry',
          points_possible: 10,
          workflow_state: 'published'
        }
      end
      Assignment.bulk_insert(batch)
      @student_assignments = @student_course.assignments
      batch = []
      @student_assignments.each do |a|
        batch << {
          cached_due_date: a.due_date,
          assignment_id: a.id,
          user_id: @teacher.id,
          workflow_state: 'unsubmitted'
        }
      end
      Submission.bulk_insert(batch)

      # an assignment i created, and a student who submits the assignment (needs_grading)
      @student = user_factory(active_all: true)
      @teacher_course.enroll_student(@student).accept!
      batch = []
      [89, 10, 39, 6, 34, 55, 95, 103, 126, 107].each do |i|
        batch << {
          context_type: 'Course',
          context_id: @teacher_course.id,
          due_at: i.hours.from_now, # randomized due dates for the next 7ish days
          title: 'text',
          submission_types: 'online_text_entry',
          points_possible: 15,
          workflow_state: 'published'
        }
      end
      Assignment.bulk_insert(batch)
      @teacher_assignments = @teacher_course.assignments
      batch = []
      @teacher_assignments.each do |a|
        batch << {
          cached_due_date: a.due_at,
          assignment_id: a.id,
          user_id: @student.id,
          workflow_state: 'submitted',
          submission_type: 'online_text_entry',
          body: 'done'
        }
      end
      Submission.bulk_insert(batch)
      @user = @teacher
    end

    it "paginates (users controller)" 


    it "paginated (courses controller)" 

  end

  describe "todo_item_count" do
    before :once do
      @teacher = course_with_teacher(:active_all => true, :user => user_with_pseudonym(:active_all => true))
      @teacher_course = @course
      @student_course = course_factory(active_all: true)
      @student_course.enroll_student(@user).accept!
      # an assignment i need to submit (needs_submitting)
      batch = []
      18.times do
        batch << { :context_type => 'Course',
                   :context_id => @student_course.id,
                   :due_at => 6.days.from_now,
                   :title => 'required work',
                   :submission_types => 'online_text_entry',
                   :points_possible => 10,
                   :workflow_state => 'published' }
      end
      Assignment.bulk_insert(batch)

      batch = []
      assignments = @student_course.assignments
      assignments.each do |a|
        batch << { :cached_due_date => 6.days.from_now,
                   :assignment_id => a.id,
                   :user_id => @user.id,
                   :workflow_state => 'unsubmitted' }
      end
      Submission.bulk_insert(batch)

      # one assignment submitted
      assignment = @student_course.assignments.first
      assignment.submit_homework(@user, :submission_type => 'online_text_entry', :body => 'done')
      # one assignment ignored
      assignment = @student_course.assignments[1]
      @user.ignore_item!(assignment, 'submitting', true)

      # an assignment i created, and a student who submits the assignment (needs_grading)
      @me = @user
      @student = user_factory(active_all: true)
      @user = @me
      @teacher_course.enroll_student(@student).accept!
      @teacher_assignment_ids = []

      3.times do
        a = Assignment.create!(:context => @teacher_course,
                               :due_at => 1.day.from_now,
                               :title => 'text',
                               :submission_types => 'online_text_entry',
                               :points_possible => 15)
        a.submit_homework(@student, :submission_type => 'online_text_entry', :body => 'done')
        @teacher_assignment_ids << a.id
      end
      # one assignment graded
      submission = @teacher_course.assignments[0].submissions[0]
      submission.workflow_state = 'graded'
      submission.score = 90
      submission.save!
      # one assignment ignored
      assignment = @teacher_course.assignments[1]
      @user.ignore_item!(assignment, 'grading', true)
    end

    it "should check for auth" 


    it "returns the correct count" 


    it "doesnt count assignments that dont need grading" 


    it "doesn't count submissions on deleted assignments" 

  end
end

