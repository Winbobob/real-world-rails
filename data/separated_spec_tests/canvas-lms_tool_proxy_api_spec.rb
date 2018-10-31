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
require_dependency "lti/tool_proxy_controller"

module Lti
  describe ToolProxyController, type: :request do
    include LtiSpecHelper

    let(:account) { Account.create }

    describe "#destroy" do

      context 'course' do
        it 'marks a tool proxy as deleted from a course' 


        it "doesn't allow a student to delete tool proxies" 


        it 'deletes associated assignment subscriptions' 

      end

      context 'account' do
        it 'marks a tool proxy as deleted from a account' 


        it "doesn't allow a non-admin to delete tool proxies" 


        it 'deletes associated assignment subscriptions' 

      end

    end

    describe '#update' do
      context 'course' do
        it 'updates a tools workflow state' 


        it "doesn't allow a student to update" 

      end

      context 'account' do
        it 'updates a tools workflow state' 


        it "doesn't allow a non-admin to update workflow_state" 

      end

      context 'reregistration' do

        include WebMock::API

        # Bad ack request/response
        # Bad Transaction
        # --

        describe '#accept_update' do
          it 'updates properly' 


          it 'rolls back if ack response != 200' 


          # this should never happen
          # we already validate the proxy before we save the update_payload
          # if this does happen, We want the 500 error and the error report created
          it 'rolls back if our update fails' 

        end


        describe '#dismiss_update' do
          it 'dismiss properly' 

        end
      end

      context "navigation tabs caching" do

        it 'clears the cache for apps that have navigation placements' 


        it 'does not clear the cache for apps that do not have navigation placements' 

      end
    end
  end
end

