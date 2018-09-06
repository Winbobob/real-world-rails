#
# Copyright (C) 2013 Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')

describe "Conferences API", type: :request do
  include Api::V1::Conferences
  include Api::V1::Json
  include Api

  before :once do
    # these specs need an enabled web conference plugin
    @plugin = PluginSetting.create!(name: 'wimba')
    @plugin.update_attribute(:settings, { :domain => 'wimba.test' })
    @category_path_options = { :controller => "conferences", :format => "json" }
    course_with_teacher(:active_all => true)
    student_in_course(:active_all => true)
    @user = @teacher
  end

  describe "GET list of conferences" do

    it "should require authorization" 


    it "should list all the conferences" 


    it "should not list conferences for disabled plugins" 


    it "should only list conferences the user is a participant of" 


    it 'should get a conferences for a group' 

  end

  describe "POST 'recording_ready'" do
    before do
      allow(WebConference).to receive(:plugins).and_return([
        web_conference_plugin_mock("big_blue_button", {
          :domain => "bbb.instructure.com",
          :secret_dec => "secret",
        })
      ])
    end

    let(:conference) do
      BigBlueButtonConference.create!(context: course_factory,
                                      user: user_factory,
                                      conference_key: "conf_key")
    end

    let(:course_id) { conference.context.id }

    let(:path) do
      "/api/v1/courses/#{course_id}/conferences/#{conference.id}/recording_ready"
    end

    let(:params) do
      @category_path_options.merge(action: 'recording_ready',
                                   course_id: course_id,
                                   conference_id: conference.id)
    end

    it 'should mark the recording as ready' 


    it 'should error if the secret key is wrong' 


    it 'should error if the conference_key is wrong' 

  end
end

