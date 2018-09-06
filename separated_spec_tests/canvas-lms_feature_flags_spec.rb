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

require File.expand_path(File.dirname(__FILE__) + '/../sharding_spec_helper.rb')

describe FeatureFlags do
  let(:t_site_admin) { Account.site_admin }
  let(:t_root_account) { account_model }
  let(:t_user) { user_with_pseudonym account: t_root_account }
  let(:t_sub_account) { account_model parent_account: t_root_account }
  let(:t_course) { course_with_teacher(user: t_user, account: t_sub_account, active_all: true).course }

  before do
    allow_any_instance_of(User).to receive(:set_default_feature_flags)
    allow(Feature).to receive(:definitions).and_return({
      'root_account_feature' => Feature.new(feature: 'root_account_feature', applies_to: 'RootAccount', state: 'off'),
      'account_feature' => Feature.new(feature: 'account_feature', applies_to: 'Account', state: 'on'),
      'course_feature' => Feature.new(feature: 'course_feature', applies_to: 'Course', state: 'allowed'),
      'user_feature' => Feature.new(feature: 'user_feature', applies_to: 'User', state: 'allowed'),
      'root_opt_in_feature' => Feature.new(feature: 'root_opt_in_feature', applies_to: 'Course', state: 'allowed', root_opt_in: true),
      'hidden_feature' => Feature.new(feature: 'hidden_feature', applies_to: 'Course', state: 'hidden'),
      'hidden_root_opt_in_feature' => Feature.new(feature: 'hidden_feature', applies_to: 'Course', state: 'hidden', root_opt_in: true),
      'hidden_user_feature' => Feature.new(feature: 'hidden_user_feature', applies_to: 'User', state: 'hidden')
  })
  end

  it "should report feature_enabled? correctly" 


  describe "#feature_allowed?" do
    it "returns true if the feature is 'on' or 'allowed', and false otherwise" 


    it "returns true if the feature is 'allowed', and false otherwise when passed exclude_enabled: true" 

  end

  describe "lookup_feature_flag" do
    it "should return nil if the feature isn't defined" 


    it "should return nil if the feature doesn't apply" 


    it "should return nil if the visible_on returns false" 


    it "should return defaults when no flags exist" 


    context "site admin flags" do
      it "should ignore site admin settings if definition doesn't allow override" 


      it "should apply site admin settings if definition does allow override" 


      it "should override lower settings if not allowed" 

    end

    context "account flags" do
      it "should apply settings at the sub-account level" 


      it "should ignore settings locked by a higher account" 


      it "should cache the lookup" 

    end

    context "course flags" do
      it "should apply settings at the course level" 

    end

    context "user flags" do
      it "should apply settings at the site admin level" 


      it "should apply settings at the user level" 

    end

    describe "root_opt_in" do
      context "with no feature flags" do
        it "should not find the feature beneath the root account" 


        it "should cache the nil of the feature beneath the root account" 

      end

      context "with site admin feature flag" do
        before do
          t_site_admin.feature_flags.create! feature: 'root_opt_in_feature'
        end

        it "should not find the feature beneath the root account" 

      end

      context "with root account feature flag" do
        before do
          t_root_account.feature_flags.create! feature: 'root_opt_in_feature'
        end

        it "should find the feature beneath the root account" 

      end
    end

    describe "hidden" do
      context "with no feature flags" do
        it "should not find the feature beneath site admin" 


        it "should find hidden features if override_hidden is given" 


        it "should not create the implicit-off root_opt_in flag" 


        it "override_hidden should not trump root_opt_in" 

      end

      context "with site admin feature flag" do
        before do
          t_site_admin.feature_flags.create! feature: 'hidden_feature'
          t_site_admin.feature_flags.create! feature: 'hidden_user_feature'
        end

        it "should find the feature beneath site admin" 


        it "should create the implicit-off root_opt_in flag" 

      end

      context "with root account feature flag" do
        before do
          t_root_account.feature_flags.create! feature: 'hidden_feature'
        end

        it "should find the feature beneath site admin" 


        it "should not find the feature on a root account without a flag" 

      end
    end

    context "cross-sharding" do
      specs_require_sharding

      it "should search on the correct shard" 


      it "should search for site admin flags on the correct shard" 

    end
  end

  describe "set_feature_flag!" do
    it "should create a feature flag" 


    it "should update a feature flag" 

  end

  describe "convenience methods" do
    it "should enable_feature!" 


    it "should allow_feature!" 


    it "should reset_feature!" 

  end

  describe "caching" do
    let(:t_cache_key) { t_root_account.feature_flag_cache_key('course_feature') }
    before do
      t_root_account.feature_flags.create! feature: 'course_feature', state: 'allowed'
    end

    it "should cache an object's feature flag" 


    it "should cache a nil result" 


    it "should invalidate the cache when a feature flag is changed" 


    it "should invalidate the cache when a feature flag is destroyed" 

  end
end

