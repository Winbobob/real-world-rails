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
require File.expand_path(File.dirname(__FILE__) + '/../../lti2_spec_helper')
require_dependency "lti/message_controller"

module Lti
  describe MessageController do
    include_context 'lti2_spec_helper'
    let(:enabled_capability) {
      %w(ToolConsumerInstance.guid
         Message.documentTarget
         Message.locale
         Membership.role
         Context.id)
    }

    let(:default_resource_handler) do
      ResourceHandler.create!(
        resource_type_code: 'instructure.com:default',
        name: 'resource name',
        tool_proxy: tool_proxy
      )
    end

    describe "GET #registration" do
      context 'course' do
        it 'initiates a tool proxy registration request' 


        it "doesn't allow student to register an app" 


        it "includes the authorization URL when feature flag enabled" 


        it 'only allows http and https protocols in the "tool_consumer_url"' 

      end

      context 'account' do
        it 'initiates a tool proxy registration request' 


        it "doesn't allow non admin to register an app" 


      end

    end

    describe 'GET #registration_return' do
      before {user_session(account_admin_user)}

      it 'does not 500 if tool registration fails' 

    end

    describe "GET #reregistration" do
      before(:each) do
        MessageHandler.create!(
          message_type: IMS::LTI::Models::Messages::ToolProxyUpdateRequest::MESSAGE_TYPE,
          launch_path: 'https://samplelaunch/rereg',
          resource_handler: default_resource_handler
        )
      end
      context 'course' do
        it 'initiates a tool proxy reregistration request' 


        it 'sends the correct version' 


        it 'sends the correct resource_url' 


        it 'sends the correct oauth_consumer_key' 


        it 'sends the correct tc_profile_url' 


        it 'sends the correct launch_presentation_return_url' 



        it 'returns an error if there is not a reregistration handler' 


        it "doesn't allow a student to reregister an app" 


      end
    end

    describe "GET #resource_link_id" do
      include_context 'lti2_spec_helper'

      let(:link_id) {SecureRandom.uuid}

      let(:lti_link) do
        Link.new(resource_link_id: link_id,
                 vendor_code: product_family.vendor_code,
                 product_code: product_family.product_code,
                 resource_type_code: resource_handler.resource_type_code)
      end

      before do
        message_handler.update_attributes(message_type: MessageHandler::BASIC_LTI_LAUNCH_REQUEST)
        resource_handler.message_handlers = [message_handler]
        resource_handler.save!
        lti_link.save!
        user_session(account_admin_user)
      end

      it 'succeeds if tool is installed in the current account' 


      it 'succeeds if the tool is installed in the current course' 


      it "succeeds if the tool is installed in the current course's account" 


      context 'resource_url' do
        let(:custom_url) {'http://www.samplelaunch.com/custom-resource-url'}
        let(:link_id) {SecureRandom.uuid}
        let(:lti_link) do
          Link.create!(resource_link_id: link_id,
                       vendor_code: product_family.vendor_code,
                       product_code: product_family.product_code,
                       resource_type_code: resource_handler.resource_type_code,
                       resource_url: custom_url)
        end

        it "uses the 'resource_url' if provided in the 'link_id'" 


        it "responds with 400 if host name does not match" 

      end

      context 'assignment' do
        let(:assignment) {course.assignments.create!(name: 'test')}

        before {tool_proxy.update_attributes(context: course)}

        it 'finds the specified assignment' 


        it 'renders not found if assignment does not exist' 

      end

      context 'search account chain' do
        let(:root_account) {Account.create!}

        before {account.update_attributes(root_account: root_account)}

        it "succeeds if the tool is installed in the current account's root account" 


        it "succeeds if the tool is installed in the current course's root account" 

      end

      it "renders 'not found' no message handler is found" 

    end

    describe "GET #basic_lti_launch_request" do
      before(:each) do
        course_with_student(account: account, active_all: true)
        user_session(@student)
      end

      context 'jwt' do
        let(:tool_profile) do
          {
            'security_profile' => { 'security_profile_name' => 'lti_jwt_message_security' }
          }
        end

        before(:each) do
          tool_proxy.raw_data['tool_profile'] = tool_profile
          tool_proxy.save!
        end

        it 'does a jwt launch' 


        it 'signs the jwt with the shared secret' 


        it 'returns the roles as an array' 


        it 'url encodes the aud' 


      end

      context 'account' do

        it 'returns the signed params' 


        it 'launches gracefully if it can not find the content_tag for the given module_item_id' 


        it 'sets the active tab' 


        it 'returns a 404 when when no handler is found' 


        it 'redirects to login page if there is no session' 


        it 'does custom variable expansion for tool settings' 


        it 'returns the roles' 


        it 'returns the oauth_callback' 



        it 'adds module item substitutions' 


        it 'sets the launch to window' 


        it 'returns the locale' 


        it 'returns tool settings in the launch' 


        it 'does not do variable substitutions for tool settings' 


        it 'adds params from secure_params' 


        it 'uses the lti_assignment_id as the resource_link_id' 


        it 'does only adds non-required params if they are present in enabled_capability' 

      end

      describe "resource link" do
        it 'creates resource_links without a resource_link_fragment' 


        it 'creates with a resource_link_fragment' 



      end

      context 'tool settings' do
        it 'creates the tool proxy setting object' 

      end

    end
  end
end

