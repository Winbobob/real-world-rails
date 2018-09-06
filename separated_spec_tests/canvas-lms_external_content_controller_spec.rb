#
# Copyright (C) 2015 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ExternalContentController do

  describe "GET success" do
    it "doesn't require a context" 


    it "gets a context for external_tool_dialog" 

  end

  describe "POST success/external_tool_dialog" do
    it "js env is set correctly" 


    context 'external_tool service_id' do
      let(:test_course) {course_factory}
      let(:launch_url) {'http://test.com/launch'}
      let(:tool) do
        test_course.context_external_tools.create!(
          {
            name: 'test tool',
            domain:'test.com',
            consumer_key: oauth_consumer_key,
            shared_secret: 'secret'
          }
        )
      end
      let(:service_id) {"3"}
      let(:oauth_consumer_key) {"key"}
      let(:content_item_selection) do
        message = IMS::LTI::Models::Messages::ContentItemSelection.new(
          {
            lti_message_type: 'ContentItemSelection',
            lti_version: 'LTI-1p0',
            content_items: File.read(File.join(Rails.root, 'spec', 'fixtures', 'lti', 'content_items.json')),
            data: Canvas::Security.create_jwt({content_item_id: service_id, oauth_consumer_key: oauth_consumer_key}),
            lti_msg: '',
            lti_log: '',
            lti_errormsg: '',
            lti_errorlog: ''
          }
        )
        message.launch_url = launch_url
        message.oauth_consumer_key = oauth_consumer_key
        message
      end

      before(:each) do
        allow_any_instance_of(Lti::MessageAuthenticator).to receive(:valid?).and_return(true)
        course_with_teacher
        user_session(@teacher)
      end

      it 'validates the signature' 


      it "sets the service_id if one is passed in" 


      it "returns a 401 if the service_id, and data attribute don't match" 


      it "returns a 401 if the consumer_key, and data attribute don't match" 


    end



  end


  describe "#content_items_for_canvas" do
    it 'sets default placement advice' 


    it "uses the default url if one isn't provided" 


    context 'lti_links' do
      it "generates a canvas tool launch url" 


      it "generates a borderless launch url for iframe target" 


      it "generates a borderless launch url for window target" 

    end
  end

end

