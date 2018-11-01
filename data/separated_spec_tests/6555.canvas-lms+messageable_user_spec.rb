#
# Copyright (C) 2016 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper.rb')

describe AddressBook::MessageableUser do
  describe "known_users" do
    it "restricts to provided users" 


    it "includes only known users" 


    it "caches the results for known users" 


    it "caches the failure for unknown users" 


    it "doesn't refetch already cached users" 


    describe "with optional :context" do
      before :each do
        @recipient = user_model(workflow_state: 'registered')
        @sender = user_model(workflow_state: 'registered')
        @address_book = AddressBook::MessageableUser.new(@sender)

        # recipient participates in three courses
        @course1 = course_model(workflow_state: 'available')
        @course2 = course_model(workflow_state: 'available')
        @course3 = course_model(workflow_state: 'available')
        student_in_course(user: @recipient, course: @course1, active_all: true)
        student_in_course(user: @recipient, course: @course2, active_all: true)
        student_in_course(user: @recipient, course: @course3, active_all: true)

        # but only two are shared with sender (visible with the sender)
        teacher_in_course(user: @sender, course: @course1, active_all: true)
        teacher_in_course(user: @sender, course: @course2, active_all: true)
      end

      it "includes all known contexts when absent" 


      it "excludes unknown contexts when absent, even if admin" 


      it "excludes other known contexts when specified" 


      it "excludes specified unknown context when sender is non-admin" 


      it "excludes specified unknown course when sender is a participant admin" 


      it "includes specified unknown context when sender is non-participant admin" 

    end

    describe "with optional :conversation_id" do
      it "treats unknown users in that conversation as known" 


      it "ignores if sender is not a participant in the conversation" 

    end

    describe "sharding" do
      specs_require_sharding

      it "finds cross-shard known users" 

    end
  end

  describe "known_user" do
    it "returns the user if known" 


    it "returns nil if not known" 

  end

  describe "common_courses" do
    it "pulls the corresponding MessageableUser's common_courses" 

  end

  describe "common_groups" do
    it "pulls the corresponding MessageableUser's common_groups" 

  end

  describe "known_in_context" do
    it "limits to users in context" 


    it "caches the results for known users" 


    it "does not cache unknown users" 


    describe "sharding" do
      specs_require_sharding

      before :each do
        enrollment = @shard1.activate{ teacher_in_course(active_all: true) }
        @teacher = enrollment.user
        @course = enrollment.course
        @student = @shard2.activate{ user_factory(active_all: true) }
        student_in_course(course: @course, user: @student, active_all: true)
      end

      it "works for cross-shard courses" 


      it "finds known cross-shard users in course" 

    end
  end

  describe "count_in_contexts" do
    it "limits to known users in contexts" 

  end

  describe "search_users" do
    it "returns a paginatable collection" 


    it "finds matching known users" 


    it "excludes matching known user in optional :exclude_ids" 


    it "restricts to matching known users in optional :context" 


    it "finds users in an unassociated :context when an admin" 


    it "excludes users in an admined :context when also participating" 


    it "excludes 'weak' users without :weak_checks" 


    it "excludes 'weak' enrollments without :weak_checks" 


    it "expands to include 'weak' users and 'weak' enrollments when :weak_checks" 


    it "caches the results for known users when a page is materialized" 

  end

  describe "preload_users" do
    it "avoids db query with rails cache" 


    it "caches all provided users" 

  end

  describe "sections" do
    it "returns course sections known to sender" 

  end

  describe "groups" do
    it "returns groups known to sender" 

  end
end

