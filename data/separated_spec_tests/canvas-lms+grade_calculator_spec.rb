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

require_relative '../sharding_spec_helper'

describe GradeCalculator do
  before :each do
    course_with_student active_all: true
  end

  context "computing grades" do
    it "should compute grades without dying" 


    it "weighted grading periods: gracefully handles (by skipping) enrollments from other courses" 


    it "weighted grading periods: gracefully handles (by skipping) deleted enrollments" 


    it "weighted grading periods: compute_scores does not raise an error if no grading period score objects exist" 


    it "can compute scores for users with deleted enrollments when grading periods are used" 


    it "deletes irrelevant scores for inactive grading periods" 


    it "gracefully handles missing submissions" 


    context "sharding" do
      specs_require_sharding

      let(:seed_assignment_groups_with_scores) do
        now = Time.zone.now
        groups = []
        assignments = []
        submissions = []
        @shard1.activate do
          account = Account.create!
          course_with_student(active_all: true, account: account, user: @user)
          @course.update_attribute(:group_weighting_scheme, "percent")
          groups <<
            @course.assignment_groups.create!(name: "some group 1", group_weight: 50) <<
            @course.assignment_groups.create!(name: "some group 2", group_weight: 50)
          asgt_opts = { due_at: now, points_possible: 10 }
          assignments <<
            @course.assignments.create!(title: "Some Assignment 1", assignment_group: groups[0], **asgt_opts) <<
            @course.assignments.create!(title: "Some Assignment 2", assignment_group: groups[1], **asgt_opts) <<
            @course.assignments.create!(title: "Some Assignment 3", assignment_group: groups[1], **asgt_opts)
          submissions <<
            assignments[0].submissions.find_by!(user: @user) <<
            assignments[1].submissions.find_by!(user: @user)
        end
        submissions[0].update_column(:score, 5.0)
        submissions[1].update_column(:score, 2.5)
        groups
      end

      it "should delete irrelevant cross-shard scores" 


      it "should update cross-shard scores" 


      it "should update cross-shard scores with grading periods" 


      it("should update cross-shard scores with assignment groups") do
        @user = User.create!

        allow(GradeCalculator).to receive(:recompute_final_score) {}
        groups = seed_assignment_groups_with_scores

        allow(GradeCalculator).to receive(:recompute_final_score).and_call_original
        GradeCalculator.recompute_final_score(@user.id, @course.id)

        enrollment = Enrollment.shard(@course.shard).where(user_id: @user.global_id).first
        expect(enrollment.computed_current_score).to be(37.5)
        expect(enrollment.computed_final_score).to be(31.25)
        expect(enrollment.computed_current_score(assignment_group_id: groups[0].id)).to be(50.0)
        expect(enrollment.computed_final_score(assignment_group_id: groups[0].id)).to be(50.0)
        expect(enrollment.computed_current_score(assignment_group_id: groups[1].id)).to be(25.0)
        expect(enrollment.computed_final_score(assignment_group_id: groups[1].id)).to be(12.5)
      end
    end

    it "should recompute when an assignment's points_possible changes'" 


    it "should recompute when an assignment group's weight changes'" 


    it "recomputes when an assignment is flagged as omit from final grade" 


    it "recomputes when an assignment changes assignment groups" 


    it "recomputes during #run_if_overrides_changed!" 


    def two_groups_two_assignments(g1_weight, a1_possible, g2_weight, a2_possible)
      @group = @course.assignment_groups.create!(:name => "some group", :group_weight => g1_weight)
      @assignment = @group.assignments.build(:title => "some assignments", :points_possible => a1_possible)
      @assignment.context = @course
      @assignment.save!
      @group2 = @course.assignment_groups.create!(:name => "some other group", :group_weight => g2_weight)
      @assignment2 = @group2.assignments.build(:title => "some assignments", :points_possible => a2_possible)
      @assignment2.context = @course
      @assignment2.save!
    end

    describe "group with no grade or muted grade" do
      before(:each) do
        two_groups_two_assignments(50, 10, 50, 10)
        @submission = @assignment.grade_student(@user, grade: "5", grader: @teacher)
      end

      it "should ignore no grade for current grade calculation, even when weighted" 


      it "should ignore no grade for current grade but not final grade" 


      context "muted assignments" do
        before :each do
          @assignment2.mute!
        end

        it "should ignore muted assignments by default" 


        it "should ignore muted grade for current grade calculation, even when weighted" 


        it "should be possible to compute grades with muted assignments" 


        it "saves unmuted scores" 

      end
    end

    it "returns assignment group info" 


    it "calculates the grade without floating point calculation errors" 


    it "should compute a weighted grade when specified" 


    it "should incorporate extra credit when the weighted total is more than 100%" 


    it "should incorporate extra credit when the total is more than the possible" 


    it "should properly calculate the grade when total weight is less than 100%" 


    it "should properly calculate the grade when there are 'not graded' assignments with scores" 


    def two_graded_assignments
      @group = @course.assignment_groups.create!(:name => "some group")
      @assignment = @group.assignments.build(:title => "some assignments", :points_possible => 5)
      @assignment.context = @course
      @assignment.save!
      @assignment2 = @group.assignments.build(:title => "yet another", :points_possible => 5)
      @assignment2.context = @course
      @assignment2.save!
      @submission = @assignment.grade_student(@user, grade: "2", grader: @teacher)
      @submission2 = @assignment2.grade_student(@user, grade: "4", grader: @teacher)
      @course.save!
      @user.reload
      expect(@user.enrollments.first.computed_current_score).to eql(60.0)
      expect(@user.enrollments.first.computed_final_score).to eql(60.0)
    end

    it "should recalculate all cached grades when an assignment is deleted/restored" 


    it "should recalculate all cached grades when an assignment is muted/unmuted" 


    def nil_graded_assignment
      @group = @course.assignment_groups.create!(:name => "group2", :group_weight => 50)
      @assignment_1 = @group.assignments.build(:title => "some assignments", :points_possible => 10)
      @assignment_1.context = @course
      @assignment_1.save!
      @assignment_2 = @group.assignments.build(:title => "some assignments", :points_possible => 4)
      @assignment_2.context = @course
      @assignment_2.save!
      @group2 = @course.assignment_groups.create!(:name => "assignments", :group_weight => 40)
      @assignment2_1 = @group2.assignments.build(:title => "some assignments", :points_possible => 40)
      @assignment2_1.context = @course
      @assignment2_1.save!

      @assignment_1.grade_student(@user, grade: nil, grader: @teacher)
      @assignment_2.grade_student(@user, grade: "1", grader: @teacher)
      @assignment2_1.grade_student(@user, grade: "40", grader: @teacher)
    end

    it "should properly handle submissions with no score" 


    it "should treat muted assignments as if there is no submission" 


    it "ignores pending_review submissions" 


    it "should not include unpublished assignments" 

  end

  describe '#number_or_null' do
    it "should return a valid score" 


    it "should convert NaN to NULL" 


    it "should convert nil to NULL" 

  end

  describe 'memoization' do
    it 'only fetches groups once' 


    it 'only fetches assignments once' 


    it 'only fetches submissions once' 


    it 'only fetches grading periods once' 


    it 'only fetches enrollments once' 

  end

  describe 'GradeCalculator.recompute_final_score' do
    it 'accepts a course' 


    it 'accepts a course id' 


    it 'fetches assignments for GradeCalculator' 


    it 'does not fetch assignments if they are already passed' 


    it 'fetches groups for GradeCalculator' 


    it 'does not fetch groups if they are already passed' 


    it 'fetches periods for GradeCalculator' 


    it 'does not fetch periods if they are already passed' 

  end

  describe '#compute_and_save_scores' do
    before :each do
      @now = Time.zone.now
      @grading_period_options = { count: 2, weights: [30, 70], start_dates: [1, 2].map { |n| @now + n.months }}

      assignment_group_weights = [45.0, 55.0]
      @assignment_groups = []
      @assignments = []

      @assignment_groups = Array.new(2) do |assignment_group_idx|
        assignment_group = @course.assignment_groups.create!(
          name: "Assignment Group ##{assignment_group_idx}",
          group_weight: assignment_group_weights[assignment_group_idx],
          rules: "drop_lowest:1\n"
        )
        assignments = Array.new(3) do |assignment_idx|
          @course.assignments.create!(
            title: "AG#{assignment_group_idx} Assignment ##{assignment_idx}",
            assignment_group: assignment_group,
            # Each assignment group spans only one grading period
            due_at: @grading_period_options[:start_dates][assignment_group_idx] + (assignment_idx + 1).days,
            points_possible: 150 # * (assignment_idx + 1)
          )
        end

        assignments[1].mute!

        @assignments.push(*assignments)
        assignment_group
      end

      assignment_scores = [
        # Assignment Group 1
        35.0,  # dropped
        99.6,  # muted
        142.7,

        # Assignment Group 2
        42.0,  # dropped
        95.0,  # muted
        131.4
      ]
      @assignments.zip(assignment_scores).each do |assignment_score_pair|
        submission = Submission.find_by(user: @student, assignment: assignment_score_pair[0])

        # update_column to avoid callbacks on submission that would trigger the grade calculator.
        # For these specs we want control over when the grade calculator is kicked off
        # rubocop:disable Rails/SkipsModelValidations
        submission.update_column(:score, assignment_score_pair[1])
        # rubocop:enable Rails/SkipsModelValidations
      end

      @dropped_assignments = [0, 3].map { |i| @assignments[i] }
      @dropped_submissions = @dropped_assignments.map { |a| Submission.find_by(assignment: a, user: @student) }
    end

    let(:student_enrollment) { @student.enrollments.first }
    let(:scores) { @student.enrollments.first.scores.preload(:score_metadata).index_by(&:grading_period_id) }
    let(:overall_course_score) { @student.enrollments.first.scores.find_by(course_score: true) }
    let(:submission_for_first_assignment) { Submission.find_by(user: @student, assignment: @assignments[1]) }
    let(:submission_for_second_assignment) { Submission.find_by(user: @student, assignment: @assignments[4]) }

    context 'without grading periods' do
      describe 'overall course score' do
        context 'with the percent weighting scheme' do
          before :each do
            # rubocop:disable Rails/SkipsModelValidations
            @course.update_column(:group_weighting_scheme, 'percent')
            # rubocop:enable Rails/SkipsModelValidations
            GradeCalculator.new(@student.id, @course).compute_and_save_scores
          end

          it 'posted current course score is updated' 


          it 'posted current course points are updated' 


          it 'posted final course score is updated' 


          it 'posted final course points are updated' 


          it 'unposted current course score is updated' 


          it 'unposted current course points are updated' 


          it 'unposted final course score is updated' 


          it 'unposted final course points are updated' 

        end

        context 'without a weighting scheme' do
          before :each do
            GradeCalculator.new(@student.id, @course).compute_and_save_scores
          end

          it 'current posted course score is updated' 


          it 'current posted course points are updated' 


          it 'current final course score is updated' 


          it 'current final course points are updated' 


          it 'unposted current course score is updated' 


          it 'unposted current course points are updated' 


          it 'unposted final course score is updated' 


          it 'unposted final course points are updated' 

        end

        it 'schedules assignment score statistic updates as a singleton' 


        it 'does not update score statistics when calculating scores for muted assignments' 

      end

      describe 'assignment group scores' do
        let(:assignment_group_scores) do
          student_enrollment.scores.where.not(assignment_group_id: nil).order(assignment_group_id: :asc)
        end

        context 'with the percent weighting scheme' do
          before :each do
            # rubocop:disable Rails/SkipsModelValidations
            @course.update_column(:group_weighting_scheme, 'percent')
            # rubocop:enable Rails/SkipsModelValidations
            GradeCalculator.new(@student.id, @course).compute_and_save_scores
          end

          it 'posted current assignment group scores are updated' 


          it 'posted current assignment group points are updated' 


          it 'posted final assignment group scores are updated' 


          it 'posted final assignment group points are updated' 


          it 'unposted current assignment group scores are updated' 


          it 'unposted current assignment group points are updated' 


          it 'unposted final assignment group scores are updated' 


          it 'unposted final assignment group points are updated' 

        end

        context 'without a weighting scheme' do
          before :each do
            GradeCalculator.new(@student.id, @course).compute_and_save_scores
          end

          it 'posted current assignment group scores are updated' 


          it 'posted current assignment group points are updated' 


          it 'posted final assignment group scores are updated' 


          it 'posted final assignment group points are updated' 


          it 'unposted current assignment group scores are updated' 


          it 'unposted current assignment group points are updated' 


          it 'unposted final assignment group scores are updated' 


          it 'unposted final assignment group points are updated' 

        end
      end
    end

    context 'with grading periods' do
      before :each do
        @grading_periods = grading_periods(@grading_period_options)
        @first_period, @second_period = @grading_periods
      end

      it 'updates all grading period scores' 


      it 'updates all grading period score metadata' 


      it 'does not update grading period scores if update_all_grading_period_scores is false' 


      it 'schedules assignment score statistic updates as a singleton' 


      context 'when a grading period is provided' do
        it 'updates the grading period score' 


        it 'updates the overall course score' 


        it 'does not update score statistics when calculating non-course scores' 


        it 'does not update scores for other grading periods' 


        it 'does not update the overall course score if update_course_score is false' 


        it 'does not restore previously deleted score if grading period is deleted too' 

      end

      context 'when grading periods are weighted' do
        before :each do
          group = @first_period.grading_period_group
          group.update!(weighted: true)
          @ungraded_assignment = @course.assignments.create!(
            due_at: 1.day.from_now(@second_period.start_date),
            points_possible: 100 # these will be considered for final scores below
          )
        end

        it 'calculates the course score from weighted grading period scores' 


        it 'up-scales grading period weights which add up to less than 100 percent' 


        it 'does not down-scale grading period weights which add up to greater than 100 percent' 


        it 'sets current course score to zero when all grading period weights are zero' 


        it 'sets final course score to zero when all grading period weights are zero' 


        it 'sets current course score to zero when all grading period weights are nil' 


        it 'sets current course score to zero when all grading period weights are nil or zero' 


        it 'sets final course score to zero when all grading period weights are nil' 


        it 'sets final course score to zero when all grading period weights are nil or zero' 


        it 'treats grading periods with nil weights as zero when some grading period ' \
        'weights are nil and computing current score' do
          @first_period.update!(weight: nil)
          @second_period.update!(weight: 50.0)
          GradeCalculator.new(@student.id, @course).compute_and_save_scores
          expect(overall_course_score.current_score).to eq(87.6)
        end

        it 'treats grading periods with nil weights as zero when some grading period ' \
        'weights are nil and computing final score' do
          @first_period.update!(weight: nil)
          @second_period.update!(weight: 50.0)
          GradeCalculator.new(@student.id, @course).compute_and_save_scores
          expect(overall_course_score.final_score).to eq(32.85)
        end

        it 'sets current course score to nil when all grading period current scores are nil' 


        it 'sets final course score to zero when all grading period final scores are nil' 


        it 'does not consider grading periods with nil current score when computing course current score' 


        it 'considers grading periods with nil final score as having zero score when computing course final score' 


        it 'sets course current score to zero when all grading period current scores are zero' 


        it 'sets course final score to zero when all grading period final scores are zero' 


        it 'sets course current score to nil when all grading period current scores are nil ' \
        'and all grading period weights are nil' do
          @first_period.update!(weight: nil)
          @second_period.update!(weight: nil)
          # update_all to avoid callbacks on submission that would trigger the grade calculator
          # rubocop:disable Rails/SkipsModelValidations
          @student.submissions.update_all(score: nil)
          # rubocop:enable Rails/SkipsModelValidations
          GradeCalculator.new(@student.id, @course).compute_and_save_scores
          expect(overall_course_score.current_score).to be_nil
        end

        it 'sets course final score to zero when all grading period final scores are nil and all ' \
        'grading period weights are nil' do
          @first_period.update!(weight: nil)
          @second_period.update!(weight: nil)
          # update_all to avoid callbacks on assignment that would trigger the grade calculator
          # rubocop:disable Rails/SkipsModelValidations
          @course.assignments.update_all(omit_from_final_grade: true)
          # rubocop:enable Rails/SkipsModelValidations
          GradeCalculator.new(@student.id, @course).compute_and_save_scores
          expect(overall_course_score.final_score).to eq(0.0)
        end

        it 'sets course current score to zero when all grading period current scores are zero ' \
        'and all grading period weights are zero' do
          @first_period.update!(weight: 0.0)
          @second_period.update!(weight: 0.0)
          # update_all to avoid callbacks on submission that would trigger the grade calculator
          # rubocop:disable Rails/SkipsModelValidations
          @student.submissions.update_all(score: 0.0)
          # rubocop:enable Rails/SkipsModelValidations
          GradeCalculator.new(@student.id, @course).compute_and_save_scores
          expect(overall_course_score.current_score).to eq(0.0)
        end

        it 'sets course final score to zero when all grading period final scores are zero and ' \
        'all grading period weights are zero' do
          @first_period.update!(weight: 0.0)
          @second_period.update!(weight: 0.0)
          # update_all to avoid callbacks on submission that would trigger the grade calculator
          # rubocop:disable Rails/SkipsModelValidations
          @student.submissions.update_all(score: 0.0)
          # rubocop:enable Rails/SkipsModelValidations
          GradeCalculator.new(@student.id, @course).compute_and_save_scores
          expect(overall_course_score.final_score).to eq(0.0)
        end

        it 'sets course current score to nil when all grading period current scores are nil and ' \
        'all grading period weights are zero' do
          @first_period.update!(weight: 0.0)
          @second_period.update!(weight: 0.0)
          # update_all to avoid callbacks on submission that would trigger the grade calculator
          # rubocop:disable Rails/SkipsModelValidations
          @student.submissions.update_all(score: nil)
          # rubocop:enable Rails/SkipsModelValidations
          GradeCalculator.new(@student.id, @course).compute_and_save_scores
          expect(overall_course_score.current_score).to be_nil
        end

        it 'sets course final score to zero when all grading period final scores are nil and all ' \
        'grading period weights are zero' do
          @first_period.update!(weight: 0.0)
          @second_period.update!(weight: 0.0)
          # update_all to avoid callbacks on assignment that would trigger the grade calculator
          # rubocop:disable Rails/SkipsModelValidations
          @course.assignments.update_all(omit_from_final_grade: true)
          # rubocop:enable Rails/SkipsModelValidations
          GradeCalculator.new(@student.id, @course).compute_and_save_scores
          expect(overall_course_score.final_score).to eq(0.0)
        end

        it 'sets course current score to zero when all grading period current scores are zero and ' \
        'all grading period weights are nil' do
          @first_period.update!(weight: nil)
          @second_period.update!(weight: nil)
          # update_all to avoid callbacks on submission that would trigger the grade calculator
          # rubocop:disable Rails/SkipsModelValidations
          @student.submissions.update_all(score: 0.0)
          # rubocop:enable Rails/SkipsModelValidations
          GradeCalculator.new(@student.id, @course).compute_and_save_scores
          expect(overall_course_score.current_score).to eq(0.0)
        end

        it 'sets course final score to zero when all grading period final scores are zero and all ' \
        'grading period weights are nil' do
          @first_period.update!(weight: nil)
          @second_period.update!(weight: nil)
          # update_all to avoid callbacks on submission that would trigger the grade calculator
          # rubocop:disable Rails/SkipsModelValidations
          @student.submissions.update_all(score: 0.0)
          # rubocop:enable Rails/SkipsModelValidations
          GradeCalculator.new(@student.id, @course).compute_and_save_scores
          expect(overall_course_score.final_score).to eq(0.0)
        end
      end

      describe 'assignment group scores' do
        let(:assignment_group_scores) do
          student_enrollment.scores.where.not(assignment_group_id: nil).order(assignment_group_id: :asc)
        end

        context 'with the percent weighting scheme' do
          before :each do
            @course.update_column(:group_weighting_scheme, 'percent')
            GradeCalculator.new(@student.id, @course).compute_and_save_scores
          end

          it 'posted current assignment group scores are updated' 


          it 'posted current assignment group points are updated' 


          it 'posted final assignment group scores are updated' 


          it 'posted final assignment group points are updated' 


          it 'unposted current assignment group scores are updated' 


          it 'unposted current assignment group points are updated' 


          it 'unposted final assignment group scores are updated' 


          it 'unposted final assignment group points are updated' 

        end

        context 'without a weighting scheme' do
          before :each do
            GradeCalculator.new(@student.id, @course).compute_and_save_scores
          end

          it 'posted current assignment group scores are updated' 


          it 'posted current assignment group points are updated' 


          it 'posted final assignment group scores are updated' 


          it 'posted final assignment group points are updated' 


          it 'unposted current assignment group scores are updated' 


          it 'unposted current assignment group points are updated' 


          it 'unposted final assignment group scores are updated' 


          it 'unposted final assignment group points are updated' 

        end
      end
    end

    it 'updates the overall course score metadata' 


    it 'updates the overall course score metadata when only_update_course_gp_metadata: true' 


    it 'does not update the overall course score when only_update_course_gp_metadata: true' 


    context 'when given only_update_points: true' do
      before :each do
        GradeCalculator.new(@student.id, @course).compute_and_save_scores
        initial_scores = Score.where(enrollment: @course.enrollments.find_by(user: @student)).order(id: :asc)
        updated_score_attributes = {
          current_points: nil,
          current_score: nil,
          final_points: nil,
          final_score: nil,
          unposted_current_points: nil,
          unposted_current_score: nil,
          unposted_final_points: nil,
          unposted_final_score: nil
        }
        # rubocop:disable Rails/SkipsModelValidations
        initial_scores.update_all(updated_score_attributes)
        # rubocop:enable Rails/SkipsModelValidations

        GradeCalculator.new(@student.id, @course, only_update_points: true).compute_and_save_scores
        @final_scores = Score.where(enrollment: @course.enrollments.find_by(user: @student)).order(id: :asc).to_a
      end

      it 'updates current_points' 


      it 'updates unposted_current_points' 


      it 'updates final_points' 


      it 'updates unposted_final_points' 


      it 'updates current_score' 


      it 'updates unposted_current_score' 


      it 'updates final_score' 


      it 'updates unposted_final_score' 

    end

    it 'restores and updates previously deleted scores' 


    context("assignment group scores") do
      before(:each) do
        @group1 = @course.assignment_groups.create!(name: "some group 1")
        @assignment1 = @course.assignments.create!(name: "assignment 1", points_possible: 20, assignment_group: @group1)
        @assignment1.grade_student(@student, grade: 12, grader: @teacher)
        @group2 = @course.assignment_groups.create!(name: "some group 2")
        @assignment2 = @course.assignments.create!(name: "assignment 2", points_possible: 20, assignment_group: @group2)
        @assignment2.grade_student(@student, grade: 18, grader: @teacher)
        GradeCalculator.new(@student.id, @course).compute_and_save_scores
      end

      let(:student_scores) { @student.enrollments.first.scores }

      it "stores separate assignment group scores for each of a student’s enrollments" 


      it "creates a course score for the student if one does not exist, but assignment group scores exist" 


      it "updates active score rows for assignment groups if they already exist" 


      it "activates previously soft deleted assignment group scores when updating them" 


      it "inserts score rows for assignment groups unless they already exist" 

    end
  end

  it "should return grades in the order they are requested" 


  it "returns point information for unweighted courses" 


  # We should keep this in sync with GradeCalculatorSpec.coffee
  context "GradeCalculatorSpec.coffee examples" do
    before :each do
      @group = @group1 = @course.assignment_groups.create!(:name => 'group 1')
    end

    def set_default_grades
      set_grades [[100,100], [42,91], [14,55], [3,38], [nil,1000]]
    end

    def set_grades(grades, group=@group1)
      @grades = grades
      @assignments = @grades.map do |score,possible|
        @course.assignments.create! :title => 'homework',
                                    :points_possible => possible,
                                    :assignment_group => group
      end
      @assignments.each_with_index do |a,i|
        score = @grades[i].first
        next unless score # don't grade nil submissions
        a.grade_student @student, grade: score, grader: @teacher
      end
    end

    def check_grades(current, final, check_current: true, check_final: true)
      GradeCalculator.recompute_final_score(@student.id, @course.id)
      @enrollment.reload
      expect(@enrollment.computed_current_score).to eq current if check_current
      expect(@enrollment.computed_final_score).to eq final if check_final
    end

    def check_current_grade(current)
      check_grades(current, nil, check_current: true, check_final: false)
    end

    def check_final_grade(final)
      check_grades(nil, final, check_current: false, check_final: true)
    end

    it "should work without assignments or submissions" 


    it "should work without submissions" 


    it "should work with submissions that have 0 points possible" 


    it "muted assignments are not considered for the drop list when computing " \
      "current grade for students (they are just excluded from the computation entirely)" do
      set_grades([[4, 10], [3, 10], [9, 10]])
      @group.update_attribute(:rules, 'drop_lowest:1')
      @assignments.first.mute!
      # 4/10 is excluded from the computation because it's muted
      # 3/10 is dropped for being the lowest
      # 9/10 is included
      # 9/10 => 90.0%
      check_current_grade(90.0)
    end

    it "ungraded assignments are not considered for the drop list when computing " \
      "current grade for students (they are just excluded from the computation entirely)" do
      set_grades([[nil, 20], [3, 10], [9, 10]])
      @group.update_attribute(:rules, 'drop_lowest:1')
      # nil/20 is excluded from the computation because it's not graded
      # 3/10 is dropped for being the lowest
      # 9/10 is included
      # 9/10 => 90.0%
      check_current_grade(90.0)
    end

    it "ungraded + muted assignments are not considered for the drop list when " \
      "computing current grade for students (they are just excluded from the computation entirely)" do
      set_grades([[nil, 20], [4, 10], [3, 10], [9, 10]])
      @group.update_attribute(:rules, 'drop_lowest:1')
      @assignments.second.mute!
      # nil/20 is excluded from the computation because it's not graded
      # 4/10 is exclued from the computation because it's muted
      # 3/10 is dropped for being the lowest
      # 9/10 is included
      # 9/10 => 90.0%
      check_current_grade(90.0)
    end

    it "ungraded assignments are treated as 0/points_possible for the drop list " \
      "when computing final grade for students" do
      set_grades([[nil, 20], [3, 10], [9, 10]])
      @group.update_attribute(:rules, 'drop_lowest:1')
      # nil/20 is treated as 0/20 because it's not graded
      # 3/10 is included
      # 9/10 is included
      # 12/20 => 60.0%
      check_final_grade(60.0)
    end

    it "muted assignments are not considered for the drop list when computing " \
      "final grade for students (but they are included as 0/10 in the final computation)" do
      set_grades([[4, 10], [3, 10], [9, 10]])
      @group.update_attribute(:rules, 'drop_lowest:1')
      @assignments.first.mute!
      # 4/10 is ignored for drop rules because it is muted. it is included
      # 3/10 is dropped for being the lowest
      # 9/10 is included
      # (4/10 is treated as 0/10 because it is muted) + 9/10 = 9/20 => 45.0%
      check_final_grade(45.0)
    end

    it "ungraded are treated as 0/points_possible for the drop list and muted " \
      "assignments are ignored for the drop list when computing final grade for students" do
      set_grades([[nil, 20], [4, 10], [3, 10], [9, 10]])
      @group.update_attribute(:rules, 'drop_lowest:1')
      @assignments.second.mute!
      # nil/20 is treated as 0/20 because it's not graded. it is dropped.
      # 4/10 is ignored for drop rules because it is muted. it is included.
      # 3/10 is included
      # 9/10 is included
      # (4/10 is treated as 0/10 because it is muted) + 3/10 + 9/10 = 12/30 => 40.0%
      check_final_grade(40.0)
    end

    it 'should "work" when no submissions have points possible' 


    it "should work with no drop rules" 


    it "should support drop_lowest" 


    it "should really support drop_lowest" 


    it "should support drop_highest" 


    it "should really support drop_highest" 


    it "should work with unreasonable drop rules" 


    it "should support never_drop" 


    it "grade dropping should work even in ridiculous circumstances" 


    context "assignment groups with 0 points possible" do
      before :each do
        @group1.group_weight = 50
        @group1.save!
        @group2 = @course.assignment_groups.create! :name => 'group 2',
                                                    :group_weight => 25
        @group3 = @course.assignment_groups.create! :name => 'empty group',
                                                    :group_weight => 25
        @group4 = @course.assignment_groups.create! :name => 'extra credit',
                                                    :group_weight => 10

        set_grades [[9, 10]], @group1
        set_grades [[5, 10]], @group2
        # @group3 is emtpy
        set_grades [[10, 0], [5, 0]], @group3
      end

      it "ignores them if the group_weighting_scheme is percent" 


      it "doesn't ignore them if the group_weighting_scheme is equal" 

    end

    context "grading periods" do
      before :each do
        student_in_course active_all: true
        @gp1, @gp2 = grading_periods count: 2
        @a1, @a2 = [@gp1, @gp2].map do |gp|
          @course.assignments.create! due_at: 1.minute.from_now(gp.start_date),
            points_possible: 100
        end
        @a1.grade_student(@student, grade: 25, grader: @teacher)
        @a2.grade_student(@student, grade: 75, grader: @teacher)
      end

      it "can compute grades for a grading period" 

    end

    context "differentiated assignments grade calculation" do
      def set_up_course_for_differentiated_assignments
          set_grades [[5, 20], [15, 20], [10,20], [nil, 20], [20, 20], [10,20], [nil, 20]]
          @assignments.each do |a|
            a.only_visible_to_overrides = true
            a.save!
          end
          @overridden_lowest = @assignments[0]
          @overridden_highest = @assignments[1]
          @overridden_middle = @assignments[2]
          @non_overridden_lowest = @assignments[3]
          @non_overridden_highest = @assignments[4]
          @non_overridden_middle = @assignments[5]
          @not_graded = @assignments.last

          @user.enrollments.each(&:destroy)
          @section = @course.course_sections.create!(name: "test section")
          student_in_section(@section, user: @user)

          create_section_override_for_assignment(@overridden_lowest, course_section: @section)
          create_section_override_for_assignment(@overridden_highest, course_section: @section)
          create_section_override_for_assignment(@overridden_middle, course_section: @section)
      end

      def final_grade_info(user, course)
        GradeCalculator.new([user.id], course.id).compute_scores.first[:final]
      end

      def find_submission(assignment)
        assignment.submissions.where(user_id: @user.id).first.id
      end

      context "DA" do
        before :each do
          set_up_course_for_differentiated_assignments
        end
        it "should calculate scores based on visible assignments only" 

        it "should drop the lowest visible when that rule is in place" 

        it "should drop the highest visible when that rule is in place" 

        it "should not count an invisible assignment with never drop on" 

        it "saves scores for all assignment group and enrollment combinations" 

        it "saves dropped submission to group score metadata" 


        it "does not include muted assignments in the dropped submission list in group score metadata" 


        it "saves dropped submissions to course score metadata" 


        it "does not include muted assignments in the dropped submission list in course score metadata" 


        it "updates existing course score metadata" 

      end
    end

    context "excused assignments" do
      before :each do
        student_in_course(active_all: true)
        @a1 = @course.assignments.create! points_possible: 10
        @a2 = @course.assignments.create! points_possible: 90
      end

      it "works" 

    end

    context "caches" do
      it 'calls invalidate caches in #compute_and_save_scores' 


      describe "#invalidate_caches" do
        it 'calls GradeSummaryPresenter.invalidate_cache' 

      end
    end
  end
end

