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
#

require_relative '../sharding_spec_helper'

describe AssignmentOverrideApplicator do
  def create_group_override
    @category = group_category
    @group = @category.groups.create!(context: @course)

    @assignment.group_category = @category
    @assignment.save!

    @override = assignment_override_model(:assignment => @assignment)
    @override.set = @group
    @override.save!

    @membership = @group.add_user(@student)
  end

  def create_group_override_for_discussion
    @category = group_category(name: "bar")
    @group = @category.groups.create!(context: @course)

    @assignment = create_assignment(:course => @course)
    @assignment.submission_types = 'discussion_topic'
    @assignment.saved_by = :discussion_topic
    @discussion_topic = @course.discussion_topics.create(:message => "some message")
    @discussion_topic.group_category_id = @category.id
    @discussion_topic.assignment = @assignment
    @discussion_topic.save!
    @assignment.reload

    @override = assignment_override_model(:assignment => @assignment)
    @override.set = @group
    @override.save!

    @membership = @group.add_user(@student)
  end

  def create_assignment(*args)
    # need to make sure it doesn't invalidate the cache right away
    Timecop.freeze(5.seconds.ago) do
      assignment_model(*args)
    end
  end

  describe "assignment_overridden_for" do
    before :each do
      student_in_course
      @assignment = create_assignment(:course => @course)
    end

    it "should note the user id for whom overrides were applied" 


    it "should note the user id for whom overrides were not found" 


    it "should apply new overrides if an overridden assignment is overridden for a new user" 


    it "should not attempt to apply overrides if an overridden assignment is overridden for the same user" 


    it "ignores soft deleted Assignment Override Students" 


    context "give teachers the more lenient of override.due_at or assignment.due_at" do
      before do
        teacher_in_course
        @section = @course.course_sections.create! :name => "Overridden Section"
        student_in_section(@section)
        @student = @user
      end

      def override_section(section, due)
        override = assignment_override_model(:assignment => @assignment)
        override.set = section
        override.override_due_at(due)
        override.save!
      end

      def setup_overridden_assignments(section_due_at, assignment_due_at)
        override_section(@section, section_due_at)
        @assignment.update_attribute(:due_at, assignment_due_at)

        @students_assignment = AssignmentOverrideApplicator.
          assignment_overridden_for(@assignment, @student)
        @teachers_assignment = AssignmentOverrideApplicator.
          assignment_overridden_for(@assignment, @teacher)
      end

      it "assignment.due_at is more lenient" 


      it "override.due_at is more lenient" 


      it "ignores assignment.due_at if all sections have overrides" 

    end
  end

  describe "overrides_for_assignment_and_user" do
    before :each do
      student_in_course
      @assignment = create_assignment(:course => @course, :due_at => 5.days.from_now)
    end

    context 'it works' do
      it "should be serializable" 


      it "should cache by assignment and user" 


      it "should distinguish cache by assignment" 


      it "should distinguish cache by assignment version" 


      it "should distinguish cache by user" 


      it "should order adhoc override before group override" 


      it "should order group override before section overrides" 


      it "should order section overrides by position" # see TODO in implementation

      context "sharding" do
        specs_require_sharding

        it "should not break when running for a teacher on a different shard" 

      end
    end

    context 'adhoc overrides' do
      before :each do
        @override = assignment_override_model(:assignment => @assignment)
        @override_student = @override.assignment_override_students.build
        @override_student.user = @student
        @override_student.save!
      end

      describe 'for students' do
        it "should include adhoc override for the user" 


        it "should not include adhoc overrides that don't include the user" 


        it "finds the overrides for the correct student" 


        it "returns AssignmentOverrideStudent" 

      end

      describe 'for teachers' do
        before { teacher_in_course(:active_all => true) }

        it "works" 


        it "should not duplicate adhoc overrides" 

      end

      describe 'for observers' do
        it "works" 

      end

      describe 'for admins' do
        it "works" 

      end
    end

    context 'group overrides' do
      before :each do
        create_group_override
      end

      describe 'for students' do
        it 'returns group overrides' 


        it 'returns groups overrides for graded discussions' 


        it "should not include group override for groups other than the user's" 


        it "should not include group override for deleted groups" 


        it "should not include group override for deleted group memberships" 

      end

      describe 'for teachers' do
        it 'works' 

      end

      describe 'for observers' do
        it 'works' 

      end

      describe 'for admins' do
        it 'works' 

      end
    end

    context 'section overrides' do
      before :each do
        @override = assignment_override_model(:assignment => @assignment)
        @override.set = @course.default_section
        @override.save!
        @section2 = @course.course_sections.create!(:name => "Summer session")
        @override2 = assignment_override_model(:assignment => @assignment)
        @override2.set_type = 'CourseSection'
        @override2.set_id = @section2.id
        @override2.due_at = 7.days.from_now
        @override2.save!
        @student2 = student_in_section(@section2, {:active_all => true})
      end

      describe 'for students' do
        it "returns section overrides" 


        it "should enforce lenient date" 


        it "should include section overrides for sections with an active student enrollment" 


        it "should not include section overrides for sections with deleted enrollments" 


        it "should not include section overrides for sections with concluded enrollments" 


        it "should include all relevant section overrides" 


        it "should work even if :read_roster is disabled" 


        it "should only use the latest due_date for student_view_student" 


        it "should not include section overrides for sections without an enrollment" 

      end

      describe 'for teachers' do
        it 'works' 

      end

      describe 'for observers' do
        it 'works' 

      end

      describe 'for admins' do
        it 'works' 

      end
    end

    context '#observer_overrides' do
      it "returns all dates visible to observer" 

    end

    context '#has_invalid_args?' do
      it "returns true with nil user" 


      it "returns true for assignments with no overrides" 


      it "returns false if user and overrides are valid" 

    end

    context "versioning" do
      it "should use the appropriate version of an override" 


      it "should use the most-recent override version for the given assignment version" 


      it "should exclude overrides that weren't created until a later assignment version" 


      it "should exclude overrides that were deleted as of the assignment version" 


      it "should include now-deleted overrides that weren't deleted yet as of the assignment version" 


      it "should include now-deleted overrides that weren't deleted yet as of the assignment version (with manage_courses permission)" 


      context "overrides for an assignment for a quiz, where the overrides were created before the quiz was published" do
        context "without draft states" do
          it "skips versions of the override that have nil for an assignment version" 

        end

        context "with draft states" do
          it "quiz should always have an assignment for overrides" 

        end
      end
    end
  end

  describe "assignment_with_overrides" do
    before :each do
      Time.zone == 'Alaska'
      @assignment = create_assignment(
        :due_at => 5.days.from_now,
        :unlock_at => 4.days.from_now,
        :lock_at => 6.days.from_now,
        :title => 'Some Title')
      @override = assignment_override_model(:assignment => @assignment)
      @override.override_due_at(7.days.from_now)
      @overridden = AssignmentOverrideApplicator.assignment_with_overrides(@assignment, [@override])
    end

    it "should return a new assignment object" 


    it "should preserve assignment id" 


    it "should be new_record? iff the original assignment is" 


    it "should apply overrides to the returned assignment object" 


    it "should not change the original assignment object" 


    it "should inherit other values from the original assignment object" 


    it "should return a readonly assignment object" 


    it "should cast datetimes to the active time zone" 


    it "should not cast dates to zoned datetimes" 


    it "should copy pre-loaded associations" 


    it "should be locked in between overrides" 


    it "should not be locked when in an override" 

  end

  describe "collapsed_overrides" do
    it "should cache by assignment and overrides" 


    it "should distinguish cache by assignment" 


    it "should distinguish cache by assignment updated_at" 


    it "should distinguish cache by overrides" 


    it "should have a collapsed value for each recognized field" 


    it "should use raw UTC time for datetime fields" 


    it "should not use raw UTC time for date fields" 

  end

  describe "overrides_hash" do
    it "should be consistent for the same overrides" 


    it "should be unique for different overrides" 


    it "should be unique for different versions of the same overrides" 


    it "should be unique for different orders of the same overrides" 

  end

  def fancy_midnight(opts={})
    zone = opts[:zone] || Time.zone
    Time.use_zone(zone) do
      time = opts[:time] || Time.zone.now
      time.in_time_zone.midnight + 1.day - 1.minute
    end
  end

  describe "overridden_due_at" do
    before :each do
      @assignment = create_assignment(:due_at => 5.days.from_now)
      @override = assignment_override_model(:assignment => @assignment)
    end

    it "should use overrides that override due_at" 


    it "should skip overrides that don't override due_at" 


    it "should prefer most lenient override" 


    it "should consider no due date as most lenient" 


    it "should not consider empty original due date as more lenient than an override due date" 


    it "prefers overrides even when earlier when determining most lenient due date" 


    it "should fallback on the assignment's due_at" 


    it "should recognize overrides with overridden-but-nil due_at" 

  end

  # specs for overridden_due_at cover all_day and all_day_date, since they're
  # pulled from the same assignment/override the due_at is

  describe "overridden_unlock_at" do
    before :each do
      @assignment = create_assignment(:unlock_at => 10.days.from_now)
      @override = assignment_override_model(:assignment => @assignment)
    end

    it "should use overrides that override unlock_at" 


    it "should skip overrides that don't override unlock_at" 


    it "should prefer most lenient override" 


    it "should consider no unlock date as most lenient" 


    it "should not consider empty original unlock date as more lenient than an override unlock date" 


    it "prefers overrides even when later when determining most lenient unlock date" 


    it "should fallback on the assignment's unlock_at" 


    it "should recognize overrides with overridden-but-nil unlock_at" 


    it "should not include unlock_at for previous overrides that have already been locked" 

  end

  describe "overridden_lock_at" do
    before :each do
      @assignment = create_assignment(:lock_at => 5.days.from_now)
      @override = assignment_override_model(:assignment => @assignment)
    end

    it "should use overrides that override lock_at" 


    it "should skip overrides that don't override lock_at" 


    it "should prefer most lenient override" 


    it "should consider no lock date as most lenient" 


    it "should not consider empty original lock date as more lenient than an override lock date" 


    it "prefers overrides even when earlier when determining most lenient lock date" 


    it "should fallback on the assignment's lock_at" 


    it "should recognize overrides with overridden-but-nil lock_at" 

  end

  describe "Overridable#has_no_overrides" do
    before do
      student_in_course
      @assignment = create_assignment(:course => @course,
                                     :due_at => 1.week.from_now)
      o = assignment_override_model(:assignment => @assignment,
                                    :due_at => 1.week.ago)
      o.assignment_override_students.create! user: @student
    end

    it "makes assignment_overridden_for lie!" 

  end

  describe "without_overrides" do
    before :each do
      student_in_course
      @assignment = create_assignment(:course => @course)
    end

    it "should return an unoverridden copy of an overridden assignment" 

  end

  it "should use the full stack" 


  it "should not cache incorrect overrides through due_between_with_overrides" 

end

