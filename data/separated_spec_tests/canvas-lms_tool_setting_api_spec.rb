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
require_dependency "lti/ims/tool_setting_controller"

module Lti
  module Ims
    describe ToolSettingController, type: :request do

      let(:account) { Account.new }
      let (:product_family) { ProductFamily.create(vendor_code: '123', product_code: 'abc', vendor_name: 'acme', root_account: account) }
      let(:tool_proxy) do
        ToolProxy.create!(
          context: account,
          guid: SecureRandom.uuid,
          shared_secret: 'abc',
          product_family: product_family,
          product_version: '1',
          workflow_state: 'disabled',
          raw_data: {'proxy' => 'value'},
          lti_version: '1'
        )
      end
      let(:resource_handler) {ResourceHandler.create!(resource_type_code: 'code', name: 'name', tool_proxy: tool_proxy)}
      let(:message_handler) {MessageHandler.create(message_type: 'basic-lti-launch-request', launch_path: 'https://samplelaunch/blti', resource_handler: resource_handler)}
      let(:access_token) {Lti::Oauth2::AccessToken.create_jwt(aud: nil, sub: tool_proxy.guid).to_s}

      before do
        allow_any_instance_of(ToolSettingController).to receive_messages(oauth_authenticated_request?: true)
        allow_any_instance_of(ToolSettingController).to receive_messages(authenticate_body_hash: true)
        allow_any_instance_of(ToolSettingController).to receive_messages(oauth_consumer_key: tool_proxy.guid)
        allow(AuthenticationMethods).to receive_messages(access_token: access_token)
        @link_setting = ToolSetting.create(tool_proxy: tool_proxy, context: account, resource_link_id: 'abc', custom: {link: :setting, a: 1, b: 2, c: 3})
        @binding_setting = ToolSetting.create(tool_proxy: tool_proxy, context: account, custom: {binding: :setting, a: 1, b: 2, d: 4})
        @proxy_setting = ToolSetting.create(tool_proxy: tool_proxy, custom: {proxy: :setting, a: 1, c: 3, d: 4})
      end

      describe "#show" do

        it 'returns toolsettings.simple when requested' 


        it 'returns toolsettings when requested' 


        it 'returns not_found if there isn\'t a tool setting' 


        it 'returns as a bad request when bubble is something besides "all" or "distinct"' 


        it 'returns as a bad request when bubble is "all" and the accept type is "simple"' 


        context 'lti_link' do

          it 'returns the lti_link using resource_link_id' 


          it 'returns the lti link simple json' 


          it 'returns the lti link tool settings json with bubble distinct' 


          it 'returns the lti link tool settings simple json with bubble distinct' 


          it 'bubbles up all levels' 


          it 'finds the tool setting by "resource_link_id"' 

        end

        context 'binding' do
          it 'returns the simple json' 


          it 'returns the lti_link using resource_link_id' 


          it 'returns the tool settings json with bubble distinct' 


          it 'returns the tool settings simple json with bubble distinct' 


          it 'bubbles up from binding' 


        end

        context 'tool proxy' do
          it 'returns the lti link simple json' 


          it 'returns the lti_link using resource_link_id' 


          it 'returns the tool settings json with bubble distinct' 


          it 'returns the tool settings simple json with bubble distinct' 


          it 'bubbles up from tool proxy' 


        end
      end

      describe "#update" do

        it 'returns as a bad request when bubble is set' 


        it 'returns as a bad request when there is more than one @graph item' 


        it 'updates a tool_setting with a single graph element' 


        context "lti_link" do
          it 'creates a new lti link tool setting' 

        end

        context "binding" do
          it 'creates a new binding tool setting' 

        end

        context "proxy" do
          it 'creates a new tool_proxy tool setting' 

        end

      end

    end
  end
end

