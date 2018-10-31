#
# Copyright (C) 2013 - present Instructure, Inc.
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

# Manually stubbing the actual API request
describe AppCenter::AppApi do
  let(:api) { AppCenter::AppApi.new }

  before(:each) do
    default_settings = api.app_center.default_settings
    default_settings['base_url'] = 'http://www.example.com'
    default_settings['apps_index_endpoint'] = '/apps'
    default_settings['token'] = 'ABCDEFG1234567'
    PluginSetting.create!(:name => api.app_center.id, :settings => default_settings)
  end

  it "finds the app_center plugin" 


  describe '#fetch_app_center_response' do
    let(:response) do
      response = double
      allow(response).to receive(:body).and_return(
          {
              'meta' => {"next" => "https://www.example.com/api/v1/apps?offset=60"},
              'current_offset' => 0,
              'limit' => 50,
              'objects' => %w(object1 object2 object3 object4)
          }.to_json
      )
      response
    end

    it "can handle query params in the endpoint" 


    it "can handle an invalid response" 


    it "can handle an error response" 


    it "respects per_page param" 


    it "can omit next page" 


    describe "caching" do
      it "resets the cache when getting an invalid response" 


      it "uses the configured token as part of the cache key" 

    end
  end

  describe '#get_app_config_url' do
    let(:app_center_response) do
      {
         "id"   =>163,
         "short_name" => "pr_youtube",
         "name" => "YouTube",
         "description" => "\n<p>Search publicly available YouTube videos.</p>\n",
         "short_description" => "Search publicly available YouTube videos.",
         "status" => "active",
         "app_type" => nil,
         "preview_url" => "https://www.edu-apps.org/lti_public_resources/?tool_id=youtube",
         "banner_image_url" => "https://edu-app-center.s3.amazonaws.com/uploads/pr_youtube.png",
         "logo_image_url" => nil,
         "icon_image_url" => nil,
         "average_rating" => 4.0,
         "total_ratings" => 5.0,
         "is_certified" => false,
         "config_xml_url" => "https://www.edu-apps.org/lti_public_resources/config.xml?id=youtube",
         "requires_secret" => false,
         "config_options" => [
           {
              "name" => "channel_name",
              "param_type" => "text",
              "default_value" => "",
              "description" => "Channel Name (Optional)",
              "is_required" => false
           }
         ]
      }
    end

    it 'gets the details of the specified app' 


    it 'appends config settings to an existing query string' 


    it 'creates a query string populated with config settings' 


    it 'returns nil if app center id is invalid' 


    it 'sends the app center token' 

  end

  describe '#get_apps' do
    let(:response) do
      response = double
      allow(response).to receive(:body).and_return(
          {
              'meta' => {"next" => "https://www.example.com/api/v1/apps?offset=72"},
              'current_offset' => 0,
              'limit' => 72,
              'objects' => [
                  {
                      'name' => 'First Tool',
                      'id' => 'first_tool',
                  },
                  {
                      'name' => 'Second Tool',
                      'id' => 'second_tool',
                  }
              ]
          }.to_json
      )
      response
    end

    it "gets a list of apps" 


    it "returns an empty hash if the app center is disabled" 


    it "gets the next page" 


    it "caches apps results" 


    it "caches multiple calls" 


    it "can handle an edu-apps api v1 response" 


    it "can handle an edu-apps api v2 response" 

  end
end

