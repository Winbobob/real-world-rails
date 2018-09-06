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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

require 'nokogiri'

describe GradebooksHelper do
  FakeAssignment = Struct.new(:grading_type, :quiz, :points_possible).freeze
  FakeSubmission = Struct.new(:assignment, :score, :grade, :submission_type,
                              :workflow_state, :excused?).freeze
  FakeQuiz = Struct.new(:survey, :anonymous_submissions) do
    def survey?
      survey
    end
  end.freeze

  let(:assignment) { FakeAssignment.new }
  let(:submission) { FakeSubmission.new(assignment) }
  let(:quiz) { assignment.quiz = FakeQuiz.new }
  let(:anonymous_survey) { assignment.quiz = FakeQuiz.new(true, true) }

  describe '#anonymous_assignment?' do
    it 'requires a quiz' 


    it 'is falsy with just a survey' 


    it 'is falsy with just anonymous_submissions' 


    it 'is truthy with an anonymous survey' 

  end

  describe '#anonymous_grading_required?' do
    it 'returns false by default' 


    it 'returns true if course setting is on' 


    it 'returns true if sub-account setting is on' 


    it 'returns true if root account setting is on' 


    it 'returns true if site admin setting is on' 

  end

  describe '#force_anonymous_grading?' do
    it 'returns false by default' 


    it 'returns true if anonymous quiz' 


    it 'returns true if anonymous grading flag set' 

  end

  describe '#force_anonymous_grading_reason' do
    it 'returns nothing if anonymous grading is not forced' 


    it 'returns anonymous survey reason' 


    it 'returns anonymous grading' 

  end

  describe '#student_score_display_for(submission, can_manage_grades)' do

    let(:score_display) { helper.student_score_display_for(submission) }
    let(:parsed_display) { Nokogiri::HTML.parse(score_display) }
    let(:score_icon) { parsed_display.at_css('i') }
    let(:score_screenreader_text) { parsed_display.at_css('.screenreader-only').text }

    context 'when the supplied submission is nil' do
      it 'must return a dash' 

    end

    context 'when the submission has been graded' do
      before do
        submission.score = 1
        submission.grade = 1
      end

      context 'and the assignment is graded pass-fail' do
        before do
          assignment.grading_type = 'pass_fail'
        end

        context 'with a passing grade' do
          before do
            submission.score = 1
          end

          it 'must give us a check icon' 


          it 'must indicate the assignment is complete via alt text' 

        end

        context 'with a faililng grade' do
          before do
            submission.grade = 'incomplete'
            submission.score = nil
          end

          it 'must give us a check icon' 


          it 'must indicate the assignment is complete via alt text' 

        end
      end

      context 'and the assignment is a percentage grade' do
        it 'must output the percentage' 

      end

      context 'and the assignment is a point grade' do
        it 'must output the grade rounded to two decimal points' 

      end

      context 'and the assignment is a letter grade' do
        # clearly this code needs to change; just look at this nonsensical expectation:
        it 'has no score_display' 

      end

      context 'and the assignment is a gpa scaled grade' do
        # clearly this code needs to change; just look at this nonsensical expectation:
        it 'has no score_display' 

      end
    end

    context 'when the submission is ungraded' do
      before do
        submission.score = nil
        submission.grade = nil
      end

      context 'and the submission is an online submission type' do
        it 'must output an appropriate icon' 

      end

      context 'and the submission is some unknown type' do
        it 'must output a dash' 

      end
    end
  end

  describe '#format_grade?' do
    it 'returns true if given grade is a string containing an integer' 


    it 'returns true if given grade is an integer' 


    it 'returns true if given grade is a string containing a decimal' 


    it 'returns true if given grade is a decimal' 


    it 'returns true if given grade is a percentage' 


    it 'returns false if given grade is a letter grade' 


    it 'returns false if given grade is a mix of letters and numbers' 

  end

  describe '#percentage?' do
    it 'returns true if given grade is a percentage' 


    it 'returns false if given grade is not a percentage' 

  end

  describe '#format_grade' do
    it 'formats integer point grades with I18n#n' 


    it 'formats decimal point grades with I18n#n' 


    it 'formats integer percentage grades with I18n#n' 


    it 'formats decimal percentage grades with I18n#n' 


    it 'returns letter grades as is' 


    it 'returns a mix of letters and numbers as is' 

  end

  describe '#graded_by_title' do
    it 'returns an I18n translated string' 

  end

  describe '#history_submission_class' do
    it 'returns a class based on given submission' 

  end
end

