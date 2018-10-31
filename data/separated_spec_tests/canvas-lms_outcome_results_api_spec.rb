#
# Copyright (C) 2013 Instructure, Inc.
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
require File.expand_path(File.dirname(__FILE__) + '/../../sharding_spec_helper')

describe "Outcome Results API", type: :request do

  let_once(:outcome_course) do
    course_factory(active_all: true)
    @course
  end

  let_once(:outcome_teacher) do
    teacher_in_course(active_all: true, course: outcome_course)
    @teacher
  end

  let_once(:outcome_student) do
    student_in_course(active_all: true, course: outcome_course)
    @student
  end

  let_once(:outcome_rubric) do
    create_outcome_rubric
  end

  let_once(:outcome_object) do
    outcome_rubric
    @outcome
  end

  let_once(:outcome_assignment) do
    assignment = create_outcome_assignment
    find_or_create_outcome_submission assignment: assignment
    assignment
  end

  let_once(:outcome_rubric_association) do
    create_outcome_rubric_association
  end

  let(:outcome_criterion) do
    find_outcome_criterion
  end

  let(:first_outcome_rating) do # 3 points
    find_first_rating
  end

  let(:outcome_assessment) do
    create_outcome_assessment
  end

  def find_or_create_outcome_submission(opts = {})
    student = opts[:student] || outcome_student
    assignment = opts[:assignment] ||
      (create_outcome_assignment if opts[:new]) ||
      outcome_assignment
    assignment.find_or_create_submission(student)
  end

  def create_outcome_assessment(opts = {})
    association = (create_outcome_rubric_association(opts) if opts[:new]) ||
      outcome_rubric_association
    criterion = find_outcome_criterion(association.rubric)
    submission = opts[:submission] || find_or_create_outcome_submission(opts)
    student = submission.student
    points = opts[:points] ||
      find_first_rating(criterion)[:points]
    association.assess(
      user: student,
      assessor: outcome_teacher,
      artifact: submission,
      assessment: {
        assessment_type: 'grading',
        "criterion_#{criterion[:id]}".to_sym => {
          points: points
        }
      }
    )
  end

  def create_outcome_rubric
    outcome_course
    outcome_with_rubric(mastery_points: 3)
    @outcome.rubric_criterion = find_outcome_criterion(@rubric)
    @outcome.save
    @rubric
  end

  def create_outcome_assignment
    outcome_course.assignments.create!(
      title: "outcome assignment",
      description: "this is an outcome assignment",
      points_possible: outcome_rubric.points_possible,
    )
  end

  def create_outcome_rubric_association(opts = {})
    rubric = (create_outcome_rubric if opts[:new]) ||
      outcome_rubric
    assignment = (create_outcome_assignment if opts[:new]) ||
      outcome_assignment
    rubric.associate_with(assignment, outcome_course, purpose: 'grading', use_for_grading: true)
  end

  def find_outcome_criterion(rubric = outcome_rubric)
    rubric.criteria.find {|c| !c[:learning_outcome_id].nil? }
  end

  def find_first_rating(criterion = outcome_criterion)
    criterion[:ratings].first
  end

  let(:outcome_result) do
    outcome_assessment
    outcome_object.reload.learning_outcome_results.first
  end

  let(:outcome_students) do
    students = 0.upto(3).map do |i|
      student = student_in_course(active_all: true).user
      create_outcome_assessment(student: student, points: i)
      student
    end
  end

  let(:outcome_course_sections) do
    [0,1].map { |i| outcome_course.course_sections.create(name: "section #{i}") }
  end

  let(:sectioned_outcome_students) do
    0.upto(3).map do |i|
      student = student_in_section(outcome_course_sections[i % 2])
      create_outcome_assessment(student: student, points: i)
      student
    end
  end

  def outcome_rollups_url(context, params = {})
    api_v1_course_outcome_rollups_url(context, params)
  end

  def outcome_results_url(context, params = {})
    api_v1_course_outcome_results_url(context, params)
  end

  before do
    @user = @teacher # api calls as teacher, by default
  end

  describe "outcome rollups" do
    describe "error handling" do
      it "requires manage grades permisssion" 


      it "allows students to read their own results" 


      it "does not allow students to read other users' results" 


      it "does not allow students to read other users' results via csv" 


      it "requires an existing context" 


      it "verifies the aggregate parameter" 


      it "requires user ids to be students in the context" 


      it "requires section id to be a section in the context" 


      it "verifies the include[] parameter" 

    end

    describe "basic response" do
      it "returns a json api structure" 


      it "returns a csv file" 


      describe "user_ids parameter" do
        it "restricts results to specified users" 


        it "can require_outcome_context with sis_user_ids" 


        it "can take sis_user_ids" 

      end

      describe "section_id parameter" do
        it "restricts results to the specified section" 

      end

      describe "include[] parameter" do
        it "side loads courses" 


        it "side loads outcomes" 


        it "side loads outcome groups" 


        it "side loads outcome links" 


        it "side loads users" 


        it "side loads alignments" 

      end
    end

    describe "outcomes" do
      before :once do
        @outcomes = 0.upto(3).map do |i|
          create_outcome_assessment(new: true)
          @outcome
        end
        @outcome_group = @course.learning_outcome_groups.create!(:title => 'groupage')
        @outcomes += 0.upto(2).map do |i|
          create_outcome_assessment(new: true)
          @outcome
        end
      end

      it "supports multiple outcomes" 


      it "filters by outcome id" 


      it "filters by outcome group id" 

    end

    describe "aggregate response" do
      it "returns an aggregate json api structure" 


      describe "user_ids parameter" do
        it "restricts aggregate to specified users" 

      end

      describe "section_id parameter" do
        it "restricts aggregate to the specified section" 

      end
    end
  end

  describe "index" do
    # the filtering and inclusion logic is shared with the rollup endpoint, so we don't retest it here
    # we test some of that logic that is more specifically useful to the index endpoint
    it "side loads alignments" 


    it "returns outcome results" 

  end

  describe "sharding" do
    specs_require_sharding

    it "returns results for users on multiple shards" 

  end

end

