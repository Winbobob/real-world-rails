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

require File.expand_path(File.dirname(__FILE__) + '/../../sharding_spec_helper')

describe "MessageableUser::Calculator" do
  before do
    @viewing_user = user_factory
    @calculator = MessageableUser::Calculator.new(@viewing_user)
  end

  describe "uncached crunchers" do
    describe "#uncached_visible_section_ids" do
      before do
        course_with_student(:user => @viewing_user, :active_all => true)
      end

      it "should not include sections from fully visible courses" 


      it "should include sections from section visible courses" 


      it "should not include sections from restricted visibility courses" 

    end

    describe "#uncached_visible_section_ids_in_course" do
      before do
        course_with_student(:user => @viewing_user, :active_all => true)
        @section = @course.course_sections.create!
      end

      it "should include sections the user is enrolled in" 


      it "should not include sections the user is not enrolled in" 


      it "should not include sections from deleted enrollments" 

    end

    describe "#uncached_observed_student_ids" do
      before do
        @observer_enrollment = course_with_observer(:user => @viewing_user, :active_all => true)
        @observer_enrollment.associated_user = student_in_course(:active_all => true).user
        @observer_enrollment.save!
        RoleOverride.manage_role_override(Account.default, observer_role, 'send_messages', :override => true)
      end

      it "should return an empty hash when no courses" 


      it "should not include observed students from fully visible courses" 


      it "should not include observed students from section visible courses" 


      it "should include observed students from restricted visibility courses" 

    end

    describe "#uncached_observed_student_ids_in_course" do
      before do
        @observer_enrollment = course_with_observer(:user => @viewing_user, :active_all => true)
        @observer_enrollment.associated_user = student_in_course(:active_all => true).user
        @observer_enrollment.save!
      end

      it "should include students the user observes" 


      it "should not include students the user is not observing" 

    end

    describe "#uncached_linked_observer_ids" do
      before do
        course_with_student(:user => @viewing_user, :active_all => true)
      end

      it "should return users observing the student" 


      it "should not return users observing other students" 

    end

    describe "#uncached_visible_account_ids" do
      it "should return the user's accounts for which the user can read_roster" 


      it "should not return accounts the user is not in" 


      it "should not return accounts where the user cannot read_roster" 

    end

    describe "#uncached_fully_visible_group_ids" do
      before do
        course_with_student(:user => @viewing_user, :active_all => true)
        group(:group_context => @course)
      end

      it "should include groups the user is in" 


      context "group in fully visible courses" do
        it "should include the group if the enrollment is active" 


        context "concluded enrollment" do
          before do
            @enrollment.workflow_state == 'completed'
            @enrollment.save!
          end

          it "should include the group if the course is still active" 


          it "should include the group if the course was recently concluded" 


          it "should not include the group if the course concluding was not recent" 


          it "should include the group regardless of course concluding if the user's in the group" 

        end
      end

      context "group in section visible course" do
        before do
          Enrollment.limit_privileges_to_course_section!(@course, @viewing_user, true)
        end

        it "should not include the group" 


        it "should include the group if the user's in it" 

      end

      context "group in restricted visibilty course" do
        before do
          RoleOverride.manage_role_override(Account.default, student_role, 'send_messages', :override => false)
        end

        it "should not include the group" 


        it "should include the group if the user's in it" 

      end
    end

    describe "#uncached_section_visible_group_ids" do
      before do
        course_with_student(:user => @viewing_user, :active_all => true)
        group(:group_context => @course)
      end

      it "should not include groups not in a course, even with the user in it" 


      it "should not include groups in fully visible courses, even with the user in it" 


      context "group in section visible course" do
        before do
          Enrollment.limit_privileges_to_course_section!(@course, @viewing_user, true)
        end

        it "should include the group" 


        it "should not include the group if the user is in it" 

      end

      it "should not include groups in restricted visibility courses, even with the user in it" 

    end

    describe "#uncached_group_ids_in_courses" do
      it "should include active groups in the courses" 


      it "should not include deleted groups in the courses" 


      it "should not include groups in other courses" 

    end

    describe "#uncached_messageable_sections" do
      before do
        course_with_teacher(:user => @viewing_user, :active_all => true)
      end

      it "should include all sections from fully visible courses with multiple sections" 


      it "should include only enrolled sections from section visible courses" 


      it "should not include sections from courses with only one sections" 

    end

    describe "#uncached_messageable_groups" do
      it "should include groups the user is in" 


      it "should include groups in fully visible courses with messageable group members" 


      it "should include groups in section visible courses with messageable group members" 


      it "should not include empty groups in fully visible courses" 


      it "should not include empty groups in section visible courses" 


      it "should not include groups in section visible courses whose only members are non-messageable" 

    end
  end

  describe "shard_cached" do
    before do
      @expected1 = 'random_string1'
      @expected2 = 'random_string2'
      @expected3 = 'random_string3 (also ponies)'
      Foo = Struct.new(:cache_key)
    end

    after do
      Object.send(:remove_const, :Foo)
    end

    describe "sharding" do
      specs_require_sharding

      it "should yield once for each of the user's associated shards" 

    end

    describe "rails cache" do
      it "should share across calculators with same user" 


      it "should distinguish users" 


      it "should notice when a user changes" 


      it "should be sensitive to the key" 


      it "should be sensitive to the method results from additional parameters" 

    end

    describe "object-local cache" do
      it "should cache the result the key" 


      it "should distinguish different keys" 

    end
  end

  describe "sharded and cached summaries" do
    specs_require_sharding

    before do
      @account1 = @shard1.activate{ Account.create! }
      @account2 = @shard2.activate{ Account.create! }
      @course1 = course_factory(:account => @account1, :active_all => 1)
      @course2 = course_factory(:account => @account2, :active_all => 1)
      course_with_student(:course => @course1, :user => @viewing_user, :active_all => 1)
      course_with_student(:course => @course2, :user => @viewing_user, :active_all => 1)
    end

    it "should partition courses by shard in all_courses_by_shard" 


    describe "#visible_section_ids_by_shard" do
      before do
        Enrollment.limit_privileges_to_course_section!(@course1, @viewing_user, true)
        Enrollment.limit_privileges_to_course_section!(@course2, @viewing_user, true)
      end

      it "should have data local to the shard in the shard bin" 


      it "should include sections from each shard" 

    end

    describe "#visible_section_ids_in_courses" do
      before do
        Enrollment.limit_privileges_to_course_section!(@course1, @viewing_user, true)
        Enrollment.limit_privileges_to_course_section!(@course2, @viewing_user, true)
      end

      it "should only include ids from the current shard" 


      it "should not include ids from other courses" 

    end

    describe "#observed_student_ids_by_shard" do
      before do
        RoleOverride.manage_role_override(@account1, observer_role, 'send_messages', :override => false)
        RoleOverride.manage_role_override(@account2, observer_role, 'send_messages', :override => false)
        @observer_enrollment1 = course_with_observer(:course => @course1, :active_all => true)
        @observer = @observer_enrollment1.user
        @observer_enrollment2 = course_with_observer(:course => @course2, :user => @observer, :active_all => true)
        @calculator = MessageableUser::Calculator.new(@observer)
      end

      it "should handle shard-local observer observing shard-local student" 


      it "should handle shard-local observer observing cross-shard student" 


      it "should handle cross-shard observer observing local-shard student" 


      it "should handle cross-shard observer observing cross-shard student" 

    end

    describe "#observed_student_ids_in_courses" do
      before do
        RoleOverride.manage_role_override(@account1, observer_role, 'send_messages', :override => false)
        RoleOverride.manage_role_override(@account2, observer_role, 'send_messages', :override => false)

        @student1 = student_in_course(:course => @course1, :active_all => true).user
        @observer_enrollment1 = course_with_observer(:course => @course1, :active_all => true)
        @observer_enrollment1.associated_user = @student1
        @observer_enrollment1.save!

        @observer = @observer_enrollment1.user

        @student2 = student_in_course(:course => @course2, :active_all => true).user
        @observer_enrollment2 = course_with_observer(:course => @course2, :user => @observer, :active_all => true)
        @observer_enrollment2.associated_user = @student2
        @observer_enrollment2.save!

        @calculator = MessageableUser::Calculator.new(@observer)
      end

      it "should only include ids from the current shard" 


      it "should not include ids from other courses" 

    end

    describe "#linked_observer_ids_by_shard" do
      before do
        @observer1 = @shard1.activate{ user_factory }
        @observer2 = @shard2.activate{ user_factory }

        @observer_enrollment1 = course_with_observer(:course => @course2, :user => @observer1, :active_all => true)
        @observer_enrollment1.associated_user = @viewing_user
        @observer_enrollment1.save!

        @observer_enrollment2 = course_with_observer(:course => @course2, :user => @observer2, :active_all => true)
        @observer_enrollment2.associated_user = @viewing_user
        @observer_enrollment2.save!
      end

      it "should not partition observers by shards" 


      it "should transpose observers ids to shard" 

    end

    it "should partition accounts by shard in visible_account_ids_by_shard" 


    describe "fully_visible_group_ids_by_shard" do
      it "should include fully visible groups" 


      it "should not include section visible groups" 


      it "should partition groups by shard" 

    end

    describe "section_visible_group_ids_by_shard" do
      it "should include section visible groups" 


      it "should not include fully visible groups" 


      it "should partition groups by shard" 

    end

    describe "messageable_sections" do
      it "should include messageable sections from any shard" 

    end

    describe "messageable_groups" do
      it "should include messageable groups from any shard" 

    end
  end

  describe "public api" do
    describe "load_messageable_users" do
      it "should not break when given an otherwise unmessageable user and a non-nil but empty conversation_id" 


      it "should find common courses for users with a common course" 


      it "should find all common courses for users with a multiple common courses" 


      it "should only count courses which generate messageability as common" 


      it "should find common groups for users with a common group" 


      it "should find all common groups for users with a multiple common groups" 


      it "should only count groups which generate messageability as common" 


      it "includes user who are admins of the account with no enrollments" 


      context "creation pending users" do
        before do
          course_with_teacher(:user => @viewing_user, :active_all => true)
          student_in_course(:active_all => true, :user_state => 'creation_pending')
        end

        it "should be excluded by default" 


        it "should be included with strict_checks=false" 


        it "should set appropriate common courses with strict_checks=false" 

      end

      context "deleted users" do
        before do
          course_with_teacher(:user => @viewing_user, :active_all => true)
          student_in_course(:active_all => true, :user_state => 'deleted')
        end

        it "should be excluded by default" 


        it "should be included with strict_checks=false" 


        it "should set appropriate common courses with strict_checks=false" 

      end

      context "unmessageable user" do
        before do
          course_with_teacher(:user => @viewing_user, :active_all => true)
          student_in_course(:active_all => true, :section => @course.course_sections.create!)
          Enrollment.limit_privileges_to_course_section!(@course, @viewing_user, true)
          group_with_user(:group_context => @course, :user => @student)
        end

        it "should not return unmessageable users by default" 


        it "should return nominally unmessageable users with strict_checks=false" 


        it "should not set common_courses on nominally unmessageable users" 


        it "should not set common_groups on users included only due to strict_checks=false" 

      end

      context "with conversation_id" do
        before do
          @bob = user_factory(active_all: true)
        end

        it "should not affect anything if the user was already messageable" 


        it "should make otherwise unmessageable user messageable without adding common contexts" 


        it "should have no effect if conversation doesn't involve viewing user" 


        it "should have no effect if conversation doesn't involve target user" 


        context "sharding" do
          specs_require_sharding

          it "should work if the conversation's on another shard" 

        end
      end
    end

    describe "messageable_users_in_context" do
      it "should recognize asset string course_X" 


      it "should recognize asset string course_X_admins" 


      it "should recognize asset string course_X_students" 


      it "should recognize asset string section_X" 


      it "should recognize asset string section_X_admins" 


      it "should recognize asset string section_X_students" 


      it "should recognize asset string group_X" 

    end

    describe "messageable_users_in_course" do
      before do
        course_with_teacher(:user => @viewing_user, :active_all => true)
        student_in_course(:active_all => true)
      end

      it "should include users from the course" 


      it "should exclude otherwise messageable users not in the course" 


      it "should work with a course id" 


      context "with enrollment_types" do
        it "should include users with the specified types" 


        it "should exclude otherwise messageable users in the course without the specified types" 

      end
    end

    describe "messageable_users_in_section" do
      before do
        course_with_teacher(:user => @viewing_user, :active_all => true)
        student_in_course(:active_all => true)
        @section = @course.default_section
      end

      it "should include users from the section" 


      it "should exclude otherwise messageable users not in the section" 


      it "should work with a section id" 


      context "with enrollment_types" do
        it "should include users with the specified types" 


        it "should exclude otherwise messageable users in the section without the specified types" 

      end

      context "with admin_context" do
        it "should treat the section as if visible" 

      end

      context "sharding" do
        specs_require_sharding

        it "should work with sections on different shards" 

      end
    end

    describe "messageable_users_in_group" do
      before do
        group_with_user(:active_all => true)
        @group.add_user(@viewing_user)
      end

      it "should include users from the group" 


      it "should exclude otherwise messageable users not in the group" 


      it "should work with a group id" 


      context "with admin_context" do
        it "should treat the group as if fully visible" 

      end
    end

    describe "search_messageable_users" do
      def messageable_user_ids(options={})
        @calculator.search_messageable_users(options).
          paginate(:per_page => 100).map(&:id)
      end

      context "with a context" do
        before do
          course_with_student(:user => @viewing_user, :active_all => true)
        end

        it "should return a bookmark-paginated collection" 


        it "should not include yourself if you're not in that context" 


        it "should include messageable users from that context" 


        it "should not include otherwise messageable users not in that context" 


        it "should return an empty set for unrecognized contexts" 

      end

      context "without a context" do
        it "should return a bookmark-paginated collection" 


        it "should include yourself even if you're not in any contexts" 


        it "should include users messageable via courses" 


        it "should include users messageable via groups" 


        it "should include users messageable via adminned accounts" 


        it "should sort returned users by name regardless of source" 


        context "multiple ways a user is messageable" do
          before do
            student_in_course(:user => @viewing_user, :active_all => true)
            group_with_user(:user => @viewing_user)
            @group.add_user(@teacher, 'accepted')
          end

          it "should only return the user once" 


          it "should have combined common contexts" 

        end
      end

      it "should exclude exclude_ids" 


      context "search parameter" do
        before do
          course_with_teacher(:user => @viewing_user, :active_all => true)
          student_in_course(:name => "Jim Bob")
        end

        it "should include users that match all search terms" 


        it "should exclude users that match only some terms" 


        it "should ignore case when matching search terms" 

      end

      context "sharding" do
        specs_require_sharding

        it "should properly interpret and translate exclude_ids" 

      end
    end
  end
end

