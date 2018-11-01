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

require_relative '../helpers/gradebook_common'

describe "outcome gradebook" do
  include_context "in-process server selenium tests"
  include GradebookCommon

  context "as a teacher" do
    before(:once) do
      gradebook_data_setup
      @outcome1 = outcome_model(context: @course, title: 'outcome1')
      @outcome2 = outcome_model(context: @course, title: 'outcome2')
    end

    before(:each) do
      user_session(@teacher)
    end

    after(:each) do
      clear_local_storage
    end

    it "should not be visible by default" 


    context "when enabled" do
      before :once do
        Account.default.set_feature_flag!('outcome_gradebook', 'on')
      end

      it "should be visible" 


      def three_students
        expect(ff('.outcome-student-cell-content')).to have_size 3
      end

      def no_students
        expect(f('#application')).not_to contain_css('.outcome-student-cell-content')
      end

      def two_outcomes
        expect(ff('.outcome-gradebook-container .headers_1 .slick-header-column')).to have_size 2
      end

      def no_outcomes
        expect(f('.outcome-gradebook-container .headers_1')).not_to contain_css('.slick-header-column')
      end

      it "filter out students without results" 


      it "filter out outcomes without results" 


      it "filter out outcomes and students without results" 


      it 'outcomes without results filter preserved after page refresh' 


      it 'students without results filter preserved after page refresh' 


      it 'outcomes and students without results filter preserved after page refresh' 


      def result(user, alignment, score, opts = {})
        LearningOutcomeResult.create!(user: user, alignment: alignment, score: score, context: @course, **opts)
      end

      context 'with results' do
        before(:once) do
          align1 = @outcome1.align(@assignment, @course)
          align2 = @outcome2.align(@assignment, @course)
          result(@student_1, align1, 5)
          result(@student_2, align1, 3)
          result(@student_3, align1, 0)
          result(@student_1, align2, 4)
          result(@student_2, align2, 2)
          result(@student_3, align2, 1)
        end

        it 'keeps course mean after outcomes without results filter enabled' 


        it "displays course mean and median" 

      end

      context 'with non-scoring results' do
        before(:once) do
          align1 = @outcome1.align(@assignment, @course)
          align2 = @outcome2.align(@assignment, @course)
          result(@student_1, align1, 5, hide_points: true)
          result(@student_2, align1, 3, hide_points: true)
          result(@student_3, align1, 0, hide_points: true)
          result(@student_1, align2, 4, hide_points: true)
          result(@student_2, align2, 2, hide_points: true)
          result(@student_3, align2, 1)
        end

        it "displays rating description for course mean" 

      end

      it "should allow showing only a certain section" 


      it "should handle multiple enrollments correctly" 

    end
  end
end

