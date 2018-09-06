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

describe CollaborationsController do
  before :once do
    plugin_setting = PluginSetting.new(:name => "etherpad", :settings => {})
    plugin_setting.save!
    course_with_teacher(active_all: true)
    student_in_course(active_all: true)

    group_model(:context => @course)
  end

  describe "GET 'index'" do
    it "should require authorization" 


    it "should redirect 'disabled', if disabled by the teacher" 


    it "should assign variables" 


    it "should handle users without google authorized" 


    it 'handles users that need to upgrade to google_drive' 


    it "should not allow the student view student to access collaborations" 


    it "should work with groups" 


    it "only returns collaborations that the user has access to read" 


  end

  describe "GET 'members'" do
    before(:each) do
      @collab = @course.collaborations.create!(
        title: "accessible",
        user: @student,
        url: 'http://www.example.com'
      )
      @collab.reload
    end

    it "should require authorization" 


    context "with user access token" do
      before(:each) do
        pseudonym(@student)
        @student.save!
        token = @student.access_tokens.create!(purpose: 'test').full_token
        @request.headers['Authorization'] = "Bearer #{token}"
      end

      it "should return back collaboration members" 


      it "should include collaborator_lti_id" 


      it "should include avatar_image_url" 

    end
  end

  describe "GET 'lti_index'" do
    it "should require authorization for the course" 


    it "should require authorization for the group" 

  end


  describe "GET 'show'" do
    let(:collaboration) do
      @course.collaborations.create!(
        title: "my collab",
        user: @teacher
      ).tap{ |c| c.update_attribute :url, 'http://www.example.com' }
    end

    it 'redirects to the lti launch url for ExternalToolCollaborations' 


    context "logged in user" do
      before :once do
        Setting.set('enable_page_views', 'db')
        course_with_teacher(:active_all => true)
      end

      before :each do
        user_session(@teacher)
        get 'show', params: {:course_id=>@course.id, :id => collaboration.id}
      end

      it 'loads the correct collaboration' 


      it 'logs an asset access record for the discussion topic' 


      it 'registers a page view' 


    end

    context "logged out user" do
      it 'rejects access properly' 

    end
  end

  describe "POST 'create'" do
    before(:once) { course_with_teacher(active_all: true) }

    it "should require authorization" 


    it "should fail with invalid collaboration type" 


    it "should create collaboration" 


    context "content_items" do

      let(:content_items) do
        [
          {
            title: 'my collab',
            text: 'collab description',
            url: 'http://example.invalid/test',
            confirmUrl: 'http://example.com/confirm/343'
          }
        ]
      end

      it "should create a collaboration using content-item" 


      it "callback url should not be nil if provided" 


      it "should callback on success" 


      it "should callback on failure" 


      it "adds users if sent" 


      it "adds groups if sent" 


    end

  end

  describe "PUT #update" do
    context "content_items" do
      let(:collaboration) do
        collab = @course.collaborations.create!(
          title: "a collab",
          user: @teacher
        )
        collab.update_attribute :url, 'http://www.example.com'
        collab.update_attribute :type, "ExternalToolCollaboration"
        collab
      end

      let(:content_items) do
        [
          {
            title: 'my collab',
            text: 'collab description',
            url: 'http://example.invalid/test',
            confirmUrl: 'http://example.com/confirm/343'
          }
        ]
      end

      it "should update a collaboration using content-item" 


      it "callback url should not be nil if provided" 


      it "should callback on success" 


      it "should callback on failure" 


      it "adds users if sent" 


      it "adds groups if sent" 


      it "adds each group only once on multiple requests" 

    end
  end

end

