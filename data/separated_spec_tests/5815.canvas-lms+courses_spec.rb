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

require File.expand_path(File.dirname(__FILE__) + '/common')

describe "courses" do
  include_context "in-process server selenium tests"

  context "as a teacher" do

    def create_new_course
      get "/"
      f('[aria-controls="new_course_form"]').click
      wait_for_ajaximations
      f('[name="course[name]"]').send_keys "testing"
      f('.ui-dialog-buttonpane .btn-primary').click
    end

    before (:each) do
      account = Account.default
      account.settings = {:open_registration => true, :no_enrollments_can_create_courses => true, :teachers_can_create_courses => true}
      account.save!
      allow_any_instance_of(Account).to receive(:feature_enabled?).and_call_original
      allow_any_instance_of(Account).to receive(:feature_enabled?).with(:new_user_tutorial).and_return(false)
    end

    context 'draft state' do
      before(:each) do
        course_with_teacher_logged_in
        @course.default_view = 'feed'
        @course.save
      end

      def validate_action_button(postion, validation_text)
        action_button = ff('#course_status_actions button').send(postion)
        expect(action_button).to have_class('disabled')
        expect(action_button.text).to eq validation_text
      end

      it "should allow publishing of the course through the course status actions" 


      it "should display a creative commons license when set", priority: "1", test_id: 272274 do
        @course.license =  'cc_by_sa'
        @course.save!
        get "/courses/#{@course.id}"
        wait_for_ajaximations
        expect(f('.public-license-text').text).to include('This course content is offered under a')
      end

      it "should allow unpublishing of a course through the course status actions" 


      it "should allow publishing even if graded submissions exist" 


      it "should not show course status if published and graded submissions exist" 


      it "should allow unpublishing of the course if submissions have no score or grade" 


      it "should allow publishing/unpublishing with only change_course_state permission" 


      it "should not allow publishing/unpublishing without change_course_state permission" 

    end

    describe 'course wizard' do
      def go_to_checklist
        get "/courses/#{@course.id}"
        f(".wizard_popup_link").click()
        expect(f(".ic-wizard-box")).to be_displayed
        wait_for_ajaximations
      end

      def check_if_item_complete(item)
        elem = "#wizard_#{item}.ic-wizard-box__content-trigger--checked"
        expect(f(elem)).to be_displayed
      end

      def check_if_item_not_complete(item)
        expect(f("#wizard_#{item}.ic-wizard-box__content-trigger")).to be_displayed
        expect(f("#content")).not_to contain_css("#wizard_#{item}.ic-wizard-box__content-trigger--checked")
      end

      it "should open up the choose home page dialog from the wizard" 


      it "should have the correct initial state" 


      it "should complete 'Add Course Assignments' checklist item" 


      it "should complete 'Add Students to the Course' checklist item" 


      it "should complete 'Select Navigation Links' checklist item" 


      it "should complete 'Add Course Calendar Events' checklist item" 


      it "should complete 'Publish the Course' checklist item" 

    end

    it "should correctly update the course quota" 


    it "should redirect to the gradebook when switching courses when viewing a students grades" 


    it "should load the users page using ajax" 


    it "should only show users that a user has permissions to view" 


    it "should display users section name" 


    context "course_home_sub_navigation lti apps" do
      def create_course_home_sub_navigation_tool(options = {})
        @course.root_account.enable_feature!(:lor_for_account)
        defaults = {
          name: options[:name] || "external tool",
          consumer_key: 'test',
          shared_secret: 'asdf',
          url: 'http://example.com/ims/lti',
          course_home_sub_navigation: { icon_url: '/images/delete.png' },
        }
        @course.context_external_tools.create!(defaults.merge(options))
      end

      it "should display course_home_sub_navigation lti apps", priority: "1", test_id: 2624910 do
        course_with_teacher_logged_in(active_all: true)
        num_tools = 2
        num_tools.times { |index| create_course_home_sub_navigation_tool(name: "external tool #{index}") }
        get "/courses/#{@course.id}"
        expect(ff(".course-home-sub-navigation-lti").size).to eq num_tools
      end

      it "should include launch type parameter", priority: "1", test_id: 2624911 do
        course_with_teacher_logged_in(active_all: true)
        create_course_home_sub_navigation_tool
        get "/courses/#{@course.id}"
        expect(f('.course-home-sub-navigation-lti')).to have_attribute("href", /launch_type=course_home_sub_navigation/)
      end

      it "should only display active tools", priority: "1", test_id: 2624912 do
        course_with_teacher_logged_in(active_all: true)
        tool = create_course_home_sub_navigation_tool
        tool.workflow_state = 'deleted'
        tool.save!
        get "/courses/#{@course.id}"
        expect(f("#content")).not_to contain_css(".course-home-sub-navigation-lti")
      end

      it "should not display admin tools to students", priority: "1", test_id: 2624913 do
        course_with_teacher_logged_in(active_all: true)
        tool = create_course_home_sub_navigation_tool
        tool.course_home_sub_navigation['visibility'] = 'admins'
        tool.save!
        get "/courses/#{@course.id}"
        expect(ff(".course-home-sub-navigation-lti").size).to eq 1

        course_with_student_logged_in(course: @course, active_all: true)
        get "/courses/#{@course.id}"
        expect(f("#content")).not_to contain_css(".course-home-sub-navigation-lti")
      end
    end

  end

  context "course as a student" do

    def enroll_student(student, accept_invitation)
      if accept_invitation
        @course.enroll_student(student).accept
      else
        @course.enroll_student(student)
      end
    end

    before (:each) do
      course_with_teacher(:active_all => true, :name => 'discussion course')
      @student = user_with_pseudonym(:active_user => true, :username => 'student@example.com', :name => 'student@example.com', :password => 'asdfasdf')
      Account.default.settings[:allow_invitation_previews] = true
      Account.default.save!
    end

    it "should auto-accept the course invitation if previews are not allowed" 


    it "should accept the course invitation" 


    it "should reject a course invitation" 


    it "should display user groups on courses page" 


    it "should reset cached permissions when enrollment is activated by date" 

  end

  it "shouldn't cache unauth permissions for semi-public courses from sessionless permission checks" 


  it "should display announcements on course home page if enabled and is wiki" 

end

