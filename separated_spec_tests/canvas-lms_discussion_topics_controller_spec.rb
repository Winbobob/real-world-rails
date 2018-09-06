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
require File.expand_path(File.dirname(__FILE__) + '/../sharding_spec_helper.rb')

describe DiscussionTopicsController do
  before :once do
    course_with_teacher(:active_all => true)
    course_with_observer(:active_all => true, :course => @course)
    @observer_enrollment = @enrollment
    student_in_course(:active_all => true)
  end

  def course_topic(opts={})
    @topic = @course.discussion_topics.build(:title => "some topic", :pinned => opts.fetch(:pinned, false))
    user = opts[:user] || @user
    if user && !opts[:skip_set_user]
      @topic.user = user
    end

    if opts[:with_assignment]
      @topic.assignment = @course.assignments.build(:submission_types => 'discussion_topic', :title => @topic.title)
      @topic.assignment.infer_times
      @topic.assignment.saved_by = :discussion_topic
    end

    @topic.save
    @topic.reload
    @topic
  end

  def topic_entry
    @entry = @topic.discussion_entries.create(:message => "some message", :user => @user)
  end

  describe "GET 'index'" do
    it "should require authorization" 


    it "should require the course to be published for students" 


    it 'does not show announcements without :read_announcements' 


    it "should load for :view_group_pages students" 


    context "graded group discussion" do
      before do
        @course.account.role_overrides.create!(
          role: student_role,
          permission: 'view_group_pages',
          enabled: true
        )

        group_discussion_assignment
        @child_topic = @topic.child_topics.first
        @child_topic.root_topic_id = @topic.id
        @group = @child_topic.context
        @group.add_user(@student)
        @assignment.only_visible_to_overrides = true
        @assignment.save!
      end

      it "should return graded and visible group discussions properly" 


      it "should not return graded group discussions if a student has no visibility" 


      it 'should redirect to correct mastery paths edit page' 

    end

    context "cross-sharding" do
      specs_require_sharding

      it 'returns the topic across shards' 

    end

    it "should return non-graded group discussions properly" 


    it "non-graded group discussions include root data if json request" 


    it "does not filter module locked discussion by default" 


    it "filters module locked discussions when asked to" 

  end

  describe "GET 'show'" do
    it "should require authorization" 


    it "should require the course to be published for students" 


    it "should return unauthorized if a user does not have visibilities" 


    it "js_env TOTAL_USER_COUNT and IS_ANNOUNCEMENT are set correctly for section specific announcements" 


    it "js_env COURSE_SECTIONS is set correctly for section specific announcements" 


    it "js_env COURSE_SECTIONS should have correct count" 


    it "should not work for announcements in a public course" 


    it "should not display announcements in private courses to users who aren't logged in" 


    context 'section specific announcements' do
      before(:once) do
        course_with_teacher(active_course: true)
        @section = @course.course_sections.create!(name: 'test section')

        @announcement = @course.announcements.create!(:user => @teacher, message: 'hello my favorite section!')
        @announcement.is_section_specific = true
        @announcement.course_sections = [@section]
        @announcement.save!

        @student1, @student2 = create_users(2, return_type: :record)
        @course.enroll_student(@student1, :enrollment_state => 'active')
        @course.enroll_student(@student2, :enrollment_state => 'active')
        student_in_section(@section, user: @student1)
      end

      it "should be visible to students in specific section" 


      it "should not be visible to students not in specific section announcements" 

    end

    context 'section specific discussions' do
      before(:once) do
        @course.root_account.enable_feature!(:section_specific_discussions)
        course_with_teacher(active_course: true)
        @section = @course.course_sections.create!(name: 'test section')

        @discussion = @course.discussion_topics.create!(:user => @teacher, message: 'hello my favorite section!')
        @discussion.is_section_specific = true
        @discussion.course_sections = [@section]
        @discussion.save!

        @student1, @student2 = create_users(2, return_type: :record)
        @course.enroll_student(@student1, :enrollment_state => 'active')
        @course.enroll_student(@student2, :enrollment_state => 'active')
        student_in_section(@section, user: @student1)
      end

      it "should be visible to students in specific section" 


      it "should not be visible to students not in specific section discussions" 

    end

    context "discussion topic with assignment with overrides" do
      render_views

      before :once do
        course_topic(user: @teacher, with_assignment: true)
        @section = @course.course_sections.create!(:name => "I <3 Discusions")
        @override = assignment_override_model(:assignment => @topic.assignment,
                                  :due_at => Time.now,
                                  :set => @section)
      end

      it "doesn't show the topic to unassigned students" 


      it "doesn't show overrides to students" 


      it "doesn't show overrides for observers" 


      it "does show overrides to teachers" 


    end

    it "should assign variables" 


    it "should display speedgrader when not for a large course" 


    it "should hide speedgrader when for a large course" 


    it "should setup speedgrader template for variable substitution" 


    it "should mark as read when viewed" 


    it "should not mark as read if not visible" 


    it "should mark as read if visible but locked" 


    it "should allow concluded teachers to see discussions" 


    it "should allow concluded students to see discussions" 


    context 'group discussions' do
      before(:once) do
        @group_category = @course.group_categories.create(:name => 'category 1')
        @group1 = @course.groups.create!(:group_category => @group_category)
        @group2 = @course.groups.create!(:group_category => @group_category)

        group_category2 = @course.group_categories.create(:name => 'category 2')
        @course.groups.create!(:group_category => group_category2)

        course_topic(user: @teacher, with_assignment: true)
        @topic.group_category = @group_category
        @topic.save!

        @group1.add_user(@student)
      end

      it "should assign groups from the topic's category" 


      it "should only show applicable groups if DA applies" 


      it "should redirect to group for student if DA applies to section" 


      it "should redirect to the student's group" 


      it "should redirect to the student's group even if students can view all groups" 


      it "should not change the name of the child topic when navigating to it" 


      it "should plumb the module_item_id through group discussion redirect" 


      it "should plumb the module_item_id through child discussion redirect" 

    end

    context 'publishing' do
      render_views

      it "hides the publish icon for announcements" 

    end

    context "posting first to view setting" do
      before(:once) do
        @observer_enrollment.associated_user = @student
        @observer_enrollment.save
        @observer.reload

        @context = @course
        discussion_topic_model
        @topic.require_initial_post = true
        @topic.save
      end

      it "should allow admins to see posts without posting" 


      it "shouldn't allow student who hasn't posted to see" 


      it "shouldn't allow student's observer who hasn't posted to see" 


      it "should allow student who has posted to see" 


      it "should allow student's observer who has posted to see" 

    end

    context "student context cards" do
      before(:once) do
        course_topic user: @teacher
        @course.root_account.enable_feature! :student_context_cards
      end

      it "is disabed for students" 


      it "is disabled for teachers when feature_flag is off" 


      it "is enabled for teachers when feature_flag is on" 

    end

  end

  describe "GET 'new'" do
    it "should maintain date and time when passed params" 


    it "js_env DUE_DATE_REQUIRED_FOR_ACCOUNT is true when AssignmentUtil.due_date_required_for_account? == true" 


    it "js_env DUE_DATE_REQUIRED_FOR_ACCOUNT is false when AssignmentUtil.due_date_required_for_account? == false" 


    it "js_env MAX_NAME_LENGTH_REQUIRED_FOR_ACCOUNT is true when AssignmentUtil.name_length_required_for_account? == true" 


    it "js_env MAX_NAME_LENGTH_REQUIRED_FOR_ACCOUNT is false when AssignmentUtil.name_length_required_for_account? == false" 


    it "js_env MAX_NAME_LENGTH is a 15 when AssignmentUtil.assignment_max_name_length returns 15" 


    it "js_env SIS_NAME is Foo Bar when AssignmentUtil.post_to_sis_friendly_name is Foo Bar" 

  end

  describe "GET 'edit'" do
    before(:once) do
      course_topic
    end

    include_context "grading periods within controller" do
      let(:course) { @course }
      let(:teacher) { @teacher }
      let(:request_params) { [:edit, params: {course_id: course, id: @topic}] }
    end

    it "should not explode with mgp and group context" 


    it "js_env SECTION_LIST is set correctly for section specific announcements on a limited privileges user" 


    it "js_env SECTION_LIST is set correctly for section specific announcements on a not limited privileges user" 


    it "returns unauthorized for a user that does not have visibilites to view thiss" 


    it "js_env SELECTED_SECTION_LIST is set correctly for section specific announcements" 


    it "js_env DUE_DATE_REQUIRED_FOR_ACCOUNT is true when AssignmentUtil.due_date_required_for_account? == true" 


    it "js_env DUE_DATE_REQUIRED_FOR_ACCOUNT is false when AssignmentUtil.due_date_required_for_account? == false" 


    it "js_env MAX_NAME_LENGTH_REQUIRED_FOR_ACCOUNT is true when AssignmentUtil.name_length_required_for_account? == true" 


    it "js_env MAX_NAME_LENGTH_REQUIRED_FOR_ACCOUNT is false when AssignmentUtil.name_length_required_for_account? == false" 


    it "js_env MAX_NAME_LENGTH is a 15 when AssignmentUtil.assignment_max_name_length returns 15" 


    it "js_env SIS_NAME is Foo Bar when AssignmentUtil.post_to_sis_friendly_name is Foo Bar" 


    context 'conditional-release' do
      before do
        user_session(@teacher)
      end

      it 'should include environment variables if enabled' 


      it 'should not include environment variables when disabled' 

    end
  end

  context 'student planner' do
    before do
      @course.root_account.enable_feature!(:student_planner)
    end

    before :each do
      course_topic
    end

    it 'js_env STUDENT_PLANNER_ENABLED is true for teachers' 


    it 'js_env STUDENT_PLANNER_ENABLED is false for students' 


    it 'should create a topic with a todo date' 


    it 'should update a topic with a todo date' 


    it 'should remove a todo date from a topic' 


    it 'should not allow a student to update the to-do date' 


    it 'should not allow a todo date on a graded topic' 


    it 'should not allow changing a topic to graded and adding a todo date' 


    it 'should allow a todo date when changing a topic from graded to ungraded' 


    it 'should remove an existing todo date when changing a topic from ungraded to graded' 

  end

  describe "GET 'public_feed.atom'" do
    before(:once) do
      course_topic
    end

    it "should require authorization" 


    it "should include absolute path for rel='self' link" 


    it "should not include entries in an anonymous feed" 


    it "should include an author for each entry with an enrollment feed" 

  end

  describe 'POST create:' do
    before(:once) do
      Setting.set('enable_page_views', 'db')
    end
    before(:each) do
      allow(controller).to receive_messages(:form_authenticity_token => 'abc', :form_authenticity_param => 'abc')
    end

    def topic_params(course, opts={})
      {
        :course_id => course.id,
        :title => 'Topic Title',
        :is_announcement => false,
        :discussion_type => 'side_comment',
        :require_initial_post => true,
        :podcast_has_student_posts => false,
        :delayed_post_at => '',
        :locked => true,
        :lock_at => '',
        :message => 'Message',
        :delay_posting => false,
        :threaded => false,
        :specific_sections => 'all'
      }.merge(opts)
    end

    def group_topic_params(group, opts={})
      params = topic_params(group, opts)
      params[:group_id] = group.id
      params.delete(:course_id)
      params
    end

    def assignment_params(course, opts={})
      course.require_assignment_group
      {
        assignment: {
          points_possible: 1,
          grading_type: 'points',
          assignment_group_id: @course.assignment_groups.first.id,
        }.merge(opts)
      }
    end

    describe "create_announcements_unlocked preference" do
      before(:each) do
        @teacher.create_announcements_unlocked(false)
        user_session(@teacher)
      end

      it 'is updated when creating new announcements' 


      it 'is not updated when creating new discussions' 

    end

    describe 'the new topic' do
      let(:topic) { assigns[:topic] }
      before(:each) do
        user_session(@student)
        post 'create', params: topic_params(@course), :format => :json
      end

      specify { expect(topic).to be_a DiscussionTopic }
      specify { expect(topic.user).to eq @user }
      specify { expect(topic.delayed_post_at).to be_nil }
      specify { expect(topic.lock_at).to be_nil }
      specify { expect(topic.workflow_state).to eq 'active' }
      specify { expect(topic.id).not_to be_nil }
      specify { expect(topic.title).to eq 'Topic Title' }
      specify { expect(topic.is_announcement).to be_falsey }
      specify { expect(topic.discussion_type).to eq 'side_comment' }
      specify { expect(topic.message).to eq 'Message' }
      specify { expect(topic.threaded).to be_falsey }
    end

    # TODO: fix this terribleness
    describe 'section specific discussions' do
      before(:each) do
        @course.root_account.enable_feature!(:section_specific_discussions)
        user_session(@teacher)
        @section1 = @course.course_sections.create!(name: "Section 1")
        @section2 = @course.course_sections.create!(name: "Section 2")
        @section3 = @course.course_sections.create!(name: "Section 3")
        @section4 = @course.course_sections.create!(name: "Section 4")
        @course.enroll_teacher(@teacher, section: @section1, allow_multiple_enrollments: true).accept!
        @course.enroll_teacher(@teacher, section: @section2, allow_multiple_enrollments: true).accept!
        Enrollment.limit_privileges_to_course_section!(@course, @teacher, true)
      end

      it 'creates an announcement with sections' 


      it 'section-specific-teachers can create course-wide discussions' 


      it 'section-specfic-teachers cannot create wrong-section discussions' 


      it 'admins can see section-specific discussions' 


      it 'admins can create section-specific discussions' 


      it 'creates a discussion with sections' 


      it 'does not create a discussion with sections if the feature is disabled' 


      it 'does not allow creation of group discussions that are section specific' 


      # Note that this is different then group discussions. This is the
      # "This is a Group Discussion" checkbox on a course discussion edit page,
      # whereas that one is creating a discussion in a group page.
      it 'does not allow creation of discussions with groups that are section specific' 


      it 'does not allow creation of graded discussions that are section specific' 


      it 'does not allow creation of disuccions to sections that are not visible to the user' 

    end

    it "should require authorization to create a discussion" 


    it "should require authorization to create an announcement" 


    it 'logs an asset access record for the discussion topic' 


    it 'creates an announcement that is locked by default' 


    it 'creates a discussion topic that is not locked by default' 


    it 'registers a page view' 


    it 'does not dispatch assignment created notification for unpublished graded topics' 


    it 'does not dispatch new topic notification when hidden by selective release' 


    it 'does dispatch new topic notification when not hidden' 


    it 'does dispatch new topic notification when published' 


    it 'dispatches an assignment stream item with the correct title' 


    it 'does not allow for anonymous peer review assignment' 

  end

  describe "PUT: update" do
    before(:once) do
      @topic = DiscussionTopic.create!(context: @course, title: 'Test Topic',
        delayed_post_at: '2013-01-01T00:00:00UTC', lock_at: '2013-01-02T00:00:00UTC')
    end
    before(:each) do
      user_session(@teacher)
    end

    describe "create_announcements_unlocked preference" do

      before(:each) do
        @teacher.create_announcements_unlocked(false)
        user_session(@teacher)
      end

      it 'is not updated when updating an existing announcements' 


      it 'is not updated when creating an existing discussions' 

    end

    it 'does not allow setting specific sections for group discussions' 


    it "does not allow updating a section specific announcement you do not have visibilities for" 


    it "Allows an admin to update a section-specific discussion" 


    it "can turn graded topic into ungraded section-specific topic in one edit" 


    it "should not clear lock_at if locked is not changed" 


    it "should be able to turn off locked and delayed_post_at date in same request" 


    it "should be able to turn on locked and delayed_post_at date in same request" 


    it "should not change the editor if only pinned was changed" 


    it "should not clear delayed_post_at if published is not changed" 


    it "should unlock discussions with a lock_at attribute if lock state changes" 


    it "should set workflow to post_delayed when delayed_post_at and lock_at are in the future" 


    it "should not clear lock_at if lock state hasn't changed" 


    it "should set draft state on discussions with delayed_post_at" 


    it "attaches a file and handles duplicates" 


    it "should delete attachments" 


    it "uses inst-fs if it is enabled" 


    it "editing section-specific topic to not-specific should clear out visibilities" 


    it 'does not remove specific sections if key is missing in PUT json' 

  end

  describe "POST 'reorder'" do
    it "should reorder pinned topics" 

  end
end

