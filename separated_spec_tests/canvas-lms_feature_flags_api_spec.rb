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

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')
require_relative '../../sharding_spec_helper'

describe "Feature Flags API", type: :request do
  let_once(:t_site_admin) { Account.site_admin }
  let_once(:t_root_account) { account_model }
  let_once(:t_teacher) { user_with_pseudonym account: t_root_account }
  let_once(:t_sub_account) { account_model parent_account: t_root_account }
  let_once(:t_course) { course_with_teacher(user: t_teacher, account: t_sub_account, active_all: true).course }
  let_once(:t_root_admin) { account_admin_user account: t_root_account }

  before do
    allow_any_instance_of(User).to receive(:set_default_feature_flags)
    allow(Feature).to receive(:definitions).and_return({
      'root_account_feature' => Feature.new(feature: 'root_account_feature', applies_to: 'RootAccount', state: 'allowed'),
      'account_feature' => Feature.new(feature: 'account_feature', applies_to: 'Account', state: 'on', display_name: lambda { "Account Feature FRD" }, description: lambda { "FRD!!" }, beta: true,  autoexpand: true),
      'course_feature' => Feature.new(feature: 'course_feature', applies_to: 'Course', state: 'allowed', development: true, release_notes_url: 'http://example.com', display_name: "not localized", description: "srsly"),
      'user_feature' => Feature.new(feature: 'user_feature', applies_to: 'User', state: 'allowed'),
      'root_opt_in_feature' => Feature.new(feature: 'root_opt_in_feature', applies_to: 'Course', state: 'allowed', root_opt_in: true),
      'hidden_feature' => Feature.new(feature: 'hidden_feature', applies_to: 'Course', state: 'hidden'),
      'hidden_user_feature' => Feature.new(feature: 'hidden_user_feature', applies_to: 'User', state: 'hidden')
    })
  end

  describe "index" do
    it "should check permissions" 


    it "should return the correct format" 


    it "should paginate" 


    it "should return only relevant features" 


    it "should respect root_opt_in" 


    describe "hidden" do
      it "should show hidden features on site admin" 


      it "should show hidden features on root accounts to a site admin user" 


      it "should show un-hidden features to non-site-admins on root accounts" 


      it "should show 'hidden' tag to site admin on the feature flag that un-hides a hidden feature" 


      it "should not show 'hidden' tag on a lower-level feature flag" 


      it "should not show 'hidden' tag on an inherited feature flag" 

    end

    it "should operate on a course" 


    it "should operate on a user" 

  end

  describe "enabled_features" do
    it "should check permissions" 


    it "should return the correct format" 

  end

  describe "show" do
    it "should check permissions" 


    it "should 404 if the feature doesn't exist" 


    it "should return the correct format" 


    describe "hidden" do
      it "should not find a hidden feature if the caller is an account admin" 


      it "should find a hidden feature on a root account if the caller is site admin" 

    end
  end

  describe "update" do
    it "should check permissions" 


    it "should validate state" 


    it "should create a new flag" 


    it "should update an existing flag" 


    context "sharding" do
      specs_require_sharding

      it "should not explode with cross-shard updating" 

    end

    it "should refuse to update if the canvas default locks the feature" 


    it "should refuse to update if a higher account's flag locks the feature" 


    it "should update the implicitly created root_opt_in feature flag" 


    it "should disallow 'allowed' setting for RootAccount features on (non-site-admin) root accounts" 


    it "should clear the context's feature flag cache before deciding to insert or update" 


    describe "hidden" do
      it "should create a site admin feature flag" 


      it "should create a root account feature flag with site admin privileges" 


      it "should create a user feature flag with site admin priveleges" 


      context "AccountManager" do
        before :once do
          role = custom_account_role('AccountManager', :account => t_site_admin)
          t_site_admin.role_overrides.create!(permission: 'manage_feature_flags',
                                              role: role,
                                              enabled: true,
                                              applies_to_self: false,
                                              applies_to_descendants: true)
          @site_admin_member = site_admin_user(role: role)
        end

        it "should not create a site admin feature flag" 


        it "should create a root account feature flag" 

      end

      it "should not create a root account feature flag with root admin privileges" 


      it "should modify a root account feature flag with root admin privileges" 


      it "should not create a sub-account feature flag if no root-account or site-admin flag exists" 


      it "should create a sub-account feature flag if a root-account feature flag exists" 


      it "should create a sub-account feature flag if a site-admin feature flag exists" 

    end
  end

  describe "delete" do
    it "should check permissions" 


    it "should delete a feature flag" 


    it "should not delete an inherited flag" 

  end

  describe "custom_transition_proc" do
    before do
      allow(Feature).to receive(:definitions).and_return({
          'custom_feature' => Feature.new(feature: 'custom_feature', applies_to: 'Course', state: 'allowed',
                custom_transition_proc: ->(user, context, from_state, transitions) do
                  transitions['off'] = { 'locked'=>true, 'message'=>"don't ever turn this off" } if from_state == 'on'
                  transitions['on'] = { 'locked'=>false, 'message'=>"this is permanent?!" } if transitions.has_key?('on')
                end
          )
      })
    end

    it "should give message for unlocked transition" 


    context "locked transition" do
      before do
        t_course.enable_feature! :custom_feature
      end

      it "should indicate a transition is locked" 


      it "should reject a locked state transition" 

    end
  end

  describe "after_state_change_proc" do
    let(:t_state_changes) { [] }

    before do
      allow(Feature).to receive(:definitions).and_return({
          'custom_feature' => Feature.new(feature: 'custom_feature', applies_to: 'Course', state: 'allowed',
                after_state_change_proc: ->(user, context, from_state, to_state) do
                  t_state_changes << [user.id, context.id, from_state, to_state]
                end
          )
      })
    end

    it "should fire when creating a feature flag to enable an allowed feature" 


    it "should fire when changing a feature flag's state" 

  end

end

