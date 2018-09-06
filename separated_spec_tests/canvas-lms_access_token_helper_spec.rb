#
# Copyright (C) 2017 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../lti2_api_spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../sharding_spec_helper')
require_dependency "lti/ims/access_token_helper"
require 'json/jwt'

module Lti
  module Ims
    describe AccessTokenHelper, type: :controller do
      specs_require_sharding
      include_context 'lti2_api_spec_helper'

      let(:service_name) { 'vnd.Canvas.CustomSecurity' }

      controller(ApplicationController) do
        include Lti::Ims::AccessTokenHelper
        before_action :authorized_lti2_tool

        def index
          head 200
        end

        def lti2_service_name
          'vnd.Canvas.CustomSecurity'
        end

      end

      it 'requires an access token' 


      it 'decrypts the access token' 


      it 'decrypts access token when signed with dev key' 


      it 'allows the request to go through' 


      it 'requires an active tool proxy id signed with share secret' 


      it 'requires an active developer key when signed with dev key' 


      it 'requires the developer key to be active' 


      it 'requires the defined service to be in the ToolProxy security contract' 


      it 'requires the http method to be in the security contract' 


      describe "#bearer_token" do
        let(:access_token_helper){ subject }

        it 'returns the bearer token for auth header' 

      end

      describe "#tool_proxy" do
        let(:access_token_helper){ subject }
        it 'returns the bearer token for auth header' 

      end

    end
  end
end

