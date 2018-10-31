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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe Feature do
  let(:t_site_admin) { Account.site_admin }
  let(:t_root_account) { account_model }
  let(:t_sub_account) { account_model parent_account: t_root_account }
  let(:t_course) { course_factory account: t_sub_account, active_all: true }
  let(:t_user) { user_with_pseudonym account: t_root_account }

  before do
    allow_any_instance_of(User).to receive(:set_default_feature_flags)
    allow(Feature).to receive(:definitions).and_return({
        'RA' => Feature.new(feature: 'RA', applies_to: 'RootAccount', state: 'hidden'),
        'A' => Feature.new(feature: 'A', applies_to: 'Account', state: 'on'),
        'C' => Feature.new(feature: 'C', applies_to: 'Course', state: 'off'),
        'U' => Feature.new(feature: 'U', applies_to: 'User', state: 'allowed'),
    })
  end

  describe "applies_to_object" do
    it "should work for RootAccount features" 


    it "should work for Account features" 


    it "should work for Course features" 


    it "should work for User features" 

  end

  describe "applicable_features" do
    it "should work for Site Admin" 


    it "should work for RootAccounts" 


    it "should work for Accounts" 


    it "should work for Courses" 


    it "should work for Users" 

  end

  describe "locked?" do
    it "should return true if context is nil" 


    it "should return true in a lower context if the definition disallows override" 

  end

  describe "RootAccount feature" do
    it "should imply root_opt_in" 

  end

  describe "default_transitions" do
    it "should enumerate RootAccount transitions" 


    it "should enumerate Account transitions" 


    it "should enumerate Course transitions" 


    it "should enumerate User transitions" 

  end
end

describe "Feature.register" do
  before do
    # unregister the default features
    @old_features = Feature.instance_variable_get(:@features)
    Feature.instance_variable_set(:@features, nil)
  end

  after do
    Feature.instance_variable_set(:@features, @old_features)
  end

  let(:t_feature_hash) do
    {
      display_name: -> { "some feature or other" },
      description: -> { "this does something" },
      applies_to: 'RootAccount',
      state: 'allowed'
    }
  end

  let(:t_dev_feature_hash) do
    t_feature_hash.merge(development: true)
  end

  it "should register a feature" 


  describe "development" do
    it "should register in a test environment" 


    it "should register in a dev environment" 


    it "should register in a production test cluster" 


    it "should not register in production" 

  end

  let(:t_hidden_in_prod_feature_hash) do
    t_feature_hash.merge(state: 'hidden_in_prod')
  end

  describe 'hidden_in_prod' do
    it "should register as 'allowed' in a test environment" 


    it "should register as 'hidden' in production" 

  end
end

describe "new_gradebook" do
  let(:ngb_trans_proc) { Feature.definitions["new_gradebook"].custom_transition_proc }
  let(:root_account) { account_model }
  let(:transitions) { { "on" => {}, "allowed" => {}, "off" => {} } }
  let(:course) { course_factory(account: root_account, active_all: true) }
  let(:teacher) { teacher_in_course(course: course).user }
  let(:ta) { ta_in_course(course: course).user }
  let(:admin) { account_admin_user(account: root_account) }

  LOCKED = { "locked" => true }.freeze
  UNLOCKED = { "locked" => false }.freeze

  it "allows admins to enable the new gradebook" 


  it "allows teachers to enable the new gradebook" 


  it "doesn't allow tas to enable the new gradebook" 


  it "does not allow enabling new gradebook on an entire account" 


  describe "coursel-level backwards compatibility" do
    let(:student) { student_in_course(course: course).user }
    let!(:assignment) { course.assignments.create!(title: 'assignment', points_possible: 10) }
    let(:submission) { assignment.submissions.find_by(user: student) }

    it "blocks disabling new gradebook on a course if there are any submissions with a late_policy_status of none" 


    it "blocks disabling new gradebook on a course if there are any submissions with a late_policy_status of missing" 


    it "blocks disabling new gradebook on a course if there are any submissions with a late_policy_status of late" 


    it "allows disabling new gradebook on a course if there are no submissions with a late_policy_status" 


    it "blocks disabling new gradebook on a course if a late policy is configured" 


    it "blocks disabling new gradebook on a course if a missing policy is configured" 


    it "blocks disabling new gradebook on a course if both a late and missing policy is configured" 


    it "allows disabling new gradebook on a course if both policies are disabled" 

  end

  describe 'account-level backwards compatibility' do
    let(:sub_account) do
      first_level = account_model(parent_account: root_account)
      account_model(parent_account: first_level)
    end

    let(:course_at_sub_account) { course_factory(account: sub_account, active_all: true) }

    context 'when no course or sub-account has the flag enabled' do
      it 'allows disabling the flag' 


      it 'adds no warnings' 

    end

    context 'when any course has the flag enabled' do
      before do
        course_at_sub_account.enable_feature!(:new_gradebook)

        ngb_trans_proc.call(admin, root_account, nil, transitions)
      end

      it 'blocks disabling the flag' 


      it 'adds a warning' 

    end

    context 'when any sub-account has the flag enabled' do
      before do
        sub_account.enable_feature!(:new_gradebook)

        ngb_trans_proc.call(admin, root_account, nil, transitions)
      end

      it 'blocks disabling the flag' 


      it 'adds a warning' 

    end
  end
end

