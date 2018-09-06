#
# Copyright (C) 2017 Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper.rb')

describe Lti::ContentItemSelectionRequest do
  include ExternalToolsSpecHelper

  subject(:lti_request) { described_class.new(default_params) }

  let(:default_params) do
    {
      context: course,
      domain_root_account: root_account,
      user: teacher,
      base_url: base_url,
      tool: tool
    }
  end

  let(:base_url) { 'https://canvas.test/' }
  let(:course) { course_model }
  let(:root_account) { course.root_account }
  let(:teacher) { course_with_teacher(course: course).user }
  let(:placement) {'resource_selection'}
  let(:tool) { new_valid_tool(course) }
  let(:launch_url) { 'http://www.test.com/launch' }

  context '#generate_lti_launch' do
    it 'generates an Lti::Launch' 


    it 'sends opts to the Lti::Launch' 


    it 'generates resource_url based on a launch_url' 


    it 'sets the link text to the placement label' 


    it 'sets the analytics id to the tool id' 


    context 'params' do
      it 'builds a params hash that includes the default lti params' 


      it "sets the 'accept_multiple' param to false" 


      it 'adds message type and version params' 


      it 'adds context_title param' 


      it "adds the 'ext_lti_assignment_id' if available" 


      context 'return_url' do
        let(:base_uri) { URI.parse(base_url) }

        it 'properly sets the return URL when no content item id is provided' 


        it 'properly sets the return URL when a content item id is provided' 


        it 'generates a url a http protocol when the base_uri uses http' 


        it 'generates a url with a port when there is a port in the base_uri' 

      end

      context 'data' do
        it 'includes the default launch URL' 


        it 'includes content_item_id and oauth_consumer_key if content_item_id provided' 


        it 'does not include content_item_id or oauth_consumer_key if content_item_id is not provided' 

      end

      context 'placement params' do
        it 'adds params for the migration_selection placement' 


        it 'adds params for the editor_button placement' 


        it 'adds params for the resource_selection placement' 


        it 'adds params for the link_selection placement'
        it 'adds params for the assignment_selection placement'

        it 'adds params for the collaboration placement' 


        it 'substitutes collaboration variables in a collaboration launch'

        context 'homework_submission' do
          it 'adds params for an assignment that can accept an online_url submission' 


          it 'adds params for an assignment that can accept an online_upload submission' 


          it 'adds params for extensions allowed by an assignment' 


          it 'adds params for assignments that accept either an online_upload or online_url' 

        end
      end
    end
  end

  context '.default_lti_params' do
    before do
      allow(Lti::Asset).to receive(:opaque_identifier_for).with(course).and_return('course_opaque_id')
    end

    it 'generates default_lti_params' 


    it 'adds user information when a user is provided' 

  end
end

