#
# Copyright (C) 2015 - present Instructure, Inc.
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
require_dependency "lti/variable_expander"
module Lti
  describe VariableExpander do
    let(:root_account) { Account.new(lti_guid: 'test-lti-guid') }
    let(:account) { Account.new(root_account: root_account, name:'Test Account') }
    let(:course) { Course.new(account: account, course_code: 'CS 124', sis_source_id: '1234') }
    let(:group_category) { course.group_categories.new(name: 'Category') }
    let(:group) { course.groups.new(name: 'Group', group_category: group_category) }
    let(:user) { User.new }
    let(:assignment) { Assignment.new }
    let(:collaboration) do
      ExternalToolCollaboration.new(
        title: "my collab",
        user: user,
        url: 'http://www.example.com'
      )
    end
    let(:substitution_helper) { double.as_null_object }
    let(:right_now) { DateTime.now }
    let(:tool) do
      m = double('tool')
      allow(m).to receive(:id).and_return(1)
      allow(m).to receive(:context).and_return(root_account)
      allow(m).to receive(:extension_setting).with(nil, :prefer_sis_email).and_return(nil)
      allow(m).to receive(:extension_setting).with(:tool_configuration, :prefer_sis_email).and_return(nil)
      allow(m).to receive(:include_email?).and_return(true)
      allow(m).to receive(:include_name?).and_return(true)
      allow(m).to receive(:public?).and_return(true)
      shard_mock = double('shard')
      allow(shard_mock).to receive(:settings).and_return({encription_key: 'abc'})
      allow(m).to receive(:shard).and_return(shard_mock)
      allow(m).to receive(:opaque_identifier_for).and_return("6cd2e0d65bd5aef3b5ee56a64bdcd595e447bc8f")
      m
    end
    let(:controller) do
      request_mock = double('request')
      allow(request_mock).to receive(:url).and_return('https://localhost')
      allow(request_mock).to receive(:host).and_return('/my/url')
      allow(request_mock).to receive(:scheme).and_return('https')
      m = double('controller')
      allow(m).to receive(:css_url_for).with(:common).and_return('/path/to/common.scss')
      allow(m).to receive(:request).and_return(request_mock)
      allow(m).to receive(:logged_in_user).and_return(user)
      allow(m).to receive(:named_context_url).and_return('url')
      allow(m).to receive(:active_brand_config_url).with('json').and_return('http://example.com/brand_config.json')
      allow(m).to receive(:active_brand_config_url).with('js').and_return('http://example.com/brand_config.js')
      allow(m).to receive(:active_brand_config).and_return(double(to_json: '{"ic-brand-primary-darkened-5":"#0087D7"}'))
      allow(m).to receive(:polymorphic_url).and_return('url')
      view_context_mock = double('view_context')
      allow(view_context_mock).to receive(:stylesheet_path)
        .and_return(URI.parse(request_mock.url).merge(m.css_url_for(:common)).to_s)
      allow(m).to receive(:view_context).and_return(view_context_mock)
      m
    end
    let(:attachment) { attachment_model }
    let(:submission) { submission_model }
    let(:resource_link_id) { SecureRandom.uuid }
    let(:originality_report) do
      OriginalityReport.create!(attachment: attachment,
                                submission: submission,
                                link_id: resource_link_id)
    end
    let(:editor_contents) { '<p>This is the contents of the editor</p>' }
    let(:editor_selection) { 'is the contents' }
    let(:variable_expander) do
      VariableExpander.new(
        root_account,
        account,
        controller,
        current_user: user,
        tool: tool,
        originality_report: originality_report,
        editor_contents: editor_contents,
        editor_selection: editor_selection
      )
    end

    it 'clears the lti_helper instance variable when you set the current_user' 


    it 'registers expansions' 


    it 'expands registered variables' 


    it 'expands substring variables' 


    it 'handles multiple substring variables' 


    it 'does not expand a substring variable if it is not valid' 


    describe '#self.expansion_keys' do
      let(:expected_keys) do
        VariableExpander.expansions.keys.map { |c| c.to_s[1..-1] }
      end

      it 'includes all expansion keys' 

    end

    describe '#self.default_name_expansions' do
      let(:expected_keys) do
        VariableExpander.expansions.values.select { |v| v.default_name.present? }.map(&:name)
      end

      it 'includes all expansion keys that have default names' 

    end

    describe '#enabled_capability_params' do
      let(:enabled_capability) {
        %w(TestCapability.Foo
           ToolConsumerInstance.guid
           CourseSection.sourcedId
           Membership.role
           Person.email.primary
           Person.name.given
           Person.name.family
           Person.name.full
           Person.name.display
           Person.sourcedId
           User.id
           User.image
           Message.documentTarget
           Message.locale
           Context.id)
      }

      it 'does not use expansions that do not have default names' 


      it 'does use expansion that have default names' 


      it 'does use the default name as the key' 


      it 'includes ToolConsumerInstance.guid when in enabled capability' 


      it 'includes CourseSection.sourcedId when in enabled capability' 


      it 'includes Membership.role when in enabled capability' 


      it 'includes Person.email.primary when in enabled capability' 


      it 'includes Person.sourcedId when in enabled capability' 


      it 'includes User.id when in enabled capability' 


      it 'includes User.image when in enabled capability' 


      it 'includes Message.documentTarget' 


      it 'includes Message.locale' 


      it 'includes Context.id' 


      context 'privacy level include_name' do
        it 'includes Person.name.given when in enabled capability' 


        it 'includes Person.name.family when in enabled capability' 


        it 'includes Person.name.full when in enabled capability' 


        it 'includes Person.name.display when in enabled capability' 

      end
    end

    context 'lti1' do
      it 'handles expansion' 


      it 'expands substring variables' 

    end

    describe "#variable expansions" do
      it 'has a substitution for com.instructure.Assignment.lti.id' 


      it 'has a substitution for com.instructure.Assignment.lti.id when there is no tool setting' 


      it 'has a substitution for com.instructure.PostMessageToken' 


      it 'has a substitution for com.instructure.PostMessageToken when token is provided' 


      it 'has a substitution for com.instructure.Assignment.lti.id when secure params are present' 


      it 'has substitution for com.instructure.Editor.contents' 


      it 'has substitution for com.instructure.Editor.selection' 


      it 'has a substitution for Context.title' 


      it 'has substitution for vnd.Canvas.OriginalityReport.url' 


      it 'has substitution for com.instructure.OriginalityReport.id' 


      it 'has substitution for com.instructure.Submission.id' 


      it 'has substitution for com.instructure.File.id' 


      it 'has substitution for vnd.Canvas.submission.url' 


      it 'has substitution for vnd.Canvas.submission.history.url' 


      it 'has substitution for Message.documentTarget' 


      it 'has substitution for Message.locale' 


      it 'has substitution for $Canvas.api.domain' 


      it 'does not expand $Canvas.api.domain when the request is unset' 


      it 'has substitution for $com.instructure.brandConfigJSON.url' 


      it 'does not expand $com.instructure.brandConfigJSON.url when the controller is unset' 


      it 'has substitution for $com.instructure.brandConfigJSON' 


      it 'does not expand $com.instructure.brandConfigJSON when the controller is unset' 


      it 'has substitution for $com.instructure.brandConfigJS.url' 


      it 'does not expand $com.instructure.brandConfigJS.url when the controller is unset' 


      it 'has substitution for $Canvas.css.common' 


      it 'does not expand $Canvas.css.common when the controller is unset' 


      it 'has substitution for $Canvas.api.baseUrl' 


      it 'does not expand $Canvas.api.baseUrl when the request is unset' 


      it 'has substitution for $Canvas.account.id' 


      it 'has substitution for $Canvas.account.name' 


      it 'has substitution for $Canvas.account.sisSourceId' 


      it 'has substitution for $Canvas.rootAccount.id' 


      it 'has substitution for $Canvas.rootAccount.sisSourceId' 


      it 'has substitution for $Canvas.root_account.id' 


      it 'has substitution for $Canvas.root_account.uuid' 


      it 'has substitution for $Canvas.root_account.sisSourceId' 


      it 'has substitution for $Canvas.root_account.global_id' 


      it 'has substitution for $Canvas.shard.id' 


      context 'context is a group' do
        let(:variable_expander) { VariableExpander.new(root_account, group, controller, current_user: user) }

        it 'has substitution for $ToolProxyBinding.memberships.url when context is a group' 


        it 'does not substitute $ToolProxyBinding.memberships.url when the controller is unset' 

      end

      context 'when launching from a group assignment' do
        let(:group) { group_category.groups.create!(name: 'test', context: assignment_course) }
        let(:group_category) { GroupCategory.create!(name: 'test', context: assignment_course) }
        let(:new_assignment) { assignment_model(course: assignment_course) }
        let(:assignment_course) do
          c = course_model(account: account)
          c.save!
          c
        end
        let(:variable_expander) do
          VariableExpander.new(
            root_account,
            account,
            controller,
            current_user: user,
            tool: tool,
            assignment: new_assignment
          )
        end

        before do
          group.update_attributes!(users: [user])
          new_assignment.update_attributes!(group_category: group_category)
        end

        shared_examples 'a safe expansion when assignment is blank' do
          let(:expansion) { raise 'override in spec' }
          let(:variable_expander) do
            VariableExpander.new(
              root_account,
              account,
              controller,
              current_user: user,
              tool: tool
            )
          end

          it 'returns the variable if no Assignment is present' 

        end

        shared_examples 'a safe expansion when user is blank' do
          let(:expansion) { raise 'override in spec' }
          let(:variable_expander) do
            VariableExpander.new(
              root_account,
              account,
              controller,
              current_user: user,
              tool: tool
            )
          end

          it 'returns the variable if no User is present' 

        end

        describe 'com.instructure.Group.id' do
          let(:expansion_string) { '$com.instructure.Group.id' }

          it_behaves_like 'a safe expansion when assignment is blank' do
            let(:expansion) { expansion_string }
          end

          it_behaves_like 'a safe expansion when user is blank' do
            let(:expansion) { expansion_string }
          end

          it 'has a substitution for com.instructure.Group.id' 

        end

        describe 'com.instructure.Group.name' do
          let(:expansion_string) { '$com.instructure.Group.name' }

          it_behaves_like 'a safe expansion when assignment is blank' do
            let(:expansion) { expansion_string }
          end

          it_behaves_like 'a safe expansion when user is blank' do
            let(:expansion) { expansion_string }
          end

          it 'has a substitution for com.instructure.Group.name' 

        end
      end

      context 'context is a course' do
        let(:variable_expander) { VariableExpander.new(root_account, course, controller, current_user: user) }

        it 'has substitution for $ToolProxyBinding.memberships.url when context is a course' 


        it 'has substitution for $Canvas.course.id' 


        it 'has substitution for $Context.sourcedId' 


        it 'has substitution for $vnd.instructure.Course.uuid' 


        it 'has substitution for $Canvas.course.name' 


        it 'has substitution for $Canvas.course.workflowState' 


        it 'has substitution for $CourseSection.sourcedId' 


        it 'has substitution for $Canvas.course.sisSourceId' 


        it 'has substitution for $Canvas.enrollment.enrollmentState' 


        it 'has substitution for $Canvas.membership.roles' 


        it 'has substitution for $Canvas.membership.concludedRoles' 


        it 'has substitution for $Canvas.course.previousContextIds' 


        it 'has substitution for $Canvas.course.previousContextIds.recursive' 


        it 'has substitution for $Canvas.course.previousCourseIds' 


        it 'has a substitution for com.instructure.contextLabel' 


        context 'when the course has groups' do
          let(:course_with_groups) do
            course = variable_expander.context
            course.save!
            course
          end

          let!(:group_one) { course_with_groups.groups.create!(name: 'Group One') }
          let!(:group_two) { course_with_groups.groups.create!(name: 'Group Two') }

          describe '$com.instructure.Course.groupIds' do
            it 'has substitution' 


            it 'does not include groups outside of the course' 


            it 'only includes active group ids' 


            it 'guards against the course being nil' 

          end
        end
      end

      context 'context is a course and there is a user' do
        let(:variable_expander) { VariableExpander.new(root_account, course, controller, current_user: user, tool: tool) }

        it 'has substitution for $Canvas.xapi.url' 


        it 'has substitution for $Canvas.course.sectionIds' 


        it 'has substitution for $Canvas.course.sectionSisSourceIds' 


        it 'has substitution for $Canvas.course.startAt' 


        it 'has a functioning guard for $Canvas.term.startAt when term.start_at is not set' 


        it 'has substitution for $Canvas.term.startAt when term.start_at is set' 


        it 'has a functioning guard for $Canvas.term.name when term.name is not set' 


        it 'has substitution for $Canvas.term.name when term.name is set' 


        it 'has substitution for $Canvas.externalTool.url' 


        it 'does not substitute $Canvas.externalTool.url when the controller is unset' 


        it 'returns the opaque identifiers for the active groups the user is a part of' 

      end

      context 'context is a course with an assignment' do
        let(:variable_expander) { VariableExpander.new(root_account, course, controller, collaboration: collaboration) }

        it 'has substitution for $Canvas.api.collaborationMembers.url' 

      end

      context 'context is a course with an assignment' do
        let(:variable_expander) { VariableExpander.new(root_account, course, controller, current_user: user, assignment: assignment) }

        it 'has substitution for $Canvas.assignment.id' 


        it 'has substitution for $Canvas.assignment.title' 


        describe "$Canvas.assignment.pointsPossible" do
          it 'has substitution for $Canvas.assignment.pointsPossible' 


          it 'does not round if not whole' 


          it 'rounds if whole' 

        end

        it 'has substitution for $Canvas.assignment.unlockAt' 


        it 'has substitution for $Canvas.assignment.lockAt' 


        it 'has substitution for $Canvas.assignment.dueAt' 


        it 'has substitution for $Canvas.assignment.published' 


        context 'iso8601' do
          it 'has substitution for $Canvas.assignment.unlockAt.iso8601' 


          it 'has substitution for $Canvas.assignment.lockAt.iso8601' 


          it 'has substitution for $Canvas.assignment.dueAt.iso8601' 


          it 'handles a nil unlock_at' 


          it 'handles a nil lock_at' 


          it 'handles a nil due_at' 


        end


      end

      context 'user is not logged in' do
        let(:user) {}
        it 'has substitution for $vnd.Canvas.Person.email.sis when user is not logged in' 

      end

      context 'user is logged in' do

        it 'has substitution for $Person.name.full' 


        it 'has substitution for $Person.name.display' 


        it 'has substitution for $Person.name.family' 


        it 'has substitution for $Person.name.given' 


        it 'has substitution for $Person.email.primary' 


        it 'has substitution for $vnd.Canvas.Person.email.sis when user is added via sis' 


        it 'has substitution for $vnd.Canvas.Person.email.sis when user is NOT added via sis' 


        it 'has substitution for $Person.address.timezone' 


        it 'has substitution for $User.image' 


        it 'has substitution for $Canvas.user.id' 


        it 'has substitution for $vnd.instructure.User.uuid' 


        it 'has substitution for $Canvas.user.isRootAccountAdmin' 


        it 'has substitution for $Canvas.xuser.allRoles' 


        it 'has substitution for $Canvas.user.globalId' 


        it 'has substitution for $Membership.role' 


        it 'has substitution for $User.id' 


        context '$Canvas.user.prefersHighContrast' do
          it 'substitutes as true' 


          it 'substitutes as false' 

        end

        context 'pseudonym' do
          let(:pseudonym) { Pseudonym.new }

          before :each do
            allow(SisPseudonym).to receive(:for).with(user, anything, anything).and_return(pseudonym)
          end

          it 'has substitution for $Canvas.user.sisSourceId' 


          it 'has substitution for $Person.sourcedId' 



          it 'has substitution for $Canvas.user.loginId' 


          it 'has substitution for $User.username' 

        end

        context 'attachment' do
          let (:attachment) do
            attachment = attachment_obj_with_context(course)
            attachment.media_object = media_object
            attachment.usage_rights = usage_rights
            attachment
          end
          let(:media_object) do
            mo = MediaObject.new
            mo.media_id = '1234'
            mo.media_type = 'video'
            mo.duration = 555
            mo.total_size = 444
            mo.title = 'some title'
            mo
          end
          let(:usage_rights) do
            ur = UsageRights.new
            ur.legal_copyright = 'legit'
            ur
          end
          let(:variable_expander) { VariableExpander.new(root_account, account, controller, current_user: user, tool: tool, attachment: attachment) }

          it 'has substitution for $Canvas.file.media.id when a media object is present' 


          it 'has substitution for $Canvas.file.media.id when a media entry is present' 


          it 'has substitution for $Canvas.file.media.type' 


          it 'has substitution for $Canvas.file.media.duration' 


          it 'has substitution for $Canvas.file.media.size' 


          it 'has substitution for $Canvas.file.media.title' 


          it 'uses user_entered_title for $Canvas.file.media.title if present' 


          it 'has substitution for $Canvas.file.usageRights.name' 


          it 'has substitution for $Canvas.file.usageRights.url' 


          it 'has substitution for $Canvas.file.usageRights.copyright_text' 


        end

        it 'has substitution for $Canvas.masqueradingUser.id' 


        it 'does not expand $Canvas.masqueradingUser.id when the controller is unset' 


        it 'has substitution for $Canvas.masqueradingUser.userId' 


        it 'has substitution for Canvas.module.id' 


        it 'has substitution for Canvas.moduleItem.id' 


        it 'has substitution for ToolConsumerProfile.url' 

      end
    end
  end
end

