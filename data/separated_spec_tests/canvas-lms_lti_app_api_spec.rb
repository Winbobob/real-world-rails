#
# Copyright (C) 2014 Instructure, Inc.
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

require_relative '../api_spec_helper'
require_relative '../../lti_spec_helper'
require_dependency "lti/lti_apps_controller"

module Lti
  describe LtiAppsController, type: :request do
    include LtiSpecHelper

    let(:account) { Account.create }
    describe '#launch_definitions' do

      before do
        tp = create_tool_proxy
        tp.bindings.create(context: account)
        rh = create_resource_handler(tp)
        @mh = create_message_handler(rh)
        @external_tool = new_valid_external_tool(account)
      end

      it 'returns a list of launch definitions for a context and placements' 


      it 'works for a teacher even without lti_add_edit permissions' 


      it 'returns unauthorized for a student' 


      it 'returns global_navigation launches for a student using account context' 


      it 'paginates the launch definitions' 

    end

    describe '#index' do

      before do
        @tp = create_tool_proxy
        @tp.bindings.create(context: account)
        @external_tool = new_valid_external_tool(account)
      end

      it 'returns a list of app definitions for a context' 


      it 'paginates the launch definitions' 


    end


  end
end

