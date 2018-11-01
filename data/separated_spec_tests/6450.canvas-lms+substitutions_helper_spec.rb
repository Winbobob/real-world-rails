#
# Copyright (C) 2014 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../sharding_spec_helper')
require_dependency "lti/substitutions_helper"

module Lti
  describe SubstitutionsHelper do
    subject { SubstitutionsHelper.new(course, root_account, user) }

    specs_require_sharding

    let(:course) {
      Course.new.tap do |c|
        c.root_account = root_account
        c.account = account
      end
    }
    let(:root_account) { Account.create! }
    let(:account) {
      Account.create!(root_account: root_account)
    }
    let(:user) { User.create! }

    def set_up_persistance!
      @shard1.activate { user.save! }
      @shard2.activate do
        root_account.save!
        account.save!
        course.save!
      end
    end

    describe '#account' do
      it 'returns the context when it is an account' 


      it 'returns the account when it is a course' 


      it 'returns the root_account by default' 

    end

    describe '#enrollments_to_lis_roles' do
      it 'converts students' 


      it 'converts teachers' 


      it 'converts teacher assistants' 


      it 'converts designers' 


      it 'converts observers' 


      it 'converts admins' 


      it 'converts fake students' 


      it 'converts multiple roles' 


      it 'sends at most one of each role' 

    end

    describe '#all_roles' do

      it 'converts multiple roles' 


      it "returns none if no user" 


      it 'converts multiple roles for lis 2' 


      it "returns none if no user for lis 2" 


      it "includes main and subrole for TeachingAssistant" 


      it 'converts multiple roles for lti 1.3' 


      it "returns none if no user for lti 1.3" 


      it "includes main and subrole for TeachingAssistant for lti 1.3" 


      it 'does not include admin role if user has a sub-account admin user record in deleted account' 

    end

    describe '#course_enrollments' do
      it 'returns an empty array if the context is not a course' 


      it 'returns an empty array if the user is nil' 


      it 'returns the active enrollments in a course for a user' 


      it 'returns an empty array if there is no user' 

    end

    describe '#account_enrollments' do
      subject { SubstitutionsHelper.new(account, root_account, user) }
      it 'returns enrollments in an account for a user' 


      it 'does not return deleted account enrollments' 


      it 'returns enrollments in an account chain for a user' 


      it 'returns an empty array if there is no user' 

    end

    describe '#current_lis_roles' do
      it 'returns none if the user has no roles' 


      it "returns the user's roles" 

    end

    describe '#concluded_course_enrollments' do
      it 'returns an empty array if the context is not a course' 


      it 'returns an empty array if the user is not set' 


      it 'returns the active enrollments in a course for a user' 

    end

    describe '#concluded_lis_roles' do
      it 'returns none if the user has no roles' 


      it "returns the user's roles" 

    end

    describe '#current_canvas_roles_lis_v2' do
      it 'returns the LIS V2 role names' 


      it 'does not include concluded roles' 


      it 'does not include roles from other contexts' 


      it 'can be directed to use the LIS 2 role map' 


      it 'can be directed to use the LTI 1.3 role map' 

    end

    describe '#current_canvas_roles' do
      it 'returns readable names for canvas roles' 

    end

    describe '#enrollment_state' do
      it 'is active if there are any active enrollments' 


      it 'is inactive if there are no active enrollments' 


      it 'is inactive if the course is concluded' 


      it 'is blank if there are no enrollments' 

    end

    describe '#previous_course_ids_and_context_ids' do
      before do
        course.save!
        @c1 = Course.create!
        @c1.root_account = root_account
        @c1.account = account
        @c1.lti_context_id = 'abc'
        @c1.save

        course.content_migrations.create!.tap do |cm|
          cm.context = course
          cm.workflow_state = 'imported'
          cm.source_course = @c1
          cm.save!
        end

        @c2 = Course.create!
        @c2.root_account = root_account
        @c2.account = account
        @c2.lti_context_id = 'def'
        @c2.save!

        course.content_migrations.create!.tap do |cm|
          cm.context = course
          cm.workflow_state = 'imported'
          cm.source_course = @c2
          cm.save!
        end

        @c3 = Course.create!
        @c3.root_account = root_account
        @c3.account = account
        @c3.lti_context_id = 'hij'
        @c3.save!

        @c1.content_migrations.create!.tap do |cm|
          cm.context = @c1
          cm.workflow_state = 'imported'
          cm.source_course = @c3
          cm.save!
        end
      end

      it "should return previous canvas course ids" 


      it "should return previous lti context_ids" 

    end

    describe '#recursively_fetch_previous_course_ids_and_context_ids' do
      before do
        course.save!
        @c1 = Course.create!
        @c1.root_account = root_account
        @c1.account = account
        @c1.lti_context_id = 'abc'
        @c1.save

        course.content_migrations.create!.tap do |cm|
          cm.context = course
          cm.workflow_state = 'imported'
          cm.source_course = @c1
          cm.save!
        end

        @c2 = Course.create!
        @c2.root_account = root_account
        @c2.account = account
        @c2.lti_context_id = 'def'
        @c2.save!

        course.content_migrations.create!.tap do |cm|
          cm.context = course
          cm.workflow_state = 'imported'
          cm.source_course = @c2
          cm.save!
        end

        @c3 = Course.create!
        @c3.root_account = root_account
        @c3.account = account
        @c3.lti_context_id = 'ghi'
        @c3.save!

        @c1.content_migrations.create!.tap do |cm|
          cm.context = @c1
          cm.workflow_state = 'imported'
          cm.source_course = @c3
          cm.save!
        end
      end

      it "should return previous lti context_ids" 

    end

    describe "section substitutions" do
      before do
        course.save!
        @sec1 = course.course_sections.create(:name => 'sec1')
        @sec1.sis_source_id = 'def'
        @sec1.save!
        @sec2 = course.course_sections.create!(:name => 'sec2')
        @sec2.sis_source_id = 'abc'
        @sec2.save!
        # course.reload

        user.save!
        multiple_student_enrollment(user, @sec1, course: course)
        multiple_student_enrollment(user, @sec2, course: course)
      end

      it "should return all canvas section ids" 


      it "should return all canvas section sis ids" 

    end

    context "email" do
      let(:course) { Course.create!(root_account: root_account, account: account) }

      let(:tool) do
        ContextExternalTool.create!(
          name: 'test tool',
          context: course,
          consumer_key: 'key',
          shared_secret: 'secret',
          url: 'http://exmaple.com/launch'
        )
      end

      let(:substitution_helper) { SubstitutionsHelper.new(course, root_account, user, tool) }

      let(:user) do
        user = User.create!
        user.email ='test@foo.com'
        user.save!
        user
      end

      describe "#email" do
        it "returns the users email" 


        let(:sis_email) {'sis@example.com'}

        let(:sis_pseudonym) do
          cc = user.communication_channels.email.create!(path: sis_email)
          cc.user = user
          cc.save!
          pseudonym = cc.user.pseudonyms.build(:unique_id => cc.path, :account => Account.default)
          pseudonym.sis_communication_channel_id=cc.id
          pseudonym.communication_channel_id=cc.id
          pseudonym.sis_user_id="some_sis_id"
          pseudonym.save
          pseudonym
        end

        it "returns the sis email if it's an LTI2 tool" 


        context "prefer_sis_email" do
          before(:each) do
            tool.settings[:prefer_sis_email] = "true"
            tool.save!
          end

          it "returns the sis_email" 


          it "returns the sis_email when set via tool_configuration" 


          it "returns the users email if there isn't a sis email" 


        end
      end

      describe "#sis_email" do

        it "returns the sis email" 


        it "returns nil if there isn't an sis email" 


      end
    end
  end
end

