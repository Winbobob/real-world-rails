#
# Copyright (C) 2013 - present Instructure, Inc.
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

require File.expand_path('../../spec_helper', File.dirname(__FILE__))

class GradebookHistoryHarness
  include Api::V1::GradebookHistory

  def course_assignment_url(*)
    'http://www.example.com'
  end

  def course_assignment_submissions_url(*)
    'http://www.example.com'
  end

  def course_assignment_submission_url(*)
    'http://www.example.com'
  end

  def params
    {}
  end
end

describe Api::V1::GradebookHistory do
  subject(:gradebook_history) { GradebookHistoryHarness.new }
  let(:course) { double }
  let(:controller) do
    double(
      :params => {},
      :request => double(:query_parameters => {}),
      :response => double(:headers => {})
    )
  end
  let(:path) { '' }
  let(:user) { User.new }
  let(:session) { double }
  let(:api_context) { Api::V1::ApiContext.new(controller, path, user, session) }
  let(:now) { Time.now.in_time_zone }
  let(:yesterday) { (now - 24.hours).in_time_zone }

  before do
    allow_any_instance_of(Submission).to receive(:user_can_read_grade?).with(user, session).and_return(true)
  end

  def submit(assignment, student, day, grader)
    bare_submission_model(assignment, student, :graded_at => day, :grader_id => grader.try(:id))
  end

  describe '#days_json' do
    let_once(:course) { Course.create! }

    before :once do
      students = (1..3).map do |_idx|
        student = User.create!
        course.enroll_student(student)
        student
      end
      @grader1 = User.create!(:name => 'grader 1')
      @grader2 = User.create!(:name => 'grader 2')
      @assignment1 = course.assignments.create!(:title => "some assignment")
      @assignment2 = course.assignments.create!(:title => "another assignment")
      submit(@assignment1, students[0], now, @grader1)
      submit(@assignment1, students[1], now, @grader2)
      submit(@assignment1, students[2], yesterday, @grader2)
      submit(@assignment2, students[0], yesterday, @grader2)
    end

    before :each do
      harness = GradebookHistoryHarness.new
      harness.instance_variable_set(:@domain_root_account, Account.default)
      @days = harness.days_json(course, api_context)
    end

    it 'has a top level key for each day represented' 


    it 'has a hash of graders for each day keyed by id' 


    it 'puts an assignment list under each grader' 


    it 'paginates' 


  end

  describe '#json_for_date' do
    let_once(:course) { Course.create! }

    before :once do
      student1 = User.create!
      course.enroll_student(student1)
      student2 = User.create!
      course.enroll_student(student2)
      @grader1 = User.create!(:name => 'grader 1')
      @grader2 = User.create!(:name => 'grader 2')
      @assignment = course.assignments.create!(:title => "some assignment")
      submit(@assignment, student1, now, @grader1)
      submit(@assignment, student2, now, @grader2)
    end

    before :each do
      harness = GradebookHistoryHarness.new
      harness.instance_variable_set(:@domain_root_account, Account.default)
      @day_hash = harness.json_for_date(now, course, api_context)
    end

    it 'includes assignment data' 


    it 'returns a grader hash for that day' 

  end

  describe '#versions_json' do
      let(:grader) { User.create!(:name => 'grader') }
      let(:student) { User.create! }
      let(:assignment) { course.assignments.create!(:title => "some assignment") }
      let(:versions) { [Version.create!(versionable: submission, model: submission)] }
      let(:harness) {  GradebookHistoryHarness.new }
      let(:submission) do
        s = assignment.submit_homework(student)
        s.update_attributes(graded_at: now, score: 90, grade: '90', grader: grader)
        s
      end
      let(:course) do
        c = Course.create!
        c.enroll_student(student)
        c.enroll_teacher(grader)
        c
      end

    it "does preloads originality reports" 

  end

  describe '#submissions_for' do
    before :once do
      @course = Course.create!
      student1 = User.create!
      @course.enroll_student(student1)
      @grader1 = User.create!(:name => 'grader 1')
      @grader2 = User.create!(:name => 'grader 2')
      @course.enroll_teacher(@grader2)
      @assignment = @course.assignments.create!(:title => "some assignment")
      @submission = @assignment.submit_homework(student1)
      @submission.update_attributes(graded_at: now, grader_id: @grader1.id)
      @submission.score = 90
      @submission.grade = '90'
      @submission.grader = @grader2
      @submission.save!
    end

    it 'should be an array of submissions' 


    it 'has the version hash' 


    it 'can find submissions with no grader' 


    it 'should properly set pervious_* attributes' 

  end

  describe '#day_string_for' do
    it 'builds a formatted date' 


    it 'gives a empty string if there is no time' 

  end

  describe '#submissions' do
    let_once(:course) { Course.create! }
    let_once(:assignment) { course.assignments.create! }
    let_once(:student) { User.create! }
    let(:submissions) { gradebook_history.submissions_set(course, api_context) }

    before :once do
      course.enroll_student(student)
      @submission = bare_submission_model(assignment, student)
    end

    context 'when the submission has been graded' do
      before :once do
        @submission.graded_at = Time.now.in_time_zone
        @submission.save!
      end

      def add_submission
        other_student = User.create!
        course.enroll_student(other_student)
        other_submission = bare_submission_model(assignment, other_student, graded_at: 2.hours.ago.in_time_zone)
        other_submission.save!
      end

      it 'includes the submission' 


      it 'orders submissions by graded timestamp' 


      it 'accepts a date option' 


    end

    it 'does not include ungraded submissions' 

  end

end

