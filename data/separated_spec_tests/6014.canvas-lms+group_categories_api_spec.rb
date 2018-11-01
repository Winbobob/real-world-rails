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
require File.expand_path(File.dirname(__FILE__) + '/../file_uploads_spec_helper')

describe "Group Categories API", type: :request do
  def category_json(category, user=@user)
    json = {
      'id' => category.id,
      'name' => category.name,
      'role' => category.role,
      'self_signup' => category.self_signup,
      'context_type' => category.context_type,
      "#{category.context_type.downcase}_id" => category.context_id,
      'group_limit' => category.group_limit,
      'groups_count' => category.groups.size,
      'unassigned_users_count' => category.unassigned_users.count(:all),
      'protected' => false,
      'allows_multiple_memberships' => false,
      'auto_leader' => category.auto_leader,
      'is_member' => false
    }
    json['sis_group_category_id'] = category.sis_source_id if category.root_account.grants_any_right?(user, :read_sis, :manage_sis)
    json['sis_import_id'] = category.sis_batch_id if category.root_account.grants_right?(user, :manage_sis)
    json
  end

  before :once do
    @account = Account.default
    @category_path_options = {:controller => "group_categories", :format => "json"}
  end

  describe "course group categories" do
    before :once do
      @course = course_factory(:course_name => 'Math 101', :account => @account, :active_course => true)
      @category = GroupCategory.student_organized_for(@course)
    end

    describe "users" do
      let(:api_url) { "/api/v1/group_categories/#{@category2.id}/users.json" }
      let(:api_route) do
        {
            :controller => 'group_categories',
            :action => 'users',
            :group_category_id => @category2.to_param,
            :format => 'json'
        }
      end

      before :once do
        @user = user_factory(:name => "joe mcCool")
        @course.enroll_user(@user,'TeacherEnrollment',:enrollment_state => :active)

        @user_waldo = user_factory(:name => "waldo")
        @course.enroll_user(@user,'StudentEnrollment',:enrollment_state => :active)


        6.times { course_with_student({:course => @course}) }

        @user = @course.teacher_enrollments.first.user
      end

      before :each do
        json = api_call(:post, "/api/v1/courses/#{@course.id}/group_categories",
                        @category_path_options.merge(:action => 'create',
                                                     :course_id => @course.to_param),
                        { 'name' => 'category', 'split_group_count' => 3 })

        @user_antisocial = user_factory(:name => "antisocial")
        @course.enroll_user(@user,'StudentEnrollment',:enrollment_state => :active)

        @category2 = GroupCategory.find(json["id"])

        @category_users = @category2.groups.inject([]){|result, group| result.concat(group.users)} << @user
        @category_assigned_users = @category2.groups.active.inject([]){|result, group| result.concat(group.users)}
        @category_unassigned_users = @category_users - @category_assigned_users
      end

      it "should return users in a group_category" 


      it "should return 401 for users outside the group_category" 


      it "returns an error when search_term is fewer than 3 characters" 


      it "returns a list of users" 


      it "returns a list of unassigned users" 


      it "should include custom student roles in search" 

    end

    describe "teacher actions with no group" do
      before :once do
        @name = 'some group name'
        @user = user_factory(:name => "joe mcCool")
        @course.enroll_user(@user,'TeacherEnrollment',:enrollment_state => :active)
      end

      it "should allow a teacher to update a category that creates groups" 


      it "should allow a teacher to update a category and distribute students to new groups" 


      it "should create group category/groups and split students between groups" 


      it "should create self signup groups" 


      it "should create restricted self sign up groups" 


      it "should ignore 'split_group_count' if 'enable_self_signup'" 


      it "should prefer 'split_group_count' over 'create_group_count' if not 'enable_self_signup'" 


      describe "teacher actions with a group" do
        before :once do
          @study_group = group_model(name: @name, group_category: @category,
                                     context: @course, root_account_id: @account.id)
        end

        it "should allow listing all of a course's group categories for teachers" 


        it "should allow teachers to retrieve a group category" 


        it "should list all groups in category for a teacher" 


        it "should allow a teacher to update a category for a course" 


        it "should allow a teacher to update a category to self_signup enabled for a course" 


        it "should allow a teacher to update a category to self_signup restricted for a course" 


        it "should allow a teacher to delete a category for a course" 


        it "should allow a teacher to delete the imported groups category for a course" 


        it "should not allow a teacher to delete the communities category for a course" 


        it "should allow a teacher to create a course group category" 

      end
    end

    describe "student actions" do
      before :once do
        @user = user_factory(:name => "derrik hans")
        @course.enroll_user(@user,'StudentEnrollment',:enrollment_state => :active)
      end

      it "should not allow listing of a course's group categories for students" 


      it "should not list all groups in category for a student" 

      it "should not allow a student to create a course group category" 


      it "should not allow a teacher to delete the student groups category" 


      it "should not allow a student to delete a category for a course" 


      it "should not allow a student to update a category for a course" 

    end

    describe "POST 'assign_unassigned_members'" do
      it "should require :manage_groups permission" 


      it "should require valid group :category_id" 


      it "should fail for student organized groups" 


      it "should fail for restricted self signup groups" 


      it "should otherwise assign ungrouped users to groups in the category" 


      it "should render progress_json" 

    end
  end

  describe "account group categories" do
    before :once do
      @communities = GroupCategory.communities_for(@account)
    end

    describe "admin actions" do
      before :once do
        @user = account_admin_user(:account => @account)
      end

      it "should allow listing all of an account's group categories for account admins" 


      it "should ignore 'split_group_count' for a non course group" 


      it "should allow admins to retrieve a group category" 


      it "should return a 'not found' error if there is no group_category" 


      it "should list all groups in category for a admin" 


      it "should allow an admin to create an account group category" 


      it "should allow an admin to update a category for an account" 


      it "should allow an admin to delete a category for an account" 


      it "should not allow 'enable_self_signup' for a non course group" 


      describe "sis permissions" do
        let(:json) { api_call(:get, "/api/v1/accounts/#{@account.to_param}/group_categories.json",
                              @category_path_options.merge(action:'index',
                                                           account_id: @account.to_param)) }
        let(:admin) { Role.get_built_in_role("AccountAdmin") }

        before :each do
          @user = User.create!(name: 'billy')
          @account.account_users.create(user: @user)
        end

        it "should show SIS fields if the user has permission", priority: 3, test_id: 3436530 do
          expect(json[0]).to have_key("sis_group_category_id")
          expect(json[0]).to have_key("sis_import_id")
        end

        it "should show only sis_group_category_id without manage_sis permission", priority: 3, test_id: 3436880 do
          @account.role_overrides.create(role: admin, enabled: false, permission: :manage_sis)
          expect(json[0]).to have_key("sis_group_category_id")
          expect(json[0]).not_to have_key("sis_import_id")
        end

        it "should not show SIS fields if the user doesn't have permission", priority: 3, test_id: 3436531 do
          @account.role_overrides.create(role: admin, enabled: false, permission: :read_sis)
          @account.role_overrides.create(role: admin, enabled: false, permission: :manage_sis)
          expect(json[0]).not_to have_key("sis_group_category_id")
          expect(json[0]).not_to have_key("sis_import_id")
        end
      end
    end

    it "should not allow non-admins to list an account's group categories" 


    it "should not allow non-admins to retrieve a group category" 


    it "should not allow a non-admin to delete a category for an account" 


    it "should not list all groups in category for a non-admin" 


    it "should not allow a non-admin to create an account group category" 


    it "should not allow a non-admin to update a category for an account" 

  end
end

