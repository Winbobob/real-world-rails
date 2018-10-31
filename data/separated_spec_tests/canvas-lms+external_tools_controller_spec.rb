#
# Copyright (C) 2011 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../lti_1_3_spec_helper')

describe ExternalToolsController do
  include ExternalToolsSpecHelper

  before :once do
    course_with_teacher(:active_all => true)
    student_in_course(:active_all => true)
  end

  describe "GET 'jwt_token'" do

    before :each do
      @iat = Time.zone.now
      allow_any_instance_of(Time.zone.class).to receive(:now).and_return(@iat)
      @tool = new_valid_tool(@course)
      @tool.course_navigation = { message_type: 'ContentItemSelectionResponse' }
      @tool.save!
      @course.name = 'Course Name'
      @course.save!
    end

    it "returns the correct JWT token when given using the tool_id param" 


    it "does not return a JWT token for another context" 



    it "returns the correct JWT token when given using the tool_launch_url param" 


    it "sets status code to 404 if the requested tool id does not exist" 


    it "sets status code to 404 if no query params are provided" 


    it "sets status code to 404 if the requested tool_launch_url does not exist" 

  end

  describe "GET 'show'" do
    context 'resource link request' do
      include_context 'lti_1_3_spec_helper'

      let(:tool) do
        tool = @course.context_external_tools.new(
          name: "bob",
          consumer_key: "bob",
          shared_secret: "bob"
        )
        tool.url = "http://www.example.com/basic_lti"
        tool.course_navigation = { enabled: true }
        tool.use_1_3 = true
        tool.developer_key = DeveloperKey.create!
        tool.save!
        tool
      end

      it 'creates a resource link request when tool is configured to use LTI 1.3' 

    end

    context 'basic-lti-launch-request' do
      it "launches account tools for non-admins" 


      it "generates the resource_link_id correctly for a course navigation launch" 


      it 'generates the correct resource_link_id for a homework submission' 


      it "returns flash error if the tool is not found" 

    end

    context 'ContentItemSelectionResponse' do
      before :once do
        @tool = new_valid_tool(@course)
        @tool.course_navigation = { message_type: 'ContentItemSelectionResponse' }
        @tool.save!

        @course.name = 'a course'
        @course.save!
      end

      it "generates the resource_link_id correctly" 


      it "should remove query params when post_only is set" 


      it "should not remove query params when post_only is not set" 


      it "generates launch params for a ContentItemSelectionResponse message" 


      it "sends content item json for a course" 


      it "sends content item json for an assignment" 


      it "sends content item json for a discussion topic" 


      it "sends content item json for a file" 


      it "sends content item json for a quiz" 


      it "sends content item json for a module" 


      it "sends content item json for a module item" 


      it "sends content item json for a page" 


      it "sends content item json for selected content" 


      it "returns flash error if invalid id params are passed in" 

    end

    context 'ContentItemSelectionRequest' do
      before :once do
        @tool = new_valid_tool(@course)
        @tool.migration_selection = { message_type: 'ContentItemSelectionRequest' }
        @tool.resource_selection = { message_type: 'ContentItemSelectionRequest' }
        @tool.homework_submission = { message_type: 'ContentItemSelectionRequest' }
        @tool.editor_button = { message_type: 'ContentItemSelectionRequest', icon_url: 'http://example.com/icon.png' }
        @tool.save!

        @course.name = 'a course'
        @course.course_code = 'CS 124'
        @course.save!
      end

      it "generates launch params for a ContentItemSelectionRequest message" 


      it "sets proper return data for migration_selection" 


      it "sets proper return data for resource_selection" 


      it "sets proper return data for collaboration" 


      context "homework submission" do

        it "sets accept_copy_advice to true if submission_type includes online_upload" 


        it "sets accept_copy_advice to false if submission_type does not include online_upload" 


        it "sets proper accept_media_types for homework_submission with extension restrictions" 


        it "sends the ext_content_file_extensions paramter for restriced file types" 


        it "doesn't set the ext_content_file_extensions parameter if online_upload isn't accepted" 


        it "sets the accept_media_types parameter to '*.*'' if online_upload isn't accepted" 


        it "sets the accept_presentation_document_target to window if online_url is a submission type" 


        it "doesn't add none to accept_presentation_document_target if online_upload isn't a submission_type" 


        it "sets the mime type to */* if there is a online_url submission type" 



      end

      it "sets proper return data for editor_button" 


      it "does not copy query params to POST if disable_lti_post_only feature flag is set" 


      it "does not copy query params to POST if oauth_compliant tool setting is enabled" 

    end
  end

  describe "GET 'retrieve'" do
    let :account do
      Account.default
    end

    let :tool do
      tool = account.context_external_tools.new(
        name: "bob",
        consumer_key: "bob",
        shared_secret: "bob",
        tool_id: 'some_tool',
        privacy_level: 'public'
      )
      tool.url = "http://www.example.com/basic_lti?first=john&last=smith"
      tool.resource_selection = {
        :url => "http://#{HostUrl.default_host}/selection_test",
        :selection_width => 400,
        :selection_height => 400}
      tool.save!
      tool
    end

    it "should require authentication" 


    it "should find tools matching by exact url" 


    it "should find tools matching by domain" 


    it "should redirect if no matching tools are found" 


    it "should return a variable expansion for a collaboration" 


    it "should remove query params when post_only is set" 


    it "should not remove query params when post_only is not set" 


    it "adds params from secure_params" 


    context 'collaborations' do
      let(:collab) do
        collab = ExternalToolCollaboration.new(
          title: "my collab",
          user: @teacher,
          url: 'http://www.example.com'
        )
        collab.context = @course
        collab.save!
        collab
      end

      it "lets you specify the selection_type" 


      it "creates a content-item return url with an id" 


      it "sets the auto_create param to true" 


      it "sets the accept_unsigned param to false" 


      it "adds a data element with a jwt that contains the id if a content_item_id param is present " 


      it "adds a data element with a jwt that contains the consumer_key if a content_item_id param is present " 


      it 'adds to the data element the default launch url' 

    end
  end

  describe "GET 'resource_selection'" do
    it "should require authentication" 


    it "should be accessible by students" 


    it "should redirect if no matching tools are found" 


    it "should find a valid tool if one exists" 


    it "should set html selection if specified" 


    it "should find account-level tools" 


    it "should be accessible even after course is soft-concluded" 


    it "should be accessible even after course is hard-concluded" 


    it "should be accessible even after enrollment is concluded and include a parameter indicating inactive state" 

  end

  describe "POST 'create'" do
    let(:launch_url) { 'https://www.tool.com/launch' }
      let(:consumer_key) { 'key' }
      let(:shared_secret) { 'seekret' }
      let(:xml) do
        <<-XML
          <?xml version="1.0" encoding="UTF-8"?>
          <cartridge_basiclti_link xmlns="http://www.imsglobal.org/xsd/imslticc_v1p0" xmlns:blti="http://www.imsglobal.org/xsd/imsbasiclti_v1p0" xmlns:lticm="http://www.imsglobal.org/xsd/imslticm_v1p0" xmlns:lticp="http://www.imsglobal.org/xsd/imslticp_v1p0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.imsglobal.org/xsd/imslticc_v1p0 http://www.imsglobal.org/xsd/lti/ltiv1p0/imslticc_v1p0.xsd http://www.imsglobal.org/xsd/imsbasiclti_v1p0 http://www.imsglobal.org/xsd/lti/ltiv1p0/imsbasiclti_v1p0p1.xsd http://www.imsglobal.org/xsd/imslticm_v1p0 http://www.imsglobal.org/xsd/lti/ltiv1p0/imslticm_v1p0.xsd http://www.imsglobal.org/xsd/imslticp_v1p0 http://www.imsglobal.org/xsd/lti/ltiv1p0/imslticp_v1p0.xsd">
            <blti:title>Example Tool Provider</blti:title>
            <blti:description>This is a Sample Tool Provider.</blti:description>
            <blti:launch_url>https://www.tool.com/launch</blti:launch_url>
            <blti:extensions platform="canvas.instructure.com">
            </blti:extensions>
          </cartridge_basiclti_link>
        XML
      end
      let(:xml_response) { OpenStruct.new({body: xml}) }

    describe 'developer key id' do
      subject { ContextExternalTool.find(JSON.parse(response.body)['id']).developer_key_id }

      let_once(:user) { account_admin_user(account: account) }
      let_once(:account) { account_model }
      let(:params) do
        {
          account_id: account.id,
          external_tool: {
            name: 'tool name',
            consumer_key: consumer_key,
            shared_secret: shared_secret,
            config_type: 'by_xml',
            config_xml: xml,
            developer_key_id: developer_key.id
          }
        }
      end

      before do
        user_session(user)
        post 'create', params: params, format: 'json'
      end

      context 'when the current user has rights' do
        let(:developer_key) { DeveloperKey.create!(account: account) }

        it { is_expected.to eq developer_key.id }
      end

      context 'when the current user does not have rights' do
        let(:developer_key) { DeveloperKey.create!(account: account) }
        let(:user) { account_admin_user(account: account_model) }

        it 'sets the develoepr key id' 

      end

      context 'when the developer key account does not match' do
        let(:developer_key) { DeveloperKey.create! }

        it { is_expected.to be_nil }
      end
    end

    context 'tool duplication' do
      shared_examples_for 'detects duplication in context' do
        let(:params) { raise "Override in specs" }

        before do
          allow_any_instance_of(Net::HTTP).to receive(:request).and_return(xml_response)
          ContextExternalTool.create!(
            context: @course,
            name: 'first tool',
            url: launch_url,
            consumer_key: consumer_key,
            shared_secret: shared_secret,
          )
        end

        it 'responds with bad request if tool is a duplicate and "verify_uniqueness" is true' 


        it 'gives error message in response if duplicate tool and "verify_uniqueness" is true' 

      end

      context 'create manually' do
        it_behaves_like 'detects duplication in context' do
          let(:params) do
            {
              course_id: @course.id,
              external_tool: {
                name: 'tool name',
                url: launch_url,
                consumer_key: consumer_key,
                shared_secret: shared_secret,
                verify_uniqueness: 'true'
              }
            }
          end
        end
      end

      context 'create via XML' do
        it_behaves_like 'detects duplication in context' do
          let(:params) do
            {
              course_id: @course.id,
              external_tool: {
                name: 'tool name',
                consumer_key: consumer_key,
                shared_secret: shared_secret,
                verify_uniqueness: 'true',
                config_type: 'by_xml',
                config_xml: xml
              }
            }
          end
        end
      end

      context 'create via URL' do
        it_behaves_like 'detects duplication in context' do
          let(:params) do
            {
              course_id: @course.id,
              external_tool: {
                name: 'tool name',
                consumer_key: consumer_key,
                shared_secret: shared_secret,
                verify_uniqueness: 'true',
                config_type: 'by_url',
                config_url: 'http://config.example.com'
              }
            }
          end
        end
      end
    end

    it "should require authentication" 


    it "should not create tool if user lacks create_tool_manually" 


    it "should create tool if user is granted create_tool_manually" 


    it "should accept basic configurations" 


    it "sets the oauth_compliant setting" 


    it "should fail on basic xml with no url or domain set" 


    it "should handle advanced xml configurations" 


    it "should handle advanced xml configurations with no url or domain set" 


    it "should handle advanced xml configurations by URL retrieval" 


    it "should fail gracefully on invalid URL retrieval or timeouts" 


    context "navigation tabs caching" do
      it "shouldn't clear the navigation tabs cache for non navigtaion tools" 


      it 'should clear the navigation tabs cache for course nav' 


      it 'should clear the navigation tabs cache for account nav' 


      it 'should clear the navigation tabs cache for user nav' 

    end

  end

  describe "PUT 'update'" do
    it 'updates tool with tool_configuration[prefer_sis_email] param' 


    it 'updates allow_membership_service_access if the feature flag is set' 


    it 'does not update allow_membership_service_access if the feature flag is not set' 

  end

  describe "'GET 'generate_sessionless_launch'" do
    before do
      allow(BasicLTI::Sourcedid).to receive(:encryption_secret) {'encryption-secret-5T14NjaTbcYjc4'}
      allow(BasicLTI::Sourcedid).to receive(:signing_secret) {'signing-secret-vp04BNqApwdwUYPUI'}
      user_session(@user)
    end

    it "generates a sessionless launch" 


    it "strips query param from launch_url before signing, attaches to post body, and removes query params in url for launch" 


    it "generates a sessionless launch for an external tool assignment" 


    it 'passes whitelisted `platform` query param to lti launch body' 


    it "requires context_module_id for module_item launch type" 


    it "Sets the correct resource_link_id for module items when module_item_id is provided" 


    it 'makes the module item available for variable expansions' 


    it 'redirects if there is no matching tool for the launch_url, and tool id' 


    it 'redirects if there is no matching tool for the and tool id' 


    it 'redirects if there is no launch url associated with the tool' 


  end

  describe 'lti 1.3' do
    let_once(:account) { Account.default }
    let_once(:sub_account) { account_model(root_account: account) }
    let_once(:course) { course_model account: sub_account }
    let_once(:admin) { account_admin_user(account: account) }
    let_once(:student) do
      student_in_course
      @student
    end
    let(:developer_key) { DeveloperKey.create!(account: account) }
    let(:tool_configuration) do
      Lti::ToolConfiguration.create!(
        developer_key: developer_key,
        settings: settings
      )
    end
    let(:settings) do
      {
        'title' => 'LTI 1.3 Tool',
        'description' => '1.3 Tool',
        'launch_url' => 'http://lti13testtool.docker/blti_launch',
        'custom_fields' => {'has_expansion' => '$Canvas.user.id', 'no_expansion' => 'foo'},
        'public_jwk' => {
          "kty" => "RSA",
          "e" => "AQAB",
          "n" => "2YGluUtCi62Ww_TWB38OE6wTaN...",
          "kid" => "2018-09-18T21:55:18Z",
          "alg" => "RS256",
          "use" => "sig"
        },
        'extensions' =>  [
          {
            'platform' => 'canvas.instructure.com',
            'privacy_level' => 'public',
            'tool_id' => 'LTI 1.3 Test Tool',
            'domain' => 'http://lti13testtool.docker',
            'settings' =>  {
              'icon_url' => 'https://static.thenounproject.com/png/131630-200.png',
              'selection_height' => 500,
              'selection_width' => 500,
              'text' => 'LTI 1.3 Test Tool Extension text',
              'course_navigation' =>  {
                'message_type' => 'LtiResourceLinkRequest',
                'canvas_icon_class' => 'icon-lti',
                'icon_url' => 'https://static.thenounproject.com/png/131630-211.png',
                'text' => 'LTI 1.3 Test Tool Course Navigation',
                'url' =>
                'http://lti13testtool.docker/launch?placement=course_navigation',
                'enabled' => true
              }
            }
          }
        ]
      }
    end
    let(:dev_key_id) { developer_key.id }

    before do
      user_session(admin)
      tool_configuration
    end

    shared_examples_for 'basic devkey behavior' do
      context 'when the user is an admin' do
        it { is_expected.to have_http_status :success }
      end

      context 'when the user is not an admin' do
        before { user_session(student) }

        it { is_expected.to be_unauthorized }
      end

      context 'when the developer key does not exist' do
        before { developer_key.destroy! }

        it { is_expected.to be_not_found }
      end
    end

    describe '#create_tool_from_tool_config' do
      subject {  post :create_tool_from_tool_config, params: params }

      shared_examples_for 'tool configuration does not exist' do
        let(:tool_configuration) { nil }

        it { is_expected.to be_not_found }
      end

      shared_examples_for 'reuses an exisiting ContextExternalTool' do
        let(:tool_context) { raise 'Override in spec' }
        let(:cet) do
          cet = tool_configuration.new_external_tool(tool_context)
          cet.save!
          cet
        end

        before do
          cet
          subject
        end

        it 'returns the existing tool' 

      end

      shared_examples_for 'a context that can create a tool' do
        let(:create_tool_context) { raise 'Override in spec' }

        it 'creates a ContextExternalTool' 


        it_behaves_like 'reuses an exisiting ContextExternalTool' do
          let(:tool_context) { create_tool_context }
        end
      end

      context 'when an account' do
        let(:params) { { account_id: sub_account.id, developer_key_id: dev_key_id } }

        it_behaves_like 'basic devkey behavior'

        it_behaves_like 'tool configuration does not exist'

        it_behaves_like 'a context that can create a tool' do
          let(:create_tool_context) { sub_account }
        end
      end

      context 'when a course' do
        let(:params) { { course_id: course.id, developer_key_id: dev_key_id } }

        it_behaves_like 'basic devkey behavior'

        it_behaves_like 'tool configuration does not exist'

        it_behaves_like 'a context that can create a tool' do
          let(:create_tool_context) { course }
        end

        it_behaves_like 'reuses an exisiting ContextExternalTool' do
          let(:tool_context) { sub_account }
        end

        it_behaves_like 'reuses an exisiting ContextExternalTool' do
          let(:tool_context) { account }
        end
      end
    end

    context '#delete_tool_from_tool_config' do
      subject {  delete :delete_tool_from_tool_config, params: params, format: 'json' }

      let(:cet) do
        tool = tool_configuration.new_external_tool(create_tool_context)
        tool.save!
        tool
      end

      shared_examples_for 'deletes a tool from dev key' do
        context 'with existing cet' do
          before do
            cet
          end

          it_behaves_like 'basic devkey behavior'

          it 'removes a ContextExternalTool' 


          context 'on double deletion' do
            before do
              delete :delete_tool_from_tool_config, params: params
            end

            it { is_expected.to have_http_status :not_found }
          end
        end

        context 'with no cet' do
          it { is_expected.to have_http_status :not_found }
        end
      end

      context 'when an account' do
        let(:create_tool_context) { account }
        let(:params) { { account_id: account.id, developer_key_id: dev_key_id } }

        it_behaves_like 'deletes a tool from dev key'
      end

      context 'when a subaccount' do
        let(:create_tool_context) { sub_account }
        let(:params) { { account_id: sub_account.id, developer_key_id: dev_key_id } }

        it_behaves_like 'deletes a tool from dev key'
      end

      context 'when a course' do
        let(:create_tool_context) { course }
        let(:params) { { course_id: course.id, developer_key_id: dev_key_id } }

        it_behaves_like 'deletes a tool from dev key'
      end
    end
  end

  def opaque_id(asset)
    if asset.respond_to?('lti_context_id')
      Lti::Asset.global_context_id_for(asset)
    else
      Lti::Asset.context_id_for(asset)
    end
  end

end

