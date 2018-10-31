#
# Copyright (C) 2012 - 2014 Instructure, Inc.
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

describe "Groups API", type: :request do
  def group_json(group, opts = {})
    opts[:is_admin] ||= false
    opts[:include_users] ||= false
    opts[:include_category] ||= false
    opts[:include_permissions] ||= false
    json = {
      'id' => group.id,
      'name' => group.name,
      'description' => group.description,
      'is_public' => group.is_public,
      'join_level' => group.join_level,
      'members_count' => group.members_count,
      'max_membership' => group.max_membership,
      'avatar_url' => group.avatar_attachment && "http://www.example.com/images/thumbnails/#{group.avatar_attachment.id}/#{group.avatar_attachment.uuid}",
      'context_type' => group.context_type,
      "#{group.context_type.downcase}_id" => group.context_id,
      'role' => group.group_category.role,
      'group_category_id' => group.group_category_id,
      'storage_quota_mb' => group.storage_quota_mb,
      'leader' => group.leader,
      'has_submission' => group.submission?,
      'concluded' => group.context.concluded? || group.context.deleted?
    }
    if opts[:include_users]
      json['users'] = users_json(group.users, opts)
    end
    if opts[:include_permissions]
      json['permissions'] = {
        'join' => group.grants_right?(@user, nil, :join),
        'create_discussion_topic' => DiscussionTopic.context_allows_user_to_create?(group, @user, nil),
        'create_announcement' => Announcement.context_allows_user_to_create?(group, @user, nil)
      }
    end
    if opts[:include_category]
      json['group_category'] = group_category_json(group.group_category, @user)
    end
    if group.context_type == 'Account' && opts[:is_admin]
      json['sis_import_id'] = group.sis_batch_id
      json['sis_group_id'] = group.sis_source_id
    end
    json
  end

  def group_category_json(group_category, user)
    json = {
      "auto_leader" => group_category.auto_leader,
      "group_limit" => group_category.group_limit,
      "id" => group_category.id,
      "name" => group_category.name,
      "role" => group_category.role,
      "self_signup" => group_category.self_signup,
      "context_type" => group_category.context_type,
      "#{group_category.context_type.underscore}_id" => group_category.context_id,
      "protected" => group_category.protected?,
      "allows_multiple_memberships" => group_category.allows_multiple_memberships?,
      "is_member" => group_category.is_member?(user)
    }
    json['sis_group_category_id'] = group_category.sis_source_id if group_category.context.grants_any_right?(user, :read_sis, :manage_sis)
    json['sis_import_id'] = group_category.sis_batch_id if group_category.context.grants_right?(user, :manage_sis)
    json
  end

  def users_json(users, opts)
    users.map { |user| user_json(user, opts) }
  end

  def user_json(user, opts)
    hash = {
      'id' => user.id,
      'name' => user.name,
      'sortable_name' => user.sortable_name,
      'short_name' => user.short_name
    }
    hash
  end

  def membership_json(membership, is_admin = false)
    json = {
      'id' => membership.id,
      'group_id' => membership.group_id,
      'user_id' => membership.user_id,
      'workflow_state' => membership.workflow_state,
      'moderator' => membership.moderator,
    }
    json['sis_import_id'] = membership.sis_batch_id if membership.group.context_type == 'Account' && is_admin
    json['sis_group_id'] = membership.group.sis_source_id if membership.group.context_type == 'Account' && is_admin
    json
  end

  before :once do
    @moderator = user_model
    @member = user_with_pseudonym

    @communities = GroupCategory.communities_for(Account.default)
    @community = group_model(:name => "Algebra Teachers", :group_category => @communities, :context => Account.default)
    @community.add_user(@member, 'accepted', false)
    @community.add_user(@moderator, 'accepted', true)
    @community_path = "/api/v1/groups/#{@community.id}"
    @category_path_options = { :controller => "groups", :format => "json" }
    @context = @community
  end

  it "should allow listing all a user's groups" 


  describe "show SIS fields based on manage_sis permissions" do
    before :once do
      course_with_student(:user => @member)
      @group = @course.groups.create!(:name => "My Group")
      @group.add_user(@member, 'accepted', true)
      @group.reload
      account = @course.account
      @admin_user = User.create!()
      account.account_users.create!(user: @admin_user, account: account)
    end

    it "should show if the user has permission", priority: 3, test_id: 3436528 do
      @user = @admin_user
      json = api_call(:get, "/api/v1/groups/#{@group.id}", @category_path_options.merge(action: "show", group_id: @group.id))
      expect(json).to have_key("sis_group_id")
      expect(json).to have_key("sis_import_id")
    end

    it "should not show if the user doesn't have permission", priority: 3, test_id: 3436529 do
      @user = @member
      json = api_call(:get, "/api/v1/users/self/groups", @category_path_options.merge(action: 'index'))
      expect(json[0]).not_to have_key("sis_group_id")
      expect(json[0]).not_to have_key("sis_import_id")
    end
 end

  it "should indicate if the context is deleted" 


  it "should allow listing all a user's group in a given context_type" 


  it "should allow listing all of a course's groups" 


  it "should not show inactive users to students" 


  it "should show inactive users to admins" 


  it "should allow listing all of an account's groups for account admins" 


  it "should not allow non-admins to view an account's groups" 


  it "should show students all groups" 


  it "should allow a member to retrieve the group" 


  it "should allow a member to retrieve a favorite group" 



  it "should include the group category" 


  it 'should include permissions' 


  it 'should include permission create_discussion_topic' 


  it 'should include permission create_student_announcements' 


  it 'includes tabs if requested' 


  it "should allow searching by SIS ID" 


  it "should allow anyone to create a new community" 


  it "should allow a teacher to create a group in a course" 


  it "should not allow a student to create a group in a course" 


  it "should allow an admin to create a group in a account" 


  it "should allow using group category sis id" 


  it "should allow setting sis id on group creation" 


  it "should not allow a non-admin to create a group in a account" 



  it "should allow a moderator to edit a group" 


  it "should only allow updating a group from private to public" 


  it "should not allow a member to edit a group" 


  it "should allow a moderator to delete a group" 


  it "should not allow a member to delete a group" 


  describe "quota" do
    before :once do
      @account = Account.default
      Setting.set('group_default_quota', 11.megabytes)
    end

    context "with manage_storage_quotas permission" do
      before :once do
        account_admin_user :account => @account
      end

      it "should set the quota on create" 


      it "should set the quota on update" 

    end

    context "without manage_storage_quotas permission" do
      before :once do
        account_admin_user_with_role_changes(:role_changes => {:manage_storage_quotas => false})
      end

      it "should ignore the quota on create" 


      it "should ignore the quota on update" 

    end
  end

  context "memberships" do
    before do
      @memberships_path = "#{@community_path}/memberships"
      @alternate_memberships_path = "#{@community_path}/users"
      @memberships_path_options = { :controller => "group_memberships", :format => "json" }
    end

    it "should allow listing the group memberships" 


    it "should allow filtering to a certain membership state" 


    context "with a membership" do
      before do
        @membership = @community.has_member?(@member)
        @membership_path_options = @memberships_path_options.merge(:group_id => @community.to_param, :membership_id => @membership.to_param)
        @alternate_membership_path_options = @memberships_path_options.merge(:group_id => @community.to_param, :user_id => @member.to_param)
      end

      it "should allow a member to read their membership by membership id" 


      it "should allow a moderator to read a membership by membership id" 


      it "should not allow an unrelated user to read a membership by membership id" 


      it "should allow a member to read their membership by user id" 


      it "should allow a moderator to read a membership by user id" 


      it "should not allow an unrelated user to read a membership by user id" 

    end

    it "should allow someone to request to join a group" 


    it "should allow someone to join a group" 


    it "should not allow a moderator to add someone directly to the group" 


    it "should allow accepting a join request by a moderator" 


    it "should allow accepting a join request by a moderator using users/:user_id endpoint" 


    it "should not allow other workflow_state modifications" 


    it "should not allow other workflow_state modifications using users/:user_id endpoint" 


    it "should not allow a member to accept join requests" 


    it "should not allow a member to accept join requests using users/:user_id endpoint" 


    it "should allow changing moderator privileges" 


    it "should allow changing moderator privileges using users/:user_id endpoint" 


    it "should not allow a member to change moderator privileges" 


    it "should not allow a member to change moderator privileges using users/:user_id endpoint" 


    it "should allow someone to leave a group" 


    it "should allow someone to leave a group using users/:user_id endpoint" 


    it "should allow leaving a group using 'self'" 


    it "should allow leaving a group using 'self' using users/:user_id endpoint" 


    it "should allow leaving a group using sis id using users/:user_id endpoint" 


    it "should allow a moderator to invite people to a group" 


    it "should not allow a member to invite people to a group" 


    it "should find people when inviting to a group in a non-default account" 


    it "should allow being added to a non-community account group" 


    it "should show sis_import_id for group" 

  end

  context "users" do
    let(:api_url) { "/api/v1/groups/#{@community.id}/users.json" }
    let(:api_route) do
      {
          :controller => 'groups',
          :action => 'users',
          :group_id => @community.to_param,
          :format => 'json'
      }
    end

    it "should return users in a group" 


    it "should return 401 for users outside the group" 


    it "returns an error when search_term is fewer than 3 characters" 


    it "returns a list of users" 


    it "honors the include[avatar_url] query parameter flag" 

  end

  context "group files" do
    include_examples "file uploads api with folders"
    include_examples "file uploads api with quotas"

    before do
      @user = @member
    end

    def preflight(preflight_params, opts = {})
      api_call(:post, "/api/v1/groups/#{@community.id}/files",
        { :controller => "groups", :action => "create_file", :format => "json", :group_id => @community.to_param, },
        preflight_params,
        {},
        opts)
    end

    def has_query_exemption?
      false
    end

    def context
      @community
    end
  end

  it "should return the activity stream" 


  it "should return the activity stream summary" 


  describe "/preview_html" do
    before :once do
      course_with_teacher(:active_all => true)
      @group = @course.groups.create!(:name => 'Group 1')
    end

    before :each do
      user_session @teacher
    end

    it "should sanitize html and process links" 


    it "should require permission to preview" 

  end
end

