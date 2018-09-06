#
# Copyright (C) 2011 - 2014 Instructure, Inc.
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

describe "Accounts API", type: :request do
  before :once do
    user_with_pseudonym(:active_all => true)
    @a1 = account_model(:name => 'root', :default_time_zone => 'UTC', :default_storage_quota_mb => 123, :default_user_storage_quota_mb => 45, :default_group_storage_quota_mb => 42)
    @a1.account_users.create!(user: @user)
    @sis_batch = @a1.sis_batches.create
    SisBatch.where(id: @sis_batch).update_all(workflow_state: 'imported')
    @a2 = account_model(:name => 'subby', :parent_account => @a1, :root_account => @a1, :sis_source_id => 'sis1',  :sis_batch_id => @sis_batch.id, :default_time_zone => 'Alaska', :default_storage_quota_mb => 321, :default_user_storage_quota_mb => 54, :default_group_storage_quota_mb => 41)
    @a2.account_users.create!(user: @user)
    @a3 = account_model(:name => 'no-access')
    # even if we have access to it implicitly, it's not listed
    @a4 = account_model(:name => 'implicit-access', :parent_account => @a1, :root_account => @a1)
  end

  describe 'index' do
    it "should return the account list" 


    it "doesn't include deleted accounts" 


    it "should return accounts found through admin enrollments with the account list (but in limited form)" 


    describe "with sharding" do
      specs_require_sharding
      it "should include cross-shard accounts in course_accounts" 

    end
  end

  describe 'sub_accounts' do
    before :once do
      root = @a1
      a1 = root.sub_accounts.create! :name => "Account 1"
      a2 = root.sub_accounts.create! :name => "Account 2"
      a1.sub_accounts.create! :name => "Account 1.1"
      @a1_2 = a1.sub_accounts.create! :name => "Account 1.2"
      a1.sub_accounts.create! :name => "Account 1.2.1"
      3.times.each do |i|
        a2.sub_accounts.create! :name => "Account 2.#{i+1}"
      end
    end

    it "should return child accounts" 


    it "should add sub account" 


    it 'should destroy a sub_account' 


    describe "recursive" do

      it "returns sub accounts recursively" 


      it "ignores deleted accounts" 

    end
  end

  describe 'show' do
    it "should return an individual account" 


    it "should return an individual account for a teacher (but in limited form)" 


    it "should return the lti_guid" 


    it "should honor deprecated includes parameter" 

  end

  describe 'update' do

    let(:header_options_hash) do
      {
        :controller => 'accounts',
        :action => 'update',
        :id => @a1.to_param,
        :format => 'json'
      }
    end

    let(:query_params_hash) do
      {
        :account => {
          :settings => {
            :sis_assignment_name_length_input => {
              :value => nil
            }
          }
        }
      }
    end

    it "should update the name for an account" 


    it "should update account settings" 


    it "should update services" 


    it "should update sis_id" 


    it "should not update sis_id for root_accounts" 


    # These following tests focus on testing the sis_assignment_name_length_input account setting
    # through the API. This setting is used to enforce assignment name length for assignments.
    # Valid values for this setting are integers/strings between 0-255. If a value is set greater
    # than or less than those boundaries OR if the value is nil/some arbitrary string the default
    # assignment name length value of 255 will be assigned to the setting to mitigate these cases.
    # Otherwise the value sent in will be assigned to the setting.
    it "should update account with sis_assignment_name_length_input with string number value" 


    it "should update account with sis_assignment_name_length_input with string text value" 


    it "should update account with sis_assignment_name_length_input with nil value" 


    it "should update account with sis_assignment_name_length_input with empty string value" 


    it "should update account with sis_assignment_name_length_input with integer value" 


    it "should set sis_assignment_name_length_input to default 255 if value is integer and over 255" 


    it "should set sis_assignment_name_length_input to default 255 if value is string and over 255" 


    it "should set sis_assignment_name_length_input to default 255 if value is string and less than 0" 


    it "should set sis_assignment_name_length_input to default 255 if value is integer and under 0" 


    it "should not update with a blank name" 


    it "should update the default_time_zone for an account with an IANA timezone name" 


    it "should update the default_time_zone for an account with a Rails timezone name" 


    it "should check for a valid time zone" 


    it "should not update other attributes (yet)" 


    context 'with :manage_storage_quotas' do
      before(:once) do
        # remove the user from being an Admin
        @a1.account_users.where(user_id: @user).delete_all

        # re-add the user as an admin with quota rights
        role = custom_account_role 'quotas', :account => @a1
        @a1.role_overrides.create! :role => role, :permission => 'manage_storage_quotas', :enabled => true
        @a1.account_users.create!(user: @user, :role => role)

        @params = { :controller => 'accounts', :action => 'update', :id => @a1.to_param, :format => 'json' }
      end

      it 'should allow the default storage quota to be set' 


      it 'should allow the default user quota to be set' 


      it 'should allow the default group quota to be set' 

    end

    context 'without :manage_storage_quotas' do
      before(:once) do
        # remove the user from being an Admin
        @a1.account_users.where(user_id: @user).delete_all

        # re-add the user as an admin without quota rights
        role = custom_account_role 'no-quotas', :account => @a1
        @a1.role_overrides.create! :role => role, :permission => 'manage_account_settings', :enabled => true
        @a1.role_overrides.create! :role => role, :permission => 'manage_storage_quotas', :enabled => false
        @a1.account_users.create!(user: @user, role: role)

        @params = { :controller => 'accounts', :action => 'update', :id => @a1.to_param, :format => 'json' }
      end

      it 'should not allow the default storage quota to be set' 


      it 'should not allow the default user quota to be set' 


      it 'should not allow the default group quota to be set' 

    end
  end

  it "should find accounts by sis in only this root account" 


  context "courses_api" do
    it "should return courses for an account" 


    it "should honor the includes[]" 


    it "should don't include fake students" 


    it "should include enrollment term information for each course" 


    describe 'sort' do
      before :once do
        @me = @user
        @sub2 = @a1.sub_accounts.create!(name: 'b', sis_source_id: 'sub2', root_account: @a1)
        @sub1 = @a1.sub_accounts.create!(name: 'a', sis_source_id: 'sub1', root_account: @a1)

        @a1.courses.create!(name: 'in root')
        @sub1.courses.create!(name: 'in sub1')
        @sub2.courses.create!(name: 'in sub2')
      end

      it 'should sort by account name using subaccount for backwards compatibility' 


      it 'should sort by account name' 

    end

    describe "handles crosslisting properly" do
      before :once do
        @root_account = Account.create!
        @account1 = Account.create!({ :root_account => @root_account })
        @account2 = Account.create!({ :root_account => @root_account })
        @course1 = course_factory({ :account => @account1, :course_name => "course1" })
        @course2 = course_factory({ :account => @account2, :course_name => "course2" })
        @course2.course_sections.create!
        @course2.course_sections.first.crosslist_to_course(@course1)
      end

      it "don't include crosslisted course when querying account section was crosslisted from" 


      it "don't include crosslisted course when querying account section was crosslisted to" 


      it "include crosslisted course when querying account section was crosslisted from if requested" 


      it "don't include crosslisted course when querying account section was crosslisted to even if requested" 

    end

    describe "courses filtered by state[]" do
      before :once do
        @me = @user
        [:c1, :c2, :c3, :c4].each do |course|
          instance_variable_set("@#{course}".to_sym, course_model(:name => course.to_s, :account => @a1))
        end
        @c2.destroy
        Course.where(id: @c1).update_all(workflow_state: 'claimed')
        Course.where(id: @c3).update_all(workflow_state: 'available')
        Course.where(id: @c4).update_all(workflow_state: 'completed')
        @user = @me
      end

      it "should return courses filtered by state[]='deleted'" 


      it "should return courses filtered by state[]=nil" 


      it "should return courses filtered by state[]='all'" 

    end

    it "should return courses filtered by enrollment_term" 


    describe "?with_enrollments" do
      before :once do
        @me = @user
        c1 = course_model(:account => @a1, :name => 'c1')    # has a teacher
        c2 = Course.create!(:account => @a1, :name => 'c2')  # has no enrollments
        @user = @me
      end

      it "should not apply if not specified" 


      it "should filter on courses with enrollments" 


      it "should filter on courses without enrollments" 

    end

    describe "?published" do
      before :once do
        @me = @user
        [:c1, :c2].each do |course|
          instance_variable_set("@#{course}".to_sym, course_model(:name => course.to_s, :account => @a1))
        end
        @c1.offer!
        @user = @me
      end

      it "should not apply if not specified" 


      it "should filter courses on published state" 


      it "should filter courses on non-published state" 

    end

    describe "?completed" do
      before :once do
        @me = @user
        [:c1, :c2, :c3, :c4].each do |course|
          instance_variable_set("@#{course}".to_sym, course_model(:name => course.to_s, :account => @a1, :conclude_at => 2.days.from_now))
        end

        @c2.start_at = 2.weeks.ago
        @c2.conclude_at = 1.week.ago
        @c2.save!

        term = @c3.root_account.enrollment_terms.create! :end_at => 2.days.ago
        @c3.enrollment_term = term
        @c3.save!

        @c4.complete!
        @user = @me
      end

      it "should not apply if not specified" 


      it "should filter courses on completed state" 


      it "should filter courses on non-completed state" 

    end

    describe "?by_teachers" do
      before :once do
        @me = @user
        course_with_teacher(:account => @a1, :course_name => 'c1a', :user => user_with_pseudonym(:account => @a1))
        @pseudonym.sis_user_id = 'a_sis_id'
        @pseudonym.save!
        @t1 = @teacher
        course_with_teacher(:account => @a1, :user => @t1, :course_name => 'c1b')
        course_with_teacher(:account => @a1, :course_name => 'c2')
        @teacher
        course_with_teacher(:account => @a1, :course_name => 'c3')
        @t3 = @teacher
        @user = @me
      end

      it "should not apply when not specified" 


      it "should filter courses by teacher enrollments" 


      it "should not break with an empty result set" 

    end

    describe "?by_subaccounts" do
      before :once do
        @me = @user
        @sub1 = account_model(:name => 'sub1', :parent_account => @a1, :root_account => @a1, :sis_source_id => 'sub1')
        @sub1a = account_model(:name => 'sub1a', :parent_account => @sub1, :root_account => @a1, :sis_source_id => 'sub1a')
        @sub1b = account_model(:name => 'sub1b', :parent_account => @sub1, :root_account => @a1, :sis_source_id => 'sub1b')
        @sub2 = account_model(:name => 'sub2', :parent_account => @a1, :root_account => @a1, :sis_source_id => 'sub2')

        course_model(:name => 'in sub1', :account => @sub1)
        course_model(:name => 'in sub1a', :account => @sub1a)
        course_model(:name => 'in sub1b', :account => @sub1b)
        course_model(:name => 'in sub2', :account => @sub2)
        course_model(:name => 'in top level', :account => @a1)
        @user = @me
      end

      it "should not apply when not specified" 


      it "should include descendants of the specified subaccount" 


      it "should work with multiple subaccounts specified" 


      it "should work with a numeric ID" 


      it "should not break with an empty result set" 

    end

    it "should limit the maximum per-page returned" 


    it "should return courses filtered search term" 


    context "blueprint courses" do
      before :once do
        @a = Account.create!
        @a.enable_feature! :master_courses
        @mc = course_model :name => 'MasterCourse', :account => @a
        @cc = course_model :name => 'ChildCourse', :account => @a
        @oc = course_model :name => 'OtherCourse', :account => @a
        template = MasterCourses::MasterTemplate.set_as_master_course(@mc)
        template.add_child_course!(@cc).destroy # ensure deleted subscriptions don't affect the result
        template.add_child_course!(@cc)
        account_admin_user(:account => @a)
      end

      it 'filters in blueprint courses' 


      it 'filters out blueprint courses' 


      it 'filters in associated courses' 


      it 'filters out associated courses' 

    end
  end

  context "permissions" do
    it "returns permissions" 


    it "requires :read permission on the account" 

  end

  context "account api extension" do
    module MockPlugin
      def self.extend_account_json(hash, account, user, session, includes)
        hash[:extra_thing] = "something"
      end
    end

    module BadMockPlugin
      def self.not_the_right_method
      end
    end

    include Api::V1::Account

    it "should allow a plugin to extend the account_json method" 

  end
end

