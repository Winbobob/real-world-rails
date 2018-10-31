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

require_relative '../../../spec_helper.rb'

class AssignmentApiHarness
  include Api::V1::Assignment

  def value_to_boolean(value)
    Canvas::Plugin.value_to_boolean(value)
  end

  def api_user_content(description, course, user, _)
    "api_user_content(#{description}, #{course.id}, #{user.id})"
  end

  def course_assignment_url(context_id, assignment)
    "assignment/url/#{context_id}/#{assignment.id}"
  end

  def session
    Object.new
  end

  def course_assignment_submissions_url(course, assignment, _options)
    "/course/#{course.id}/assignment/#{assignment.id}/submissions?zip=1"
  end

  def course_quiz_quiz_submissions_url(course, quiz, _options)
    "/course/#{course.id}/quizzes/#{quiz.id}/submissions?zip=1"
  end
end

describe "Api::V1::Assignment" do
  subject(:api) { AssignmentApiHarness.new }
  let(:assignment) { assignment_model }

  describe "#assignment_json" do
    let(:user) { user_model }
    let(:session) { Object.new }

    it "returns json" 


    it "includes section-based counts when grading flag is passed" 


    it "includes an associated planner override when flag is passed" 


    it "returns nil for planner override when flag is passed and there is no override" 


    context "for an assignment" do
      it "provides a submissions download URL" 


      it "optionally includes 'grades_published' for moderated assignments" 


      it "excludes 'grades_published' by default" 

    end

    context "for a quiz" do
      before do
        @assignment = assignment_model
        @assignment.submission_types = 'online_quiz'
        @quiz = quiz_model(course: @course)
        @assignment.quiz = @quiz
      end

      it "provides a submissions download URL" 

    end

    it "includes all assignment overrides fields when an assignment_override exists" 


    it "excludes descriptions when exclude_response_fields flag is passed and includes 'description'" 


    it "excludes needs_grading_counts when exclude_response_fields flag is " \
    "passed and includes 'needs_grading_count'" do
      params = { override_dates: false, exclude_response_fields: ['needs_grading_count'] }
      json = api.assignment_json(assignment, user, session, params)
      expect(json).not_to have_key "needs_grading_count"
    end


    context 'rubrics' do
      before do
        rubric_model({
          context: assignment.course,
          title: "test rubric",
          data: [{
            description: "Some criterion",
            points: 10,
            id: 'crit1',
            ignore_for_scoring: true,
            ratings: [
              {description: "Good", points: 10, id: 'rat1', criterion_id: 'crit1'}
            ]
          }]
        })
        @rubric.associate_with(assignment, assignment.course, purpose: 'grading')
      end

      it "includes ignore_for_scoring when it is on the rubric" 

    end
  end

  describe "*_settings_hash methods" do
    let(:assignment) { AssignmentApiHarness.new }
    let(:test_params) do
      ActionController::Parameters.new({
        "turnitin_settings" => {},
        "vericite_settings" => {}
      })
    end

    it "#turnitin_settings_hash returns a Hash with indifferent access" 


    it "#vericite_settings_hash returns a Hash with indifferent access" 

  end

  describe "#assignment_editable_fields_valid?" do
    let(:user) { Object.new }
    let(:course) { Course.new }
    let(:assignment) do
      Assignment.new do |a|
        a.title = 'foo'
        a.submission_types = 'online'
        a.course = course
      end
    end

    context "given a user who is an admin" do
      before do
        expect(course).to receive(:account_membership_allows).and_return(true)
      end

      it "is valid when user is an account admin" 

    end

    context "given a user who is not an admin" do
      before do
        expect(assignment.course).to receive(:account_membership_allows).and_return(false)
      end

      it "is valid when not in a closed grading period" 


      context "in a closed grading period" do
        let(:course) { Course.create! }
        let(:assignment) do
          course.assignments.create!(title: 'First Title', submission_types: 'online_quiz')
        end

        before do
          expect(assignment).to receive(:in_closed_grading_period?).and_return(true)
        end

        it "is valid when it was not gradeable and is still not gradeable " \
          "(!gradeable_was? && !gradeable?)" do
          assignment.update!(submission_types: 'not_gradeable')
          assignment.submission_types = 'wiki_page'
          expect(api).to be_assignment_editable_fields_valid(assignment, user)
        end

        it "is invalid when it was gradeable and is now not gradeable" 


        it "is invalid when it was not gradeable and is now gradeable" 


        it "is invalid when it was gradeable and is still gradeable" 


        it "detects changes to title and responds with those errors on the name field" 


        it "is valid if description changed" 


        it "is valid if submission_types changed" 


        it "is valid if peer_reviews changed" 


        it "is valid if peer_review_count changed" 


        it "is valid if time_zone_edited changed" 


        it "is valid if anonymous_peer_reviews changed" 


        it "is valid if peer_reviews_due_at changed" 


        it "is valid if automatic_peer_reivews changed" 


        it "is valid if allowed_extensions changed" 

      end
    end
  end
end

