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

require_relative '../spec_helper'
require_relative '../lti_1_3_spec_helper'

RSpec.describe ApplicationController do
  before :each do
    request_double = double(
      host_with_port: "www.example.com",
      host: "www.example.com",
      headers: {},
      format: double(:html? => true),
      user_agent: nil
    )
    allow(controller).to receive(:request).and_return(request_double)
  end

  describe "#google_drive_connection" do
    before :each do
      settings_mock = double()
      allow(settings_mock).to receive(:settings).and_return({})
      allow(Canvas::Plugin).to receive(:find).and_return(settings_mock)
    end

    it "uses @real_current_user first" 


    it "uses @current_user second" 


    it "queries user services if token isn't in the cache" 


    it "uses the session values if no users are set" 

  end

  describe "js_env" do
    before do
      allow(controller).to receive(:api_request?).and_return(false)
    end

    it "should set items" 


    it "should auto-set timezone and locale" 


    it "sets the contextual timezone from the context" 


    it "should allow multiple items" 


    it "should not allow overwriting a key" 


    it "should overwrite a key if told explicitly to do so" 


    it 'gets appropriate settings from the root account' 


    it 'sets LTI_LAUNCH_FRAME_ALLOWANCES' 


    context "sharding" do
      require_relative '../sharding_spec_helper'
      specs_require_sharding

      it "should set the global id for the domain_root_account" 

    end

    it 'matches against weird http_accept headers' 

  end

  describe "clean_return_to" do
    before do
      req = double('request obj', :protocol => 'https://', :host_with_port => 'canvas.example.com')
      allow(controller).to receive(:request).and_return(req)
    end

    it "should build from a simple path" 


    it "should build from a full url" 


    it "should reject disallowed paths" 

  end

  describe "#reject!" do
    it "sets the message and status in the error json" 


    it "defaults status to 'bad_request'" 


    it "accepts numeric status codes" 


    it "accepts symbolic status codes" 

  end

  describe "safe_domain_file_user" do
    before :once do
      @user = User.create!
      @attachment = @user.attachments.new(:filename => 'foo.png')
      @attachment.content_type = 'image/png'
      @attachment.save!
    end

    before :each do
      # safe_domain_file_url wants to use request.protocol
      allow(controller).to receive(:request).and_return(double(:protocol => '', :host_with_port => ''))

      @common_params = { :only_path => true }
    end

    it "should include inline=1 in url by default" 


    it "should include :download=>1 in inline urls for relative contexts" 


    it "should not include :download=>1 in download urls for relative contexts" 


    it "should include download_frd=1 and not include inline=1 in url when specified as for download" 

  end

  describe "get_context" do
    after do
      I18n.localizer = nil
    end

    it "should find user with api_find for api requests" 


    it "should find course section with api_find for api requests" 


    # this test is supposed to represent calling I18n.t before a context is set
    # and still having later localizations that depend on the locale of the
    # context work.
    it "should reset the localizer" 

  end

  context 'require_context' do
    it "properly requires account context" 


    it "properly requires course context" 

  end

  describe 'rescue_action_in_public' do
    context 'sharding' do
      require_relative '../sharding_spec_helper'
      specs_require_sharding

      before do
        @shard2.activate do
          @account = account_model
        end
      end

      it 'should log error reports to the domain_root_accounts shard' 

    end
  end

  describe 'content_tag_redirect' do

    it 'redirects for lti_message_handler' 


    it 'redirects for an assignment' 


    it 'redirects for a quiz' 


    it 'redirects for a discussion topic' 


    it 'redirects for a wikipage' 


    it 'redirects for a rubric' 


    it 'redirects for a question bank' 


    it 'redirects for an attachment' 


    context 'ContextExternalTool' do

      let(:course){ course_model }

      let(:tool) do
        tool = course.context_external_tools.new(
          name: "bob",
          consumer_key: "bob",
          shared_secret: "bob",
          tool_id: 'some_tool',
          privacy_level: 'public'
        )
        tool.url = "http://www.example.com/basic_lti"
        tool.resource_selection = {
          :url => "http://#{HostUrl.default_host}/selection_test",
          :selection_width => 400,
          :selection_height => 400}
        tool.settings[:selection_width] = 500
        tool.settings[:selection_height] = 300
        tool.settings[:custom_fields] = {"test_token"=>"$com.instructure.PostMessageToken"}
        tool.save!
        tool
      end

      let(:content_tag) { ContentTag.create(content: tool, url: tool.url)}

      context 'display type' do
        before do
          allow(controller).to receive(:named_context_url).and_return('wrong_url')
          allow(controller).to receive(:render)
          allow(controller).to receive_messages(js_env:[])
          controller.instance_variable_set(:"@context", course)
          allow(content_tag).to receive(:id).and_return(42)
          allow(controller).to receive(:require_user) { user_model }
          allow(controller).to receive(:lti_launch_params) {{}}
          content_tag.update_attributes!(context: assignment_model)
        end

        context 'display_type == "full_width' do
          before do
            tool.settings[:assignment_selection] = { "display_type" => "full_width" }
            tool.save!
          end

          it 'uses the tool setting display type if the "display" parameter is absent' 


          it 'does not use the assignment lti header' 


          it 'does not display the assignment edit sidebar' 

        end

        it 'gives priority to the "display" parameter' 


        it 'does not raise an error if the display type of the placement is not set' 


        it 'does display the assignment lti header if the display type is not "full_width"' 


        it 'does display the assignment edit sidebar if display type is not "full_width"' 

      end

      context 'lti version' do
        let_once(:user) { user_model }

        before do
          allow(controller).to receive(:named_context_url).and_return('wrong_url')
          allow(controller).to receive(:lti_grade_passback_api_url).and_return('wrong_url')
          allow(controller).to receive(:blti_legacy_grade_passback_api_url).and_return('wrong_url')
          allow(controller).to receive(:lti_turnitin_outcomes_placement_url).and_return('wrong_url')

          allow(controller).to receive(:render)
          allow(controller).to receive_messages(js_env:[])
          controller.instance_variable_set(:"@context", course)
          allow(content_tag).to receive(:id).and_return(42)
          allow(controller).to receive(:require_user) { user_model }
          controller.instance_variable_set(:@current_user, user)
          controller.instance_variable_set(:@domain_root_account, course.account)
          content_tag.update_attributes!(context: assignment_model)
        end

        describe 'LTI 1.3' do
          let_once(:developer_key) do
            d = DeveloperKey.create!
            enable_developer_key_account_binding! d
            d
          end
          let_once(:account) { Account.default }

          include_context 'lti_1_3_spec_helper'

          before do
            tool.developer_key = developer_key
            tool.use_1_3 = true
            tool.save!
          end

          context 'assignments' do
            it 'creates a resource link request when tool is configured to use LTI 1.3' 

          end

          context 'module items' do
            it 'creates a resource link request when tool is configured to use LTI 1.3' 

          end
        end

        it 'creates a basic lti launch request when tool is not configured to use LTI 1.3' 

      end

      it 'returns the full path for the redirect url' 


      it 'sets the resource_link_id correctly' 


      it 'sets the post message token' 


      it 'uses selection_width and selection_height if provided' 


      it 'appends px to tool dimensions only when needed' 

    end

  end

  describe 'external_tools_display_hashes' do
    it 'returns empty array if context is group' 


    it 'returns array of tools if context is not group' 

  end

  describe 'external_tool_display_hash' do
    def tool_settings(setting, include_class=false)
      settings_hash = {
        url: "http://example.com/?#{setting.to_s}",
        icon_url: "http://example.com/icon.png?#{setting.to_s}",
        enabled: true
      }

      settings_hash[:canvas_icon_class] = "icon-#{setting.to_s}" if include_class
      settings_hash
    end

    before :once do
      @course = course_model
      @group = @course.groups.create!(:name => "some group")
      @tool = @course.context_external_tools.new(:name => "bob", :consumer_key => "test", :shared_secret => "secret", :url => "http://example.com")

      @tool_settings = [
        :user_navigation, :course_navigation, :account_navigation, :resource_selection,
        :editor_button, :homework_submission, :migration_selection, :course_home_sub_navigation,
        :course_settings_sub_navigation, :global_navigation,
        :assignment_menu, :file_menu, :discussion_topic_menu, :module_menu, :quiz_menu, :wiki_page_menu,
        :tool_configuration, :link_selection, :assignment_selection, :post_grades
      ]

      @tool_settings.each do |setting|
        @tool.send("#{setting}=", tool_settings(setting))
      end
      @tool.save!
    end

    before :each do
      allow(controller).to receive(:request).and_return(ActionDispatch::TestRequest.create)
      controller.instance_variable_set(:@context, @course)
    end

    it 'returns a hash' 


    it 'all settings are correct' 


    it 'all settings return canvas_icon_class if set' 

  end

  describe 'verify_authenticity_token' do
    before :each do
      # default setup is a protected non-GET non-API session-authenticated request with bogus tokens
      cookies = ActionDispatch::Cookies::CookieJar.new(nil)
      controller.allow_forgery_protection = true
      allow(controller.request).to receive(:cookie_jar).and_return(cookies)
      allow(controller.request).to receive(:get?).and_return(false)
      allow(controller.request).to receive(:head?).and_return(false)
      allow(controller.request).to receive(:path).and_return('/non-api/endpoint')
      controller.instance_variable_set(:@current_user, User.new)
      controller.instance_variable_set(:@pseudonym_session, "session-authenticated")
      controller.params[controller.request_forgery_protection_token] = "bogus"
      controller.request.headers['X-CSRF-Token'] = "bogus"
    end

    it "should raise InvalidAuthenticityToken with invalid tokens" 


    it "should not raise with valid token" 


    it "should still raise on session-authenticated api request with invalid tokens" 


    it "should not raise on token-authenticated api request despite invalid tokens" 

  end
end

describe ApplicationController do
  describe "flash_notices" do
    it 'should return notice text for each type' 


    it 'should wrap html notification text in an object' 

  end

  describe "#ms_office?" do
    it "detects Word 2011 for mac" 

  end

  describe "#get_all_pertinent_contexts" do
    it "doesn't show unpublished courses to students" 



    it "doesn't touch the database if there are no valid courses" 


    it "doesn't touch the database if there are no valid groups" 


    context "sharding" do
      require_relative '../sharding_spec_helper'
      specs_require_sharding

      it "should not asplode with cross-shard groups" 


      it "should not include groups in courses the user doesn't have the ability to view yet" 


      it 'must select all cross-shard courses the user belongs to' 


      it 'must select only the specified cross-shard courses when only_contexts is included' 

    end
  end

  describe '#discard_flash_if_xhr' do
    before do
      flash[:notice] = 'A flash notice'
    end
    subject(:discard) do
      flash.instance_variable_get('@discard')
    end

    it 'sets flash discard if request is xhr' 


    it 'sets flash discard if request format is text/plain' 


    it 'leaves flash as is if conditions are not met' 

  end

  describe '#setup_live_events_context' do
    let(:non_conditional_values) do
      {
        hostname: 'test.host',
        user_agent: 'Rails Testing',
        producer: 'canvas'
      }
    end

    before(:each) do
      Thread.current[:context] = nil
    end

    it 'stringifies the non-strings in the context attributes' 


    context 'when a domain_root_account exists' do
      let(:root_account_attributes) do
        {
          uuid: 'account_uuid1',
          global_id: 'account_global1',
          lti_guid: 'lti1'
        }
      end

      let(:expected_context_attributes) do
        {
          root_account_uuid: 'account_uuid1',
          root_account_id: 'account_global1',
          root_account_lti_guid: 'lti1'
        }.merge(non_conditional_values)
      end

      it 'adds root account values to the LiveEvent context' 

    end

    context 'when a current_user exists' do
      let(:current_user_attributes) do
        {
          global_id: 'user_global_id'
        }
      end

      let(:expected_context_attributes) do
        {
          user_id: 'user_global_id'
        }.merge(non_conditional_values)
      end

      it 'sets the correct attributes on the LiveEvent context' 

    end

    context 'when a real current_user exists' do
      let(:real_current_user_attributes) do
        {
          global_id: 'real_user_global_id'
        }
      end

      let(:expected_context_attributes) do
        {
          real_user_id: 'real_user_global_id'
        }.merge(non_conditional_values)
      end

      it 'sets the correct attributes on the LiveEvent context' 

    end

    context 'when a real current_pseudonym exists' do
      let(:current_pseudonym_attributes) do
        {
          unique_id: 'unique_id',
          global_account_id: 'global_account_id',
          sis_user_id: 'sis_user_id'
        }
      end

      let(:expected_context_attributes) do
        {
          user_login: 'unique_id',
          user_account_id: 'global_account_id',
          user_sis_id: 'sis_user_id'
        }.merge(non_conditional_values)
      end

      it 'sets the correct attributes on the LiveEvent context' 

    end

    context 'when a canvas context exists' do
      let(:canvas_context_attributes) do
        {
          class: Class,
          global_id: 'context_global_id'
        }
      end

      let(:expected_context_attributes) do
        {
          context_type: 'Class',
          context_id: 'context_global_id'
        }.merge(non_conditional_values)
      end

      it 'sets the correct attributes on the LiveEvent context' 

    end

    context 'when a context_membership exists' do
      context 'when the context has a role' do
        it 'sets the correct attributes on the LiveEvent context' 

      end

      context 'when the context has a type' do
        it 'sets the correct attributes on the LiveEvent context' 

      end

      context 'when the context has neither a role or type' do
        it 'sets the correct attributes on the LiveEvent context' 

      end
    end

    context 'when the current thread has a context key' do
      let(:thread_attributes) do
        {
          request_id: 'request_id',
          session_id: 'session_id'
        }
      end

      let(:expected_context_attributes) do
        {
          request_id: 'request_id',
          session_id: 'session_id'
        }.merge(non_conditional_values)
      end

      it 'sets the correct attributes on the LiveEvent context' 

    end
  end
end

describe WikiPagesController do
  describe "set_js_rights" do
    it "should populate js_env with policy rights" 

  end
end

describe CoursesController do
  describe "set_js_wiki_data" do
    before :each do
      course_with_teacher_logged_in :active_all => true
      @course.wiki_pages.create!(:title => 'blah').set_as_front_page!
      @course.reload
      @course.default_view = "wiki"
      @course.show_announcements_on_home_page = true
      @course.home_page_announcement_limit = 5
      @course.save!
    end

    it "should populate js_env with course_home setting" 


    it "should populate js_env with setting for show_announcements flag" 

  end

  describe "set_master_course_js_env_data" do
    before :each do
      Account.default.enable_feature!(:master_courses)
      controller.instance_variable_set(:@domain_root_account, Account.default)
      account_admin_user(:active_all => true)
      controller.instance_variable_set(:@current_user, @user)

      @master_course = course_factory
      @template = MasterCourses::MasterTemplate.set_as_master_course(@course)
      @master_page = @course.wiki_pages.create!(:title => "blah", :body => "bloo")
      @tag = @template.content_tag_for(@master_page)

      @child_course = course_factory
      @template.add_child_course!(@child_course)

      @child_page = @child_course.wiki_pages.create!(:title => "bloo", :body => "bloo", :migration_id => @tag.migration_id)
    end

    it "should populate master-side data (unrestricted)" 


    it "should populate master-side data (restricted)" 


    it "should populate child-side data (unrestricted)" 


    it "should populate child-side data (restricted)" 

  end

  context 'validate_scopes' do
    let(:account) { double() }

    before do
      controller.instance_variable_set(:@domain_root_account, account)
    end

    it 'does not affect session based api requests' 


    it 'does not affect api requests that use an access token with an unscoped developer key' 


    it 'raises AccessTokenScopeError if scopes do not match' 


    context 'with valid scopes on dev key' do
      let(:developer_key) { DeveloperKey.create!(require_scopes: true, scopes: ['url:GET|/api/v1/accounts']) }

      it 'allows adequately scoped requests through' 


      it 'allows HEAD requests' 


      it 'strips includes for adequately scoped requests' 

    end
  end
end

RSpec.describe ApplicationController, '#render_unauthorized_action' do
  controller do
    def index
      render_unauthorized_action
    end
  end

  before :once do
    @teacher = course_with_teacher(active_all: true).user
  end

  before do
    user_session(@teacher)
    get :index, format: format
  end

  describe 'pdf format' do
    let(:format) { :pdf }

    specify { expect(response.headers.fetch('Content-Type')).to match(/\Atext\/html/) }
    specify { expect(response).to have_http_status :unauthorized }
    specify { expect(response).to render_template('shared/unauthorized') }
  end

  describe 'html format' do
    let(:format) { :html }

    specify { expect(response.headers.fetch('Content-Type')).to match(/\Atext\/html/) }
    specify { expect(response).to have_http_status :unauthorized }
    specify { expect(response).to render_template('shared/unauthorized') }
  end

  describe 'json format' do
    let(:format) { :json }

    specify { expect(response.headers['Content-Type']).to match(/\Aapplication\/json/) }
    specify { expect(response).to have_http_status :unauthorized }
    specify { expect(json_parse.fetch('status')).to eq 'unauthorized' }
  end
end

RSpec.describe ApplicationController, '#redirect_to_login' do
  controller do
    def index
      redirect_to_login
    end
  end

  before do
    get :index, format: format
  end

  context 'given an unauthenticated json request' do
    let(:format) { :json }

    specify { expect(response).to have_http_status :unauthorized }
    specify { expect(json_parse.fetch('status')).to eq 'unauthenticated' }
  end

  shared_examples 'redirectable to html login page' do
    specify { expect(flash[:warning]).to eq 'You must be logged in to access this page' }
    specify { expect(session[:return_to]).to eq controller.clean_return_to(request.fullpath) }
    specify { expect(response).to redirect_to login_url }
    specify { expect(response).to have_http_status :found }
    specify { expect(response.location).to eq login_url }
  end

  context 'given an unauthenticated html request' do
    it_behaves_like 'redirectable to html login page' do
      let(:format) { :html }
    end
  end

  context 'given an unauthenticated pdf request' do
    it_behaves_like 'redirectable to html login page' do
      let(:format) { :pdf }
    end
  end
end

