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

require File.expand_path(File.dirname(__FILE__) + '/../../api_spec_helper')
require_dependency "lti/ims/tool_consumer_profile_controller"

module Lti
  module Ims
    describe ToolConsumerProfileController, type: :request do

      describe "GET 'tool_consumer_profile'" do

        let(:account) { Account.create! }

        it 'renders "application/vnd.ims.lti.v2.toolconsumerprofile+json"' 


        it 'returns the consumer profile JSON' 


        it 'does not include restricted services' 


        it 'does not include restricted capabilities' 

      end

      describe "Get 'tool_consumer_profile' with DeveloperKey" do
        let(:account) { Account.create! }
        let(:dev_key) do
          dev_key = DeveloperKey.create(api_key: 'test-api-key')
          allow(DeveloperKey).to receive(:find_cached).and_return(dev_key)
          dev_key
        end
        let!(:tcp) do
          dev_key.create_tool_consumer_profile!(
            services: Lti::ToolConsumerProfile::RESTRICTED_SERVICES,
            capabilities: Lti::ToolConsumerProfile::RESTRICTED_CAPABILITIES,
            uuid: SecureRandom.uuid,
            developer_key: dev_key
          )
        end

        let(:access_token) { Lti::Oauth2::AccessToken.create_jwt(aud: 'www.example.com', sub: dev_key.global_id) }

        let(:request_headers) { {Authorization: "Bearer #{access_token}"} }

        it 'returns the custom tcp using just the developer key' 


        it 'can include additional services' 


        it 'can include additional services ' 

      end

    end
  end
end

