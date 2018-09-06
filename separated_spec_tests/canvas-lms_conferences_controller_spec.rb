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

describe ConferencesController do
  before :once do
    # these specs need an enabled web conference plugin
    @plugin = PluginSetting.create!(name: 'wimba')
    @plugin.update_attribute(:settings, { :domain => 'wimba.test' })
    course_with_teacher(active_all: true, user: user_with_pseudonym(active_all: true))
    @inactive_student = course_with_user('StudentEnrollment', course: @course, enrollment_state: 'invited').user
    student_in_course(active_all: true, user: user_with_pseudonym(active_all: true))
  end

  before :each do
    allow_any_instance_of(WimbaConference).to receive(:send_request).and_return('')
    allow_any_instance_of(WimbaConference).to receive(:get_auth_token).and_return('abc123')
  end

  describe "GET 'index'" do
    it "should require authorization" 


    it "should redirect 'disabled', if disabled by the teacher" 


    it "should assign variables" 


    it "should not redirect from group context" 


    it "should not include the student view student" 


    it "doesn't include inactive users" 


    it "should not allow the student view student to access collaborations" 


    it "should not list conferences that use a disabled plugin" 

  end

  describe "POST 'create'" do
    it "should require authorization" 


    it "should create a conference" 


    context 'with concluded students in context' do
      context "with a course context" do
        it 'should not invite students with a concluded enrollment' 

      end

      context 'with a group context' do
        it 'should not invite students with a concluded enrollment' 

      end
    end
  end

  describe "POST 'update'" do
    it "should require authorization" 


    it "should update a conference" 

  end

  describe "POST 'join'" do
    it "should require authorization" 


    it "should let admins join a conference" 


    it "should let students join an inactive long running conference" 


    describe 'when student is part of the conference' do

      before :once do
        @conference = @course.web_conferences.create!(:conference_type => 'Wimba', :duration => 60, :user => @teacher)
        @conference.users << @student
      end

      before :each do
        user_session(@student)
      end

      it "should not let students join an inactive conference" 


      describe 'when the conference is active' do
        before do
          Setting.set('enable_page_views', 'db')
          expect_any_instance_of(WimbaConference).to receive(:active?).and_return(true)
          post 'join', params: {:course_id => @course.id, :conference_id => @conference.id}
        end

        it "should let students join an active conference" 


        it 'logs an asset access record for the discussion topic' 


        it 'registers a page view' 

      end
    end
  end
end

