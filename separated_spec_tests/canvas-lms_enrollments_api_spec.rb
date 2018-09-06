# coding: utf-8
#
# Copyright (C) 2011 - 2016 Instructure, Inc.
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

describe EnrollmentsApiController, type: :request do
  describe "enrollment creation" do
    context "an admin user" do
      before :once do
        account_admin_user(:active_all => true)
        course_factory(active_course: true)
        @unenrolled_user = user_with_pseudonym
        @section         = @course.course_sections.create!
        @path            = "/api/v1/courses/#{@course.id}/enrollments"
        @path_options    = { :controller => 'enrollments_api', :action => 'create', :format => 'json', :course_id => @course.id.to_s }
        @user            = @admin
      end

      it "should create a new student enrollment" 


      it "should be unauthorized for users without manage_students permission" 


      it "should create a new teacher enrollment" 


      it "interprets 'false' correctly" 


      it "adds a section limitation after the fact" 


      it "should create a new ta enrollment" 


      it "should create a new observer enrollment" 


      it "should not default observer enrollments to 'active' state if the user is not registered" 


      it "should default observer enrollments to 'active' state if the user is registered" 


      it "should not create a new observer enrollment for self" 


      it "should default new enrollments to the 'invited' state in the default section" 


      it "should default new enrollments to the 'creation_pending' state for unpublished courses" 


      it "should throw an error if no params are given" 


      it "should assume a StudentEnrollment if no type is given" 


      it "should allow creating self-enrollments" 


      it "should return an error if an invalid type is given" 


      it "should enroll a designer" 


      it "should return an error if no user_id is given" 


      it "should enroll to the right section using the section-specific URL" 


      it "should not notify by default" 


      it "should optionally send notifications" 


      it "should not allow enrollments to be added to a hard-concluded course" 


      it "should not allow enrollments to be added to a soft-concluded course" 


      it "should allow enrollments to be added to an active section of a concluded course if the user is already enrolled" 


      it "should not allow enrollments to be added to an active section of a concluded course if the user is not already enrolled" 


      it "should not enroll a user lacking a pseudonym on the course's account" 


      context "custom course-level roles" do
        before :once do
          @course_role = @course.root_account.roles.build(:name => 'newrole')
          @course_role.base_role_type = 'TeacherEnrollment'
          @course_role.save!
        end

        it "should set role_id and type for a new enrollment if role is specified" 


        it "should return an error if type is specified but does not the role's base_role_type" 


        it "should return an error if role is specified but is invalid" 


        it "should return an error if role is specified but is inactive" 


        it "should return a suitable error if role is specified but is deleted" 


        it "should accept base roles in the role parameter" 


        it "should derive roles from parent accounts" 

      end
    end

    context "a teacher" do
      before :once do
        course_with_teacher(:active_all => true)
        @course_with_teacher    = @course
        @course_wo_teacher      = course_factory
        @course                 = @course_with_teacher
        @unenrolled_user        = user_with_pseudonym
        @section                = @course.course_sections.create
        @path                   = "/api/v1/courses/#{@course.id}/enrollments"
        @path_options           = { :controller => 'enrollments_api', :action => 'create', :format => 'json', :course_id => @course.id.to_s }
        @user                   = @teacher
      end

      it "should create enrollments for its own class" 


      it "should not create an enrollment for another class" 

    end

    context "a student" do
      before :once do
        course_with_student(:active_all => true)
        @unenrolled_user        = user_with_pseudonym
        @path                   = "/api/v1/courses/#{@course.id}/enrollments"
        @path_options           = { :controller => 'enrollments_api', :action => 'create', :format => 'json', :course_id => @course.id.to_s }
        @user                   = @student
      end

      it "should return 401 Unauthorized" 

    end

    context "self enrollment" do
      before :once do
        Account.default.allow_self_enrollment!
        course_factory(active_all: true)
        @course.update_attribute(:self_enrollment, true)
        @unenrolled_user = user_with_pseudonym
        @path = "/api/v1/courses/#{@course.id}/enrollments"
        @path_options = {controller: 'enrollments_api', action: 'create', format: 'json', course_id: @course.id.to_s}
      end

      it "should require a logged-in user" 


      it "should require a valid code and user" 


      it "should let anyone self-enroll" 


      it "should not let anyone self-enroll if account disables it" 

    end
  end

  describe "enrollment listing" do
    before :once do
      course_with_student(:active_all => true, :user => user_with_pseudonym)
      @group = @course.groups.create!(:name => "My Group")
      @group.add_user(@student, 'accepted', true)
      @teacher = User.create(:name => 'Señor Chang')
      @teacher.pseudonyms.create(:unique_id => 'chang@example.com')
      @course.enroll_teacher(@teacher)
      User.all.each { |u| u.destroy unless u.pseudonym.present? }
      @path = "/api/v1/courses/#{@course.id}/enrollments"
      @user_path = "/api/v1/users/#{@user.id}/enrollments"
      @enroll_path ="/api/v1/accounts/#{@enrollment.root_account_id}/enrollments"
      @params = { :controller => "enrollments_api", :action => "index", :course_id => @course.id.to_param, :format => "json" }
      @enroll_params = { :controller => "enrollments_api", :action => "show", :account_id => @enrollment.root_account_id, :id => @enrollment.id, :format => "json"}
      @user_params = { :controller => "enrollments_api", :action => "index", :user_id => @user.id.to_param, :format => "json" }
      @section = @course.course_sections.create!
    end

    it "should deterministically order enrollments for pagination" 


    context "filtering by SIS IDs" do
      it "returns an error message with insufficient permissions" 

    end

    context "grading periods" do
      let(:group_helper) { Factories::GradingPeriodGroupHelper.new }
      let(:grading_period_group) { group_helper.legacy_create_for_course(@course) }
      let(:now) { Time.zone.now }

      before :once do
        @first_grading_period = grading_period_group.grading_periods.create!(
          title: 'first',
          start_date: 2.months.ago(now),
          end_date: now
        )
        @last_grading_period = grading_period_group.grading_periods.create!(
          title: 'second',
          start_date: now,
          end_date: 2.months.from_now(now)
        )
        @assignment_in_first_period = @course.assignments.create!(
          due_at: 2.days.ago(now),
          points_possible: 10
        )
        @assignment_in_last_period = @course.assignments.create!(
          due_at: 1.day.from_now(now),
          points_possible: 10
        )
      end

      describe "user endpoint" do
        let!(:enroll_student_in_the_course) do
          student_in_course({course: @course, user: @user})
        end

        it "works for users" 


        it "filters to terms for users" 


        it "returns an error if the user is not in the grading period" 


        describe "grade summary" do
          let!(:grade_assignments) do
            first     = @course.assignments.create! due_at: 1.month.ago
            last      = @course.assignments.create! due_at: 1.month.from_now
            no_due_at = @course.assignments.create!

            Timecop.freeze(@first_grading_period.end_date - 1.day) do
              first.grade_student @user, grade: 7, grader: @teacher
            end
            last.grade_student @user, grade: 10, grader: @teacher
            no_due_at.grade_student @user, grade: 1, grader: @teacher
          end

          describe "provides a grade summary" do

            it "for assignments due during the first grading period." 


            it "for assignments due during the last grading period." 


            it "for all assignments when no grading period is specified." 

          end
        end

        it "returns grades for the requested grading period for courses" 

      end
    end

    context "an account admin" do
      before :once do
        @user = user_with_pseudonym(:username => 'admin@example.com')
        Account.default.account_users.create!(user: @user)
      end

      it "should be able to return an enrollment object by id" 


      it "should list all of a user's enrollments in an account" 


      context "filtering by SIS IDs" do
        context "filtering by sis_account_id" do
          before(:once) do
            root_account_id = @course.account.id

            @subaccount = Account.create!(parent_account_id: root_account_id)
            @subaccount.root_account_id = root_account_id
            @subaccount.sis_source_id = '1234'
            @subaccount.save!

            @course.update_attribute(:account_id, @subaccount.id)
          end

          it "filters by a single sis_account_id" 


          it "filters by a list of sis_account_ids" 


          it "returns nothing if there are no matching sis_account_ids" 

        end

        context "filtering by sis_user_id" do
          before :once do
            @teacher.pseudonym.update_attribute(:sis_user_id, '1234')
          end

          it "filters by a single sis_user_id" 


          it "filters by a list of sis_user_ids" 


          it "returns nothing if there are no matching sis_user_ids" 

        end

        context "filtering by sis_section_id" do
          before :once do
            @course.course_sections.first.update_attribute(:sis_source_id, 'SIS123')
          end

          it "filters by a single sis_section_id" 


          it "filters by a list of sis_section_ids" 


          it "returns nothing if there are no matching sis_section_ids" 

        end

        context "filtering by sis_course_id" do
          before :once do
            @course.update_attribute(:sis_source_id, 'SIS123')
          end

          it "filters by a single sis_course_id" 


          it "filters by a list of sis_course_ids" 


          it "returns nothing if there are no matching sis_course_ids" 

        end
      end

      context 'group_ids' do
        it "should include a users group_ids if group_ids are in include" 


        it "should not include ids from different contexts" 

      end

      it "should show last_activity_at and total_activity_time for student enrollment" 


      it "should return enrollments for unpublished courses" 


      it "should not return enrollments from other accounts" 


      it "should list section enrollments properly" 


      it "should list deleted section enrollments properly" 


      it 'should list enrollments in deleted sections as deleted' 


      describe "custom roles" do
        context "user context" do
          before :once do
            @original_course = @course
            course_factory.offer!
            @role = @course.account.roles.build :name => 'CustomStudent'
            @role.base_role_type = 'StudentEnrollment'
            @role.save!
            @course.enroll_user(@student, 'StudentEnrollment', :role => @role)
          end

          it "should include derived roles when called with type=StudentEnrollment" 


          context "with role parameter" do
            it "should include only vanilla StudentEnrollments when called with role=StudentEnrollment" 


            it "should filter by custom role" 


            it "should accept an array of enrollment roles" 

          end

          context "with role_id parameter" do
            it "should include only vanilla StudentEnrollments when called with built in role_id" 


            it "should filter by custom role" 


            it "should accept an array of enrollment roles" 

          end
        end

        context "course context" do
          before :once do
            role = @course.account.roles.build :name => 'CustomStudent'
            role.base_role_type = 'StudentEnrollment'
            role.save!
            @original_student = @student
            student_in_course(:course => @course, :role => role)
          end

          it "should include derived roles when called with type=StudentEnrollment" 


          it "should include only vanilla StudentEnrollments when called with role=StudentEnrollment" 


          it "should filter by custom role" 


          it "should accept an array of enrollment roles" 

        end
      end
    end

    context "a student" do
      it "should list all members of a course" 


      it "should be able to return an enrollment object by id" 


      it "should filter by enrollment workflow_state" 


      it "should list its own enrollments" 


      it "should not display grades when hide_final_grades is true for the course" 


      it "should not show enrollments for courses that aren't published" 


      it "should show enrollments for courses that aren't published if state[]=current_and_future" 


      it "should accept multiple state[] filters" 


      it "excludes invited enrollments in soft-concluded courses" 


      it "should not include the users' sis and login ids" 

    end

    context "a teacher" do
      before do
        @user = @teacher
      end

      it "should include users' sis and login ids" 

    end

    context "a user without permissions" do
      before :once do
        @user = user_with_pseudonym(:name => 'Don Draper', :username => 'ddraper@sterling-cooper.com')
      end

      it "should return 401 unauthorized for a course listing" 


      it "should return 401 unauthorized for a user listing" 


      it "should return 401 unauthorized for a user requesting an enrollment object by id" 


      it "should return 404 for a user querying from the wrong account" 

    end

    context "a parent observer using parent app" do
      before :once do
        @student = user_factory(active_all: true, active_state: 'active')
        3.times do
          course_factory
          @course.enroll_student(@student, enrollment_state: 'active')
        end
        @observer = user_factory(active_all: true, active_state: 'active')
        @observer.as_observer_observation_links.create do |uo|
          uo.user_id = @student.id
        end
        @user = @observer
        @user_path = "/api/v1/users/#{@student.id}/enrollments"
        @user_params = { :controller => "enrollments_api", :action => "index", :user_id => @student.id.to_param, :format => "json" }
      end

      it "should show all enrollments for the observee (student)" 


      it "should not authorize the parent to see other students' enrollments" 

    end

    describe "sharding" do
      specs_require_sharding

      context "when not scoped by a user" do
        it "returns enrollments from the course's shard" 

      end

      context "when scoped by a user" do
        it "returns enrollments from all of a user's associated shards" 

      end
    end

    describe "pagination" do
      it "should properly paginate" 

    end

    context "inactive enrollments" do
      before do
        @inactive_user = user_with_pseudonym(:name => "Inactive User")
        student_in_course(:course => @course, :user => @inactive_user)
        @inactive_enroll = @inactive_user.enrollments.first
        @inactive_enroll.deactivate
      end

      it "excludes users with inactive enrollments for students" 


      it "includes users with inactive enrollments for teachers" 

    end

    describe "enrollment deletion, conclusion and inactivation" do
      before :once do
        course_with_student(:active_all => true, :user => user_with_pseudonym)
        @enrollment = @student.enrollments.first

        @teacher = User.create!(:name => 'Test Teacher')
        @teacher.pseudonyms.create!(:unique_id => 'test+teacher@example.com')
        @course.enroll_teacher(@teacher)
        @user = @teacher

        @path = "/api/v1/courses/#{@course.id}/enrollments/#{@enrollment.id}"
        @params = { :controller => 'enrollments_api', :action => 'destroy', :course_id => @course.id.to_param,
          :id => @enrollment.id.to_param, :format => 'json' }
      end

      before :each do
        time = Time.now
        allow(Time).to receive(:now).and_return(time)
      end

      context "an authorized user" do
        it "should be able to conclude an enrollment" 



        it "should not be able to delete an enrollment for other courses" 


        it "should be able to delete an enrollment" 


        it "should not be able to unenroll itself if it can't re-enroll itself" 


        it "should be able to deactivate an enrollment using the 'inactivate' task" 


        it "should be able to deactivate an enrollment using the 'deactivate' task" 

      end

      context "an unauthorized user" do
        it "should return 401" 

      end
    end

    describe "enrollment reactivation" do
      before :once do
        course_with_student(:active_all => true, :user => user_with_pseudonym)
        teacher_in_course(:course => @course, :user => user_with_pseudonym)
        @enrollment = @student.enrollments.first
        @enrollment.deactivate

        @path = "/api/v1/courses/#{@course.id}/enrollments/#{@enrollment.id}/reactivate"
        @params = { :controller => 'enrollments_api', :action => 'reactivate', :course_id => @course.id.to_param,
          :id => @enrollment.id.to_param, :format => 'json' }
      end

      it "should require authorization" 


      it "should be able to reactivate an enrollment" 

    end

    describe "show" do
      before(:once) do
        @account = Account.default
        account_admin_user(account: @account)
        student_in_course active_all: true
        @base_path = "/api/v1/accounts/#{@account.id}/enrollments"
        @params = { :controller => 'enrollments_api', :action => 'show', :account_id => @account.to_param,
                    :format => 'json' }
      end

      context "admin" do
        before(:once) do
          @user = @admin
        end

        it "should show other's enrollment" 

      end

      context "student" do
        before(:once) do
          @user = @student
        end

        it "should show own enrollment" 


        it "should not show other's enrollment" 

      end

      context "no user" do
        before(:once) do
          @user = nil
        end

        it "should not show enrollment" 

      end
    end

    describe "filters" do
      it "should properly filter by a single enrollment type" 


      it "should properly filter by multiple enrollment types" 


      it "should return an empty array when no user enrollments match a filter" 

    end
  end

  describe "enrollment invitations" do
    it "should accept invitation" 


    it "should accept one invitation when there are multiple sections" 


    it 'should reject invitation' 


    it 'should reject and then accept' 


    it 'should not accept after course has ended' 


    it 'should not reject after course has ended' 


    it 'should not accept if self_enrolled' 


    it 'should not reject if self_enrolled' 


    it 'should not accept if inactive' 


    it 'should not reject if inactive' 

  end
end

