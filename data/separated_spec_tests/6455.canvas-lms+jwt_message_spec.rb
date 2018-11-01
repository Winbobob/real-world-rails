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

require File.expand_path(File.dirname(__FILE__) + '/../../../lti_1_3_spec_helper')

describe Lti::Messages::JwtMessage do
  include_context 'lti_1_3_spec_helper'

  let(:return_url) { 'http://www.platform.com/return_url' }
  let(:user) { @student }
  let(:opts) { { resource_type: 'course_navigation' } }

  let(:expander) do
    Lti::VariableExpander.new(
      course.root_account,
      course,
      nil,
      {
        current_user: user,
        tool: tool
      }
    )
  end

  let(:jwt_message) do
    Lti::Messages::JwtMessage.new(
      tool: tool,
      context: course,
      user: user,
      expander: expander,
      return_url: return_url,
      opts: opts
    )
  end

  let(:decoded_jwt) do
    jws = jwt_message.generate_post_payload
    JSON::JWT.decode(jws[:id_token], pub_key)
  end

  let(:pub_key) do
    jwk = JSON::JWK.new(Lti::KeyStorage.retrieve_keys['jwk-present.json'])
    jwk.to_key.public_key
  end

  let_once(:course) do
    course_with_student
    @course
  end

  let_once(:assignment) { assignment_model(course: course) }
  let_once(:tool) do
    tool = course.context_external_tools.new(
      name: 'bob',
      consumer_key: 'key',
      shared_secret: 'secret',
      url: 'http://www.example.com/basic_lti',
      developer_key: developer_key
    )
    tool.course_navigation = {
      enabled: true,
      message_type: 'ResourceLinkRequest',
      selection_width: '500',
      selection_height: '400',
      custom_fields: {
        has_expansion: '$User.id',
        no_expansion: 'foo'
      }
    }
    tool.use_1_3 = true
    tool.save!
    tool
  end
  let_once(:developer_key) { DeveloperKey.create! }

  describe 'signing' do
    it 'signs the id token with the current canvas private key' 

  end

  describe 'security claims' do
    it 'sets the "aud" claim' 


    it 'sets the "deployment_id" claim' 


    it 'sets the "exp" claim to lti.oauth2.access_token.exp' 


    it 'sets the "iat" claim to the current time' 


    it 'sets the "iss" to "https://canvas.instructure.com"' 


    it 'sets the "nonce" claim to a unique ID' 


    it 'sets the "sub" claim' 


    context 'when security claim group disabled' do
      let(:opts) { super().merge({claim_group_blacklist: [:security]}) }

      it 'does not set the "aud" claim' 


      it 'does not set the "deployment_id" claim' 


      it 'does not set the "exp" claim' 


      it 'does not set the "iat" claim' 


      it 'does not set the "iss" claim' 


      it 'does not set the "nonce" claim' 


      it 'does not set the "sub" claim' 

    end
  end

  describe 'i18n claims' do
    it 'sets the locale' 


    context 'when i18n claim group disabled' do
      let(:opts) { super().merge({claim_group_blacklist: [:i18n]}) }

      it 'does not set the "locale" claim' 

    end
  end

  describe 'context claims' do
    let(:message_context) { decoded_jwt['https://purl.imsglobal.org/spec/lti/claim/context'] }

    it 'sets the id' 


    it 'sets the label' 


    it 'sets the title' 


    it 'sets the type' 


    context 'when context claim group disabled' do
      let(:opts) { super().merge({claim_group_blacklist: [:context]}) }

      it 'does not set the context claim' 

    end
  end

  describe 'platform' do
    let(:message_platform) { decoded_jwt['https://purl.imsglobal.org/spec/lti/claim/tool_platform'] }

    it 'sets the name' 


    it 'sets the version' 


    it 'sets the product family code' 


    it 'sets the guid' 


    context 'when platform claim group disabled' do
      let(:opts) { super().merge({claim_group_blacklist: [:tool_platform]}) }

      it 'does not set the platform claim' 

    end
  end

  describe 'launch presentation' do
    let(:message_launch_presentation) { decoded_jwt['https://purl.imsglobal.org/spec/lti/claim/launch_presentation'] }

    it 'sets the document target' 


    it 'sets the height' 


    it 'sets the width' 


    it 'sets the return url' 


    it 'sets the locale' 


    context 'when launch presentation claim group disabled' do
      let(:opts) { super().merge({claim_group_blacklist: [:launch_presentation]}) }

      it 'does not set the launch presentation claim' 

    end
  end

  describe 'names and roles' do
    shared_examples 'names and roles claim check' do
      it 'sets the NRPS url' 


      it 'sets the NRPS version' 

    end

    let(:nrps_tool) do
      tool = course.context_external_tools.new(
        name: 'bob',
        consumer_key: 'key',
        shared_secret: 'secret',
        url: 'http://www.example.com/basic_lti',
        developer_key: nrps_developer_key
      )
      tool.use_1_3 = true
      tool.save!
      tool
    end
    let(:ags_scopes) { ['https://purl.imsglobal.org/spec/lti-ags/scope/lineitem', 'https://purl.imsglobal.org/spec/lti-ags/scope/result.readonly'] }
    let(:nrps_scopes) { ['https://purl.imsglobal.org/spec/lti-nrps/scope/contextmembership.readonly'] }
    let(:nrps_developer_key_scopes) { ags_scopes + nrps_scopes }
    let(:nrps_developer_key) do
      DeveloperKey.create!(
        name: 'Developer Key With Scopes',
        account: course.root_account,
        scopes: nrps_developer_key_scopes,
        require_scopes: true
      )
    end
    let(:jwt_message) do
      Lti::Messages::JwtMessage.new(
        tool: nrps_tool,
        context: course,
        user: user,
        expander: expander,
        return_url: return_url,
        opts: opts
      )
    end
    let(:message_names_and_roles_service) { decoded_jwt['https://purl.imsglobal.org/spec/lti-nrps/claim/namesroleservice'] }

    # All this setup just so we can stub out controller.polymorphic_url
    let(:request) do
      request = double('request')
      allow(request).to receive(:url).and_return('https://localhost')
      allow(request).to receive(:host).and_return('/my/url')
      allow(request).to receive(:scheme).and_return('https')
      request
    end

    let(:controller) do
      controller = double('controller')
      allow(controller).to receive(:polymorphic_url).and_return('polymorphic_url')
      allow(controller).to receive(:request).and_return(request)
      controller
    end

    # override b/c all the rest of the tests fail if a Controller is injected into the 'top-level' expander def
    let(:expander) do
      Lti::VariableExpander.new(
        course.root_account,
        course,
        controller,
        {
          current_user: user,
          tool: nrps_tool
        }
      )
    end

    before(:each) do
      course.root_account.enable_feature!(:lti_1_3)
      course.root_account.save!
    end

    context 'when context is a course' do
      it_behaves_like 'names and roles claim check'
    end

    context 'when context is an account' do
      let(:account_jwt_message) do
        Lti::Messages::JwtMessage.new(
          tool: nrps_tool,
          context: course.root_account,
          user: user,
          expander: expander,
          return_url: return_url,
          opts: opts
        )
      end

      let(:decoded_jwt) do
        jws = account_jwt_message.generate_post_payload
        JSON::JWT.decode(jws[:id_token], pub_key)
      end

      it 'does not set the NRPS claim' 

    end

    context 'when context is a group' do

      let_once(:group_record) { group(context: course) } # _record suffix to avoid conflict with group() factory mtd

      let(:jwt_message) do
        Lti::Messages::JwtMessage.new(
          tool: nrps_tool,
          context: group_record,
          user: user,
          expander: expander,
          return_url: return_url,
          opts: opts
        )
      end

      it_behaves_like 'names and roles claim check'
    end

    context 'when names and roles claim group disabled' do
      let(:opts) { super().merge({claim_group_blacklist: [:names_and_roles_service]}) }

      it 'does not set the NRPS claim' 

    end

    context 'when names and roles scope missing from developer key' do
      let(:nrps_developer_key_scopes) { ags_scopes }

      it 'does not set the NRPS claim' 

    end
  end

  describe 'custom parameters' do
    let(:message_custom) { decoded_jwt['https://purl.imsglobal.org/spec/lti/claim/custom'] }

    it 'adds custom parameters in the root settings' 


    it 'adds placement-specific custom parameters' 


    it 'expands variable expansions' 


    context 'when custom parameters claim group disabled' do
      let(:opts) { super().merge({claim_group_blacklist: [:custom_params]}) }

      it 'does not set the custom parameters claim' 

    end
  end

  describe 'roles claims' do
    shared_examples 'sets roles claim' do
      it 'sets the roles' 

    end

    shared_examples 'skips roles claim' do
      it 'does not set the roles claim' 

    end

    shared_examples 'sets Canvas roles extension' do
      it 'adds the Canvas roles extension' 

    end

    shared_examples 'skips Canvas roles extension' do
      it 'does not set the Canvas roles extension' 

    end

    shared_examples 'sets Canvas enrollment state extension' do
      it 'adds the Canvas enrollment state extension' 

    end

    shared_examples 'skips Canvas enrollment state extension' do
      it 'does not set the Canvas enrollment state extension' 

    end

    it_behaves_like 'sets roles claim'
    it_behaves_like 'sets Canvas roles extension'
    it_behaves_like 'sets Canvas enrollment state extension'

    context 'when roles claim group disabled' do
      let(:opts) { super().merge({claim_group_blacklist: [:roles]}) }

      it_behaves_like 'skips roles claim'
      it_behaves_like 'skips Canvas roles extension'
      it_behaves_like 'skips Canvas enrollment state extension'
    end

    describe 'when Canvas roles extension disabled' do
      let(:opts) { super().merge({extension_blacklist: [:roles]}) }

      it_behaves_like 'sets roles claim'
      it_behaves_like 'skips Canvas roles extension'
      it_behaves_like 'sets Canvas enrollment state extension'
    end

    describe 'when Canvas enrollment state extension disabled' do
      let(:opts) { super().merge({extension_blacklist: [:canvas_enrollment_state]}) }

      it_behaves_like 'sets roles claim'
      it_behaves_like 'sets Canvas roles extension'
      it_behaves_like 'skips Canvas enrollment state extension'
    end

  end

  describe 'include name claims' do

    before do
      course
      tool.update!(workflow_state: 'name_only')
    end

    it 'adds the name' 


    it 'adds the given name' 


    it 'adds the family name' 


    it 'adds the person sourcedid' 


    it 'adds the coures offering sourcedid' 


    shared_examples 'does not set name claim group' do
      it 'does not set the name claim' 


      it 'does not set the given name claim' 


      it 'does not set the family name claim' 


      it 'does not set the lis claim' 

    end

    context 'when name claim group disabled' do
      let(:opts) { super().merge({claim_group_blacklist: [:name]}) }

      it_behaves_like 'does not set name claim group'
    end

    context 'when tool privacy policy does not allow name release' do
      before { tool.update!(workflow_state: 'anonymous') }

      it_behaves_like 'does not set name claim group'
    end
  end

  describe 'include email claims' do
    before { tool.update!(workflow_state: 'email_only') }

    it 'adds the user email' 


    shared_examples 'does not set email claims' do
      it 'does not set the email claim' 

    end

    context 'when email claim group disabled' do
      let(:opts) { super().merge({claim_group_blacklist: [:email]}) }

      it_behaves_like 'does not set email claims'
    end

    context 'when tool privacy policy does not allow email release' do
      before { tool.update!(workflow_state: 'anonymous') }

      it_behaves_like 'does not set email claims'
    end
  end

  describe 'public claims' do
    before { tool.update!(workflow_state: 'public') }

    shared_examples 'sets picture' do
      it 'adds the user picture' 

    end

    shared_examples 'skips picture' do
      it 'does not add the user picture' 

    end

    shared_examples 'sets canvas course id extension' do
      it 'adds the canvas course id extension' 

    end

    shared_examples 'skips canvas course id extension' do
      it 'does not add the canvas course id extension' 

    end

    shared_examples 'sets canvas workflow state extension' do
      it 'adds the canvas workflow state' 

    end

    shared_examples 'skips canvas workflow state extension' do
      it 'does not add the canvas workflow state' 

    end

    shared_examples 'sets course section sourcedId extension' do
      it 'adds the course section sourcedId' 

    end

    shared_examples 'skips course section sourcedId extension' do
      it 'does not add the course section sourcedId' 

    end

    shared_examples 'sets the canvas account id extension' do
      it 'adds the canvas account id' 

    end

    shared_examples 'skips the canvas account id extension' do
      it 'does not add the canvas account id' 

    end

    shared_examples 'sets the canvas account sis id' do
      it 'adds the canvas account sis id' 

    end

    shared_examples 'skips the canvas account sis id' do
      it 'does not add the canvas account sis id' 

    end

    shared_context 'when context is an account' do
      let(:account_jwt_message) do
        Lti::Messages::JwtMessage.new(
          tool: tool,
          context: course.root_account,
          user: user,
          expander: expander,
          return_url: return_url,
          opts: opts
        )
      end

      let(:account_jwt) do
        jws = account_jwt_message.generate_post_payload
        JSON::JWT.decode(jws[:id_token], pub_key)
      end
    end

    it_behaves_like 'sets picture'

    context 'extensions' do
      context 'when context is a course' do
        it_behaves_like 'sets canvas course id extension'
        it_behaves_like 'sets canvas workflow state extension'
        it_behaves_like 'sets course section sourcedId extension'
      end

      it_behaves_like 'when context is an account' do
        it_behaves_like 'sets the canvas account id extension'
        it_behaves_like 'sets the canvas account sis id'
      end
    end

    shared_examples 'does not set public claims group' do
      it_behaves_like 'skips picture'

      context 'extensions' do
        context 'when context is a course' do
          it_behaves_like 'skips canvas course id extension'
          it_behaves_like 'skips canvas workflow state extension'
          it_behaves_like 'skips course section sourcedId extension'
        end

        it_behaves_like 'when context is an account' do
          it_behaves_like 'skips the canvas account id extension'
          it_behaves_like 'skips the canvas account sis id'
        end
      end
    end

    context 'when public claim group disabled' do
      let(:opts) { super().merge({claim_group_blacklist: [:public]}) }

      it_behaves_like 'does not set public claims group'
    end

    context 'when tool privacy policy does not allow public claim release' do
      before { tool.update!(workflow_state: 'name_only') }

      it_behaves_like 'does not set public claims group'
    end

    context 'when canvas course id extension disabled' do
      let(:opts) { super().merge({extension_blacklist: [:canvas_course_id]}) }

      it_behaves_like 'sets picture'

      context 'extensions' do
        context 'when context is a course' do
          it_behaves_like 'skips canvas course id extension'
          it_behaves_like 'sets canvas workflow state extension'
          it_behaves_like 'sets course section sourcedId extension'
        end

        it_behaves_like 'when context is an account' do
          it_behaves_like 'sets the canvas account id extension'
          it_behaves_like 'sets the canvas account sis id'
        end
      end
    end

    context 'when canvas workflow state extension disabled' do
      let(:opts) { super().merge({extension_blacklist: [:canvas_workflow_state]}) }

      it_behaves_like 'sets picture'

      context 'extensions' do
        context 'when context is a course' do
          it_behaves_like 'sets canvas course id extension'
          it_behaves_like 'skips canvas workflow state extension'
          it_behaves_like 'sets course section sourcedId extension'
        end

        it_behaves_like 'when context is an account' do
          it_behaves_like 'sets the canvas account id extension'
          it_behaves_like 'sets the canvas account sis id'
        end
      end
    end

    context 'when course section sourcedId extension disabled' do
      let(:opts) { super().merge({extension_blacklist: [:lis_course_offering_sourcedid]}) }

      it_behaves_like 'sets picture'

      context 'extensions' do
        context 'when context is a course' do
          it_behaves_like 'sets canvas course id extension'
          it_behaves_like 'sets canvas workflow state extension'
          it_behaves_like 'skips course section sourcedId extension'
        end

        it_behaves_like 'when context is an account' do
          it_behaves_like 'sets the canvas account id extension'
          it_behaves_like 'sets the canvas account sis id'
        end
      end
    end

    context 'when canvas account id extension disabled' do
      let(:opts) { super().merge({extension_blacklist: [:canvas_account_id]}) }

      it_behaves_like 'sets picture'

      context 'extensions' do
        context 'when context is a course' do
          it_behaves_like 'sets canvas course id extension'
          it_behaves_like 'sets canvas workflow state extension'
          it_behaves_like 'sets course section sourcedId extension'
        end

        it_behaves_like 'when context is an account' do
          it_behaves_like 'skips the canvas account id extension'
          it_behaves_like 'sets the canvas account sis id'
        end
      end
    end

    context 'when canvas account sis id extension disabled' do
      let(:opts) { super().merge({extension_blacklist: [:canvas_account_sis_id]}) }

      it_behaves_like 'sets picture'

      context 'extensions' do
        context 'when context is a course' do
          it_behaves_like 'sets canvas course id extension'
          it_behaves_like 'sets canvas workflow state extension'
          it_behaves_like 'sets course section sourcedId extension'
        end

        it_behaves_like 'when context is an account' do
          it_behaves_like 'sets the canvas account id extension'
          it_behaves_like 'skips the canvas account sis id'
        end
      end
    end
  end

  describe 'mentorship claims' do
    before { tool.update!(workflow_state: 'public') }

    shared_examples 'sets role scope mentor' do
      it 'adds role scope mentor' 

    end

    shared_examples 'skips role scope mentor' do
      it 'does not add role scope mentor' 

    end

    it_behaves_like 'sets role scope mentor'

    context 'when mentorship claim group disabled' do
      let(:opts) { super().merge({claim_group_blacklist: [:mentorship]}) }

      it_behaves_like 'skips role scope mentor'
    end

    context 'when tool privacy policy does not allow mentorship claim release' do
      before { tool.update!(workflow_state: 'name_only') }

      it_behaves_like 'skips role scope mentor'
    end
  end

  describe 'resource claims' do
    shared_examples 'sets selection directive extension' do |directive|
      it 'adds selection directive' 

    end

    shared_examples 'skips selection directive extension' do
      it 'does not add selection directive' 

    end

    shared_examples 'sets content intended use extension' do |use|
      it 'adds content intended use' 

    end

    shared_examples 'skips content intended use extension' do
      it 'does not add content intended use' 

    end

    shared_examples 'sets content return types extension' do |types|
      it 'adds content return types' 

    end

    shared_examples 'skips content return types extension' do
      it 'does not add content return types' 

    end

    shared_examples 'sets content return url extension' do
      it 'adds content return url' 

    end

    shared_examples 'skips content return url extension' do
      it 'does not add content return url' 

    end

    shared_examples 'resource group 1 check' do |directive, use, types|
      it_behaves_like 'sets selection directive extension', directive
      it_behaves_like 'sets content intended use extension', use
      it_behaves_like 'sets content return types extension', types
      it_behaves_like 'sets content return url extension'

      context 'when resource claim group disabled' do
        let(:opts) { super().merge({claim_group_blacklist: [:resource]}) }

        it_behaves_like 'skips selection directive extension'
        it_behaves_like 'skips content intended use extension'
        it_behaves_like 'skips content return types extension'
        it_behaves_like 'skips content return url extension'
      end

      context 'when selection directive extension disabled' do
        let(:opts) { super().merge({extension_blacklist: [:selection_directive]}) }

        it_behaves_like 'skips selection directive extension'
        it_behaves_like 'sets content intended use extension', use
        it_behaves_like 'sets content return types extension', types
        it_behaves_like 'sets content return url extension'
      end

      context 'when content intended use extension disabled' do
        let(:opts) { super().merge({extension_blacklist: [:content_intended_use]}) }

        it_behaves_like 'sets selection directive extension', directive
        it_behaves_like 'skips content intended use extension'
        it_behaves_like 'sets content return types extension', types
        it_behaves_like 'sets content return url extension'
      end

      context 'when content return types extension disabled' do
        let(:opts) { super().merge({extension_blacklist: [:content_return_types]}) }

        it_behaves_like 'sets selection directive extension', directive
        it_behaves_like 'sets content intended use extension', use
        it_behaves_like 'skips content return types extension'
        it_behaves_like 'sets content return url extension'
      end

      context 'when content return url extension disabled' do
        let(:opts) { super().merge({extension_blacklist: [:content_return_url]}) }

        it_behaves_like 'sets selection directive extension', directive
        it_behaves_like 'sets content intended use extension', use
        it_behaves_like 'sets content return types extension', types
        it_behaves_like 'skips content return url extension'
      end
    end

    context 'editor button' do
      before { opts[:resource_type] = 'editor_button' }

      it_behaves_like 'resource group 1 check', 'embed_content', 'embed', 'oembed,lti_launch_url,url,image_url,iframe'
    end

    context 'resource selection' do
      before { opts[:resource_type] = 'resource_selection' }

      it_behaves_like 'resource group 1 check', 'select_link', 'navigation', 'lti_launch_url'
    end

    context 'homework submission' do
      before { opts[:resource_type] = 'homework_submission' }

      it_behaves_like 'sets content intended use extension', 'homework'
      it_behaves_like 'sets content return url extension'

      context 'when resource claim group disabled' do
        let(:opts) { super().merge({claim_group_blacklist: [:resource]}) }

        it_behaves_like 'skips content intended use extension'
        it_behaves_like 'skips content return url extension'
      end

      context 'when content intended use extension disabled' do
        let(:opts) { super().merge({extension_blacklist: [:content_intended_use]}) }

        it_behaves_like 'skips content intended use extension'
        it_behaves_like 'sets content return url extension'
      end

      context 'when content return url extension disabled' do
        let(:opts) { super().merge({extension_blacklist: [:content_return_url]}) }

        it_behaves_like 'sets content intended use extension', 'homework'
        it_behaves_like 'skips content return url extension'
      end
    end

    context 'migration selection' do
      shared_examples 'sets content file extensions extension' do
        it 'adds content file extensions' 

      end

      shared_examples 'skips content file extensions extension' do
        it 'does not add content file extensions' 

      end

      before { opts[:resource_type] = 'migration_selection' }

      it_behaves_like 'sets content file extensions extension'
      it_behaves_like 'sets content intended use extension', 'content_package'
      it_behaves_like 'sets content return types extension', 'file'
      it_behaves_like 'sets content return url extension'

      context 'when resource claim group disabled' do
        let(:opts) { super().merge({claim_group_blacklist: [:resource]}) }

        it_behaves_like 'skips content file extensions extension'
        it_behaves_like 'skips content intended use extension'
        it_behaves_like 'skips content return types extension'
        it_behaves_like 'skips content return url extension'
      end

      context 'when content file extensions extension disabled' do
        let(:opts) { super().merge({extension_blacklist: [:content_file_extensions]}) }

        it_behaves_like 'skips content file extensions extension'
        it_behaves_like 'sets content intended use extension', 'content_package'
        it_behaves_like 'sets content return types extension', 'file'
        it_behaves_like 'sets content return url extension'
      end

      context 'when content intended use extension disabled' do
        let(:opts) { super().merge({extension_blacklist: [:content_intended_use]}) }

        it_behaves_like 'sets content file extensions extension'
        it_behaves_like 'skips content intended use extension'
        it_behaves_like 'sets content return types extension', 'file'
        it_behaves_like 'sets content return url extension'
      end

      context 'when content return types extension disabled' do
        let(:opts) { super().merge({extension_blacklist: [:content_return_types]}) }

        it_behaves_like 'sets content file extensions extension'
        it_behaves_like 'sets content intended use extension', 'content_package'
        it_behaves_like 'skips content return types extension'
        it_behaves_like 'sets content return url extension'
      end

      context 'when content return url extension disabled' do
        let(:opts) { super().merge({extension_blacklist: [:content_return_url]}) }

        it_behaves_like 'sets content file extensions extension'
        it_behaves_like 'sets content intended use extension', 'content_package'
        it_behaves_like 'sets content return types extension', 'file'
        it_behaves_like 'skips content return url extension'
      end
    end
  end
end

