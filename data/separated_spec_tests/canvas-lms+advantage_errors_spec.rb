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

require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require_dependency "lti/ims/advantage_errors"

describe 'LTI Advantage Errors' do

  shared_examples 'error check' do
    it 'initializes with default api message and http status code' 


    it 'supports override of api message and http status code' 


    it 'supports override of message along with api message and http status code' 


    it 'suppresses duplicate message and api message' 


    it 'preserves arbitrary options' 


    it 'supports idiomatic raise usage' 

  end

  describe Lti::Ims::AdvantageErrors::AdvantageServiceError do
    let(:default_api_message) { 'Failed LTI Advantage service invocation' }
    let(:default_status_code) { :internal_server_error }

    it_behaves_like 'error check'
  end

  describe Lti::Ims::AdvantageErrors::AdvantageClientError do
    let(:default_api_message) { 'Invalid LTI Advantage service invocation' }
    let(:default_status_code) { :bad_request }

    it_behaves_like 'error check'
  end

  describe Lti::Ims::AdvantageErrors::AdvantageSecurityError do
    let(:default_api_message) { 'Service invocation refused' }
    let(:default_status_code) { :unauthorized }

    it_behaves_like 'error check'
  end

  describe Lti::Ims::AdvantageErrors::InvalidAccessToken do
    let(:default_api_message) { 'Invalid access token' }
    let(:default_status_code) { :unauthorized }

    it_behaves_like 'error check'
  end

  describe Lti::Ims::AdvantageErrors::InvalidAccessTokenSignature do
    let(:default_api_message) { 'Invalid access token signature' }
    let(:default_status_code) { :unauthorized }

    it_behaves_like 'error check'
  end

  describe Lti::Ims::AdvantageErrors::InvalidAccessTokenSignatureType do
    let(:default_api_message) { 'Access token signature algorithm not allowed' }
    let(:default_status_code) { :unauthorized }

    it_behaves_like 'error check'
  end

  describe Lti::Ims::AdvantageErrors::MalformedAccessToken do
    let(:default_api_message) { 'Invalid access token format' }
    let(:default_status_code) { :unauthorized }

    it_behaves_like 'error check'
  end

  describe Lti::Ims::AdvantageErrors::InvalidAccessTokenClaims do
    let(:default_api_message) { 'Access token contains invalid claims' }
    let(:default_status_code) { :unauthorized }

    it_behaves_like 'error check'
  end

  describe Lti::Ims::AdvantageErrors::InvalidResourceLinkIdFilter do
    let(:default_api_message) { 'Invalid \'rlid\' parameter' }
    let(:default_status_code) { :bad_request }

    it_behaves_like 'error check'
  end

  describe 'base error rescue sanity check' do
    it 'rescue of base service error type catches error subtypes' 

  end
end

