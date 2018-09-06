#
# Copyright (C) 2017 Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper.rb')

describe Lti::PrivacyLevelExpander do
  include ExternalToolsSpecHelper
  let(:course) { course_model }
  let(:user) { course_with_student(course: course).user }
  let(:placement) {'resource_selection'}
  let(:tool) { new_valid_tool(course) }
  let(:launch_url) { 'http://www.test.com/launch' }
  let(:variable_expander) do
    Lti::VariableExpander.new(
      course.root_account,
      course,
      double(request: {body: 'body content'}),
      {
        current_user: user,
        current_pseudonym: user.pseudonyms.first,
        tool: tool
      }
    )
  end

  before do
    tool.custom_fields = {context_id: '$Context.id'}
    tool.save!
  end

  let(:helper) { Lti::PrivacyLevelExpander.new(placement, variable_expander) }

  describe 'expanded_variables' do
    it 'expands custom fields' 


    it 'includes supported parameters' 

  end

  describe 'supported_parameters' do
    context 'public privacy level' do
      let(:tool) do
        tool = new_valid_tool(course)
        tool.workflow_state = 'public'
        tool.save!
        tool
      end

      let(:helper) { Lti::PrivacyLevelExpander.new(placement, variable_expander) }

      it 'includes all supported parameters if privacy level is public' 

    end

    context 'name only privacy level' do
      let(:tool) do
        tool = new_valid_tool(course)
        tool.workflow_state = 'name_only'
        tool.save!
        tool
      end

      let(:helper) { Lti::PrivacyLevelExpander.new(placement, variable_expander) }

      it 'inlcudes anonymous and name only params if privacy level is name only' 

    end

    context 'email only privacy level' do
      let(:tool) do
        tool = new_valid_tool(course)
        tool.workflow_state = 'email_only'
        tool.save!
        tool
      end

      let(:helper) { Lti::PrivacyLevelExpander.new(placement, variable_expander) }

      it 'includes anonymous and email only params if privacy level is email only' 

    end

    context 'anonymous privacy level' do
      let(:tool) do
        tool = new_valid_tool(course)
        tool.workflow_state = 'anonymous'
        tool.save!
        tool
      end

      let(:helper) { Lti::PrivacyLevelExpander.new(placement, variable_expander) }

      it 'includes anonymouse parameters only if privacy level is anonymous' 

    end
  end
end

