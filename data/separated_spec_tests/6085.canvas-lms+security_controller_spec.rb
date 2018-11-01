#
# Copyright (C) 2018 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../api_spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../lti_1_3_spec_helper')

require_dependency "lti/ims/security_controller"

module Lti::Ims
  RSpec.describe SecurityController, type: :request do
    include_context 'lti_1_3_spec_helper'

    let(:url) { Rails.application.routes.url_helpers.jwks_show_path }
    let(:json) { JSON.parse(response.body) }

    it 'returns ok status' 


    it 'returns a jwk set' 


    it 'returns well-formed public key jwks' 

  end
end

