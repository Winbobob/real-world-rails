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

require File.expand_path(File.dirname(__FILE__) + '/../sharding_spec_helper')

describe ContextController do
  before :once do
    course_with_teacher(:active_all => true)
    student_in_course(:active_all => true)
  end

  describe "GET 'roster'" do
    it "should require authorization" 


    it "should work when the context is a group in a course" 


    it "should only show active group members to students" 


    it "should only show active course instructors to students" 


    it "should show all group members to admins" 


    context "student context cards" do
      before(:once) do
        @course.root_account.enable_feature! :student_context_cards
      end

      it "is disabled when feature_flag is off" 


      it "is enabled for teachers when feature_flag is on" 


      it "is always disabled for students" 

    end
  end

  describe "GET 'roster_user'" do
    it "should require authorization" 


    it "should assign variables" 


    describe 'across shards' do
      specs_require_sharding

      it 'allows merged users from other shards to be referenced' 

    end

    describe 'section visibility' do
      before :once do
        @other_section = @course.course_sections.create! :name => 'Other Section FRD'
        @course.enroll_teacher(@teacher, :section => @other_section, :allow_multiple_enrollments => true).accept!
        @other_student = user_factory
        @course.enroll_student(@other_student, :section => @other_section, :limit_privileges_to_course_section => true).accept!
      end

      it 'prevents section-limited users from seeing users in other sections' 


      it 'limits enrollments by visibility for course default section' 


      it 'limits enrollments by visibility for other section' 


      it "lets admins see concluded students" 


      it "lets admins see inactive students" 


      it "does not let students see inactive students" 

    end
  end

  describe "POST 'object_snippet'" do
    before(:each) do
      @obj = "<object data='test'></object>"
      allow(HostUrl).to receive(:is_file_host?).and_return(true)
      @data = Base64.encode64(@obj)
      @hmac = Canvas::Security.hmac_sha1(@data)
    end

    it "should require a valid HMAC" 


    it "should render given a correct HMAC" 

  end

  describe "GET '/media_objects/:id/thumbnail" do
    it "should redirect to kaltura even if the MediaObject does not exist" 

  end

  describe "POST '/media_objects'" do
    before :each do
      user_session(@student)
    end

    it "should match the create_media_object route" 


    it "should update the object if it already exists" 


    it "should create the object if it doesn't already exist" 


    it "should truncate the title and user_entered_title" 

  end

  describe "GET 'prior_users" do
    before do
      user_session(@teacher)
      create_users_in_course(@course, 21)
      @course.student_enrollments.update_all(workflow_state: "completed")
    end

    it "should paginate" 

  end

  describe "GET 'undelete_index'" do
    it 'should work' 

  end

  describe "POST 'undelete_item'" do
    it 'does not allow dangerous sends' 


    it 'allows undeleting a "normal" association' 


    it 'allows undeleting wiki pages' 


    it 'allows undeleting attachments' 

  end

  describe "GET 'roster_user_usage'" do
    before(:once) do
      page = @course.wiki_pages.create(:title => "some page")
      AssetUserAccess.create!({
        user_id: @student,
        asset_code: page.asset_string,
        context: @course,
        category: 'pages'
      })
    end

    it "returns accesses" 


    it "returns json" 

  end
end

