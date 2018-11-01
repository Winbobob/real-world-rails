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

require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper.rb')

describe SIS::CSV::EnrollmentImporter do

  before { account_model }

  it 'should skip bad content' 


  it 'should warn about inconsistent data' 


  it "should not fail for really long course names" 


  it "should enroll users" 


  it "should enroll users by integration id" 


  it "should support sis stickiness" 


  it "should not try looking up a section to enroll into if the section name is empty" 


  it "should properly handle repeated courses and sections" 


  it "should resurrect deleted enrollments" 


  it "should count re-deletions" 


  it "should allow one user multiple enrollment types in the same section" 


  it "should set limit_section_privileges" 


  it "should allow one user to observe multiple students" 


  it "should find manually xlisted sections when enrolling by course id" 


  it "should not recycle an observer's associated user id in subsequent student enrollments" 


  it "should find observed user who is deleted and clear observer correctly" 


  it 'should only queue up one DueDateCacher job per course' 


  it 'should only queue up one recache_grade_distribution job per course' 


  describe "custom roles" do
    context "in an account" do
      before do
        @course = course_model(:account => @account, :sis_source_id => 'TehCourse')
        @user1 = user_with_managed_pseudonym(:account => @account, :sis_user_id => 'user1')
        @user2 = user_with_managed_pseudonym(:account => @account, :sis_user_id => 'user2')
        @role = custom_role('StudentEnrollment', 'cheater')
        @role2 = custom_role('StudentEnrollment', 'insufferable know-it-all')
      end

      it "should enroll with a custom role" 


      it "should not enroll with an inactive role" 


      it "should not enroll with a nonexistent role" 


      it "should create multiple enrollments with different roles having the same base type" 


      it "should find by role_id" 


      it "should associate users for custom observer roles" 

    end

    context "in a sub-account" do
      before do
        @role = @account.roles.build :name => 'instruc-TOR'
        @role.base_role_type = 'TeacherEnrollment'
        @role.save!
        @user1 = user_with_managed_pseudonym(:name => 'Dolph Hauldhagen', :account => @account, :sis_user_id => 'user1')
        @user2 = user_with_managed_pseudonym(:name => 'Strong Bad', :account => @account, :sis_user_id => 'user2')
        @sub_account = @account.sub_accounts.create!(:name => "The Rec Center")
        @course = course_model(:account => @sub_account, :name => 'Battle Axe Lessons', :sis_source_id => 'TehCourse')
      end

      it "should enroll with an inherited custom role" 


      it "should not enroll with an inactive inherited role" 


      it "should enroll with a custom role that overrides an inactive inherited role" 


      it "should not enroll with a custom role defined in a sibling account" 

    end
  end

  it "should allow cross-account imports" 


  it "should check for a usable login for cross-account imports" 


  it "should skip cross-account imports that can't be found" 


  it "should link with observer enrollments" 


  it "should delete observer enrollments when the student enrollment is already deleted" 


  it 'should create rollback data' 


  it "should not create enrollments for deleted users" 


  it "should not enroll users into deleted sections" 


  it "should still work when creating a completed enrollment" 


  it "doesn't die if the last record is invalid" 


  it "associates to the correct accounts and doesn't die for invalid rows" 

end

