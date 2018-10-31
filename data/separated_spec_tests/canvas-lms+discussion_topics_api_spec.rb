#
# Copyright (C) 2011 Instructure, Inc.
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
require File.expand_path(File.dirname(__FILE__) + '/../locked_spec')

require 'nokogiri'

class DiscussionTopicsTestCourseApi
  include Api
  include Api::V1::DiscussionTopics

  def feeds_topic_format_path(topic_id, code, format)
    "feeds_topic_format_path(#{topic_id.inspect}, #{code.inspect}, #{format.inspect})"
  end

  def named_context_url(*args)
    "named_context_url(#{args.inspect[1..-2]})"
  end

  def course_assignment_submissions_url(*args)
    "course_assignment_submissions_url(#{args.inspect[1..-2]})"
  end

  def course_assignment_url(*args)
    "course_assignment_url(#{args.inspect[1..-2]})"
  end
end

describe Api::V1::DiscussionTopics do
  before :once do
    @test_api = DiscussionTopicsTestCourseApi.new
    course_with_teacher(:active_all => true, :user => user_with_pseudonym)
    @me = @user
    student_in_course(:active_all => true, :course => @course)
    @topic = @course.discussion_topics.create
  end

  describe 'include root data if requested' do
    before :once do
      @delayed_post_time = 1.day.from_now
      @lock_at_time = 2.days.from_now.change(min: 1)
      @group_topic = group_discussion_topic_model(:delayed_post_at => @delayed_post_time, :lock_at => @lock_at_time)
    end

    it 'get root topic data' 


    it 'include if requested and not prefetched' 


    it 'include if requested and prefetched' 


    it 'dont include if not requested' 

  end

  it 'should render a podcast_url using the discussion topic\'s context if there is no @context_enrollment/@context' 


  it "should set can_post_attachments" 


  it "should include assignment" 


  context "with assignment" do
    before :once do
      @test_api.instance_variable_set(:@domain_root_account, Account.default)

      @topic.assignment = assignment_model(:course => @course)
      @topic.save!
    end

    it "should include assignment" 


    it "should include all_dates" 

  end
end

describe DiscussionTopicsController, type: :request do
  include Api::V1::User
  include AvatarHelper

  context 'locked api item' do
    include_examples 'a locked api item'

    let(:item_type) { 'discussion_topic' }

    let_once(:locked_item) do
      @course.discussion_topics.create!(:user => @user, :message => 'Locked Discussion')
    end

    def api_get_json
      @course.clear_permissions_cache(@user)
      api_call(
        :get,
        "/api/v1/courses/#{@course.id}/discussion_topics/#{locked_item.id}",
        {:controller => 'discussion_topics_api', :action => 'show', :format => 'json', :course_id => @course.id.to_s, :topic_id => locked_item.id.to_s},
      )
    end
  end

  before(:once) do
    course_with_teacher(:active_all => true, :user => user_with_pseudonym)
    user = @user
    student_in_course(:active_all => true, :course => @course)
    @user = user
  end

  describe "user_display_json" do
    it "should return a html_url based on parent_context" 

  end

  context "create topic" do
    it "should check permissions" 


    it "should make a basic topic" 


    it 'will not create an announcement with sections if context is a group' 


    it 'should process html content in message on create' 


    it "should post an announcment" 


    it "should create a topic with all the bells and whistles" 


    context "publishing" do
      it "should create a draft state topic" 


      it "should not allow announcements to be draft state" 


      it "should require moderation permissions to create a draft state topic" 


      it "should allow non-moderators to set published" 


    end

    it "should allow creating a discussion assignment" 


    it "should not create an assignment on a discussion topic when set_assignment is false" 

  end

  context "With item" do
    before :once do
      @attachment = create_attachment(@course)
      @topic = create_topic(@course, :title => "Topic 1", :message => "<p>content here</p>", :podcast_enabled => true, :attachment => @attachment)
      @sub = create_subtopic(@topic, :title => "Sub topic", :message => "<p>i'm subversive</p>")
    end

    let(:response_json) do
      {"read_state" => "read",
       "unread_count" => 0,
       "podcast_url" => "/feeds/topics/#{@topic.id}/enrollment_randomness.rss",
       "user_can_see_posts" => @topic.user_can_see_posts?(@user),
       "subscribed" => @topic.subscribed?(@user),
       "require_initial_post" => nil,
       "title" => "Topic 1",
       "discussion_subentry_count" => 0,
       "assignment_id" => nil,
       "is_section_specific" => @topic.is_section_specific,
       "published" => true,
       "can_unpublish" => true,
       "delayed_post_at" => nil,
       "lock_at" => nil,
       "created_at" => @topic.created_at.iso8601,
       "id" => @topic.id,
       "user_name" => @user.name,
       "last_reply_at" => @topic.last_reply_at.as_json,
       "message" => "<p>content here</p>",
       "posted_at" => @topic.posted_at.as_json,
       "root_topic_id" => nil,
       "pinned" => false,
       "position" => @topic.position,
       "url" => "http://www.example.com/courses/#{@course.id}/discussion_topics/#{@topic.id}",
       "html_url" => "http://www.example.com/courses/#{@course.id}/discussion_topics/#{@topic.id}",
       "podcast_has_student_posts" => false,
       "attachments" => [{"content-type" => "unknown/unknown",
                          "url" => "http://www.example.com/files/#{@attachment.id}/download?download_frd=1&verifier=#{@attachment.uuid}",
                          "filename" => "content.txt",
                          "display_name" => "content.txt",
                          "workflow_state" => "processed",
                          "id" => @attachment.id,
                          "uuid" => @attachment.uuid,
                          "folder_id" => @attachment.folder_id,
                          "size" => @attachment.size,
                          'unlock_at' => nil,
                          'locked' => false,
                          'hidden' => false,
                          'lock_at' => nil,
                          'locked_for_user' => false,
                          'hidden_for_user' => false,
                          'created_at' => @attachment.created_at.as_json,
                          'updated_at' => @attachment.updated_at.as_json,
                          'modified_at' => @attachment.modified_at.as_json,
                          'thumbnail_url' => nil,
                          'mime_class' => @attachment.mime_class,
                          'media_entry_id' => @attachment.media_entry_id
                         }],
       "topic_children" => [@sub.id],
       "group_topic_children" => [{"id" => @sub.id, "group_id" => @sub.context_id}],
       "discussion_type" => 'side_comment',
       "locked" => false,
       "can_lock" => true,
       "comments_disabled" => false,
       "locked_for_user" => false,
       "author" => user_display_json(@topic.user, @topic.context).stringify_keys!,
       "permissions" => {"delete" => true, "attach" => true, "update" => true, "reply" => true},
       "group_category_id" => nil,
       "can_group" => true,
       "allow_rating" => false,
       "only_graders_can_rate" => false,
       "sort_by_rating" => false,
       "todo_date" => nil,
      }
    end

    describe "GET 'index'" do
      it "should return discussion topic list" 


      it "should search discussion topics by title" 


      it "should order topics by descending position by default" 


      it "should order topics by descending last_reply_at when order_by parameter is specified" 


      it "should order topics by title when order_by parameter is specified" 


      it "should only include topics with a given scope when specified" 


      it "should include all parameters in pagination urls" 


      it 'should return group_topic_children for group discussions' 


      describe "section specific announcements" do
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

        it "should render correct page count for users even with delayed posted date" 


        it "teacher should be able to see section specific announcements" 


        it "teacher should be able to see section specific announcements and include sections" 


        it "teacher should be able to see section specific announcements and include sections and sections user count" 


        it "student in section should be able to see section specific announcements" 


        it "student not in section should not be able to see section specific announcements" 

      end
    end

    describe "GET 'show'" do
      it "should return an individual topic" 


      it "should require course to be published for students" 


      it 'should return group_topic_children for group discussions' 


      it "should properly translate a video media comment in the discussion topic's message" 


      it "should properly translate a audio media comment in the discussion topic's message" 


      it "should include all_dates if they are asked for" 


      it "should include overrides if they are asked for" 


      it "should include sections if the discussion is section specific and they are asked for" 


      it "should include section user accounts if they are asked for" 

    end

    describe "PUT 'update'" do
      it "should require authorization" 


      it "should update the entry" 


      it "should return section count if section specific" 


      it "should not unlock topic if lock_at changes but is still in the past" 


      it "should update workflow_state if delayed_post_at changed to future" 


      it "should not change workflow_state if lock_at does not change" 


      it "should unlock topic if lock_at is changed to future" 


      it "should lock the topic if lock_at is changed to the past" 


      it "should not lock the topic if lock_at is cleared" 


      it "should not update certain attributes for group discussions" 


      it "should not allow updating certain attributes for group sub-discussions" 


      context "publishing" do
        it "should publish a draft state topic" 


        it "should not allow announcements to be draft state" 



        it "should allow a topic with no posts to set draft state" 


        it "should prevent a topic with posts from setting draft state" 


        it "should require moderation permissions to set draft state" 


        it "should allow non-moderators to set published" 

      end

      it 'should process html content in message on update' 


      it "should set the editor_id to whoever edited to entry" 


      it "should not drift when saving delayed_post_at with user-preferred timezone set" 


      it "should allow creating assignment on update" 


      it "should allow removing assignment on update" 


      it "nulls availability dates on the topic if assignment ones are provided" 


      it "should update due dates with cache enabled" 


      it "should update due dates with cache enabled and overrides already present" 


      it "should transfer assignment group category to the discussion" 


      it "should allow pinning a topic" 


      it "should allow unpinning a topic" 


      it "should allow unlocking a locked topic" 


      it "should allow locking a topic after due date" 


      it "should not allow locking a topic before due date" 

    end

    describe "DELETE 'destroy'" do
      it "should require authorization" 


      it "should delete the topic" 

    end
  end

  context "differentiated assignments" do

    def calls_display_topic(topic, opts={except: []})
      get_index(topic.context)
      expect(JSON.parse(response.body).to_s).to include("#{topic.assignment.title}")

      calls = [:get_show, :get_entries, :get_replies, :add_entry, :add_reply]
      calls.reject! { |call| opts[:except].include?(call) }
      calls.each { |call| expect(self.send(call, topic).to_s).not_to eq "401" }
    end

    def calls_do_not_show_topic(topic)
      get_index(topic.context)
      expect(JSON.parse(response.body).to_s).not_to include("#{topic.assignment.title}")

      calls = [:get_show, :get_entries, :get_replies, :add_entry, :add_reply]
      calls.each { |call| expect(self.send(call, topic).to_s).to eq "401" }
    end

    def get_index(course)
      raw_api_call(:get, "/api/v1/courses/#{course.id}/discussion_topics.json",
                   {:controller => 'discussion_topics', :action => 'index', :format => 'json', :course_id => course.id.to_s})
    end

    def get_show(topic)
      raw_api_call(:get, "/api/v1/courses/#{topic.context.id}/discussion_topics/#{topic.id}",
                   {:controller => 'discussion_topics_api', :action => 'show', :format => 'json', :course_id => topic.context.id.to_s, :topic_id => topic.id.to_s})
    end

    def get_entries(topic)
      url = "/api/v1/courses/#{topic.context.id}/discussion_topics/#{topic.id}/entries"
      raw_api_call(:get, url, controller: 'discussion_topics_api', action: 'entries', format: 'json', course_id: topic.context.to_param, topic_id: topic.id.to_s)
    end

    def get_replies(topic)
      raw_api_call(:get, "/api/v1/courses/#{topic.context.id}/discussion_topics/#{topic.id}/entries/#{topic.discussion_entries.last.id}/replies",
                   {:controller => "discussion_topics_api", :action => "replies", :format => "json", :course_id => topic.context.id.to_s, :topic_id => topic.id.to_s, :entry_id => topic.discussion_entries.last.id.to_s})
    end

    def add_entry(topic)
      raw_api_call(:post, "/api/v1/courses/#{topic.context.id}/discussion_topics/#{topic.id}/entries.json",
                   {:controller => 'discussion_topics_api', :action => 'add_entry', :format => 'json',
                    :course_id => topic.context.id.to_s, :topic_id => topic.id.to_s},
                   {:message => "example entry"})
    end

    def add_reply(topic)
      raw_api_call(:post, "/api/v1/courses/#{topic.context.id}/discussion_topics/#{topic.id}/entries/#{topic.discussion_entries.last.id}/replies.json",
                   {:controller => 'discussion_topics_api', :action => 'add_reply', :format => 'json',
                    :course_id => topic.context.id.to_s, :topic_id => topic.id.to_s, :entry_id => topic.discussion_entries.last.id.to_s},
                   {:message => "example reply"})
    end


    def create_graded_discussion_for_da(assignment_opts={})
      assignment = @course.assignments.create!(assignment_opts)
      assignment.submission_types = 'discussion_topic'
      assignment.save!
      topic = @course.discussion_topics.create!(:user => @teacher, :title => assignment_opts[:title], :message => "woo", :assignment => assignment)
      entry = topic.discussion_entries.create!(:message => "second message", :user => @student)
      entry.save
      [assignment, topic]
    end

    before do
      course_with_teacher(:active_all => true, :user => user_with_pseudonym)
      @student_with_override, @student_without_override= create_users(2, return_type: :record)

      @assignment_1, @topic_with_restricted_access = create_graded_discussion_for_da(title: "only visible to student one", only_visible_to_overrides: true)
      @assignment_2, @topic_visible_to_all = create_graded_discussion_for_da(title: "assigned to all", only_visible_to_overrides: false)

      @course.enroll_student(@student_without_override, :enrollment_state => 'active')
      @section = @course.course_sections.create!(name: "test section")
      student_in_section(@section, user: @student_with_override)
      create_section_override_for_assignment(@assignment_1, {course_section: @section})

      @observer = User.create
      @observer_enrollment = @course.enroll_user(@observer, 'ObserverEnrollment', :section => @course.course_sections.first, :enrollment_state => 'active')
      @observer_enrollment.update_attribute(:associated_user_id, @student_with_override.id)
    end

    it "lets the teacher see all topics" 


    it "lets students with visibility see topics" 


    it 'gives observers the same visibility as their student' 


    it 'observers without students see all' 


    it "restricts access to students without visibility" 


    it "doesnt show extra assignments with overrides in the index" 


    it "doesnt hide topics without assignment" 

  end

  it "should translate user content in topics" 


  it "should paginate and return proper pagination headers for courses" 


  it "should work with groups" 


  it "should paginate and return proper pagination headers for groups" 


  it "should fulfill module viewed requirements when marking a topic read" 


  it "should fulfill module viewed requirements when re-marking a topic read" 


  it "should fulfill module viewed requirements when marking a topic and all its entries read" 


  context "creating an entry under a topic" do
    before :once do
      @topic = create_topic(@course, :title => "Topic 1", :message => "<p>content here</p>")
      @message = "my message"
    end

    it "should allow creating an entry under a topic and create it correctly" 


    it "should not allow students to create an entry under a topic that is closed for comments" 


    it "should return json representation of the new entry" 


    it "should allow creating a reply to an existing top-level entry" 


    it "should allow including attachments on top-level entries" 


    it "should include attachments on replies to top-level entries" 


    it "handles duplicate files when attaching" 


    it "should create a submission from an entry on a graded topic" 


    it "should create a submission from a reply on a graded topic" 

  end

  context "listing top-level discussion entries" do
    before :once do
      @topic = create_topic(@course, :title => "topic", :message => "topic")
      @attachment = create_attachment(@course)
      @entry = create_entry(@topic, :message => "first top-level entry", :attachment => @attachment)
      @reply = create_reply(@entry, :message => "reply to first top-level entry")
    end

    it "should return top level entries for a topic" 


    it "should return attachments on top level entries" 


    it "should include replies on top level entries" 


    it "should sort top-level entries by descending created_at" 


    it "should sort replies included on top-level entries by descending created_at" 


    it "should paginate top-level entries" 


    it "should only include the first 10 replies for each top-level entry" 

  end

  context "listing replies" do
    before :once do
      @topic = create_topic(@course, :title => "topic", :message => "topic")
      @entry = create_entry(@topic, :message => "top-level entry")
      @reply = create_reply(@entry, :message => "first reply")
    end

    it "should return replies for an entry" 


    it "should translate user content in replies" 


    it "should sort replies by descending created_at" 


    it "should paginate replies" 

  end

  # stolen and adjusted from spec/controllers/discussion_topics_controller_spec.rb
  context "require initial post" do
    before(:once) do
      course_with_student(:active_all => true)

      @observer = user_factory(:name => "Observer", :active_all => true)
      e = @course.enroll_user(@observer, 'ObserverEnrollment')
      e.associated_user = @student
      e.save
      @observer.reload

      course_with_teacher(:course => @course, :active_all => true)
      @context = @course
      discussion_topic_model
      @topic.require_initial_post = true
      @topic.save
    end

    describe "teacher" do
      before(:each) do
        @user = @teacher
        @url = "/api/v1/courses/#{@course.id}/discussion_topics/#{@topic.id}/entries"
      end

      it "should see topic entries without posting" 

    end

    describe "student" do
      before(:once) do
        @topic.reply_from(user: @teacher, text: 'Lorem ipsum dolor')
        @user = @student
        @url = "/api/v1/courses/#{@course.id}/discussion_topics/#{@topic.id}"
      end

      it "should see topic information before posting" 


      it "should not see entries before posting" 


      it "should see entries after posting" 

    end

    describe "observer" do
      before(:once) do
        @topic.reply_from(user: @teacher, text: 'Lorem ipsum')
        @user = @observer
        @url = "/api/v1/courses/#{@course.id}/discussion_topics/#{@topic.id}/entries"
      end

      it "should not see entries before posting" 


      it "should see entries after posting" 

    end
  end

  context "update entry" do
    before :once do
      @topic = create_topic(@course, :title => "topic", :message => "topic")
      @entry = create_entry(@topic, :message => "<p>top-level entry</p>")
    end

    it "should 401 if the user can't update" 


    it "should 404 if the entry is deleted" 


    it "should update the message" 


    it "should allow passing an plaintext message (undocumented)" 


    it "should allow teachers to edit student entries" 

  end

  context "delete entry" do
    before :once do
      @topic = create_topic(@course, :title => "topic", :message => "topic")
      @entry = create_entry(@topic, :message => "top-level entry")
    end

    it "should 401 if the user can't delete" 


    it "should soft-delete the entry" 


    it "should allow teachers to delete student entries" 

  end

  context "observer" do
    it "should allow observer by default" 


    it "should reject observer if read_forum role is false" 

  end

  context "read/unread state" do
    before(:once) do
      @topic = create_topic(@course, :title => "topic", :message => "topic")
      @entry = create_entry(@topic, :message => "top-level entry")
      @reply = create_reply(@entry, :message => "first reply")
    end

    it "should immediately mark messages you write as 'read'" 


    it "should be unread by default for a new user" 


    def call_mark_topic_read(course, topic)
      raw_api_call(:put, "/api/v1/courses/#{course.id}/discussion_topics/#{topic.id}/read.json",
                   {:controller => 'discussion_topics_api', :action => 'mark_topic_read', :format => 'json',
                    :course_id => course.id.to_s, :topic_id => topic.id.to_s})
    end

    def call_mark_topic_unread(course, topic)
      raw_api_call(:delete, "/api/v1/courses/#{course.id}/discussion_topics/#{topic.id}/read.json",
                   {:controller => 'discussion_topics_api', :action => 'mark_topic_unread', :format => 'json',
                    :course_id => course.id.to_s, :topic_id => topic.id.to_s})
    end

    it "should set the read state for a topic" 


    it "should be idempotent for setting topic read state" 


    def call_mark_entry_read(course, topic, entry)
      raw_api_call(:put, "/api/v1/courses/#{course.id}/discussion_topics/#{topic.id}/entries/#{entry.id}/read.json",
                   {:controller => 'discussion_topics_api', :action => 'mark_entry_read', :format => 'json',
                    :course_id => course.id.to_s, :topic_id => topic.id.to_s, :entry_id => entry.id.to_s})
    end

    def call_mark_entry_unread(course, topic, entry)
      raw_api_call(:delete, "/api/v1/courses/#{course.id}/discussion_topics/#{topic.id}/entries/#{entry.id}/read.json?forced_read_state=true",
                   {:controller => 'discussion_topics_api', :action => 'mark_entry_unread', :format => 'json',
                    :course_id => course.id.to_s, :topic_id => topic.id.to_s, :entry_id => entry.id.to_s, :forced_read_state => "true"})
    end

    it "should set the read state for a entry" 


    it "should be idempotent for setting entry read state" 


    def call_mark_all_as_read_state(new_state, opts = {})
      method = new_state == 'read' ? :put : :delete
      url = "/api/v1/courses/#{@course.id}/discussion_topics/#{@topic.id}/read_all.json"
      expected_params = {:controller => 'discussion_topics_api', :action => "mark_all_#{new_state}", :format => 'json',
                         :course_id => @course.id.to_s, :topic_id => @topic.id.to_s}
      if opts.has_key?(:forced)
        url << "?forced_read_state=#{opts[:forced]}"
        expected_params[:forced_read_state] = opts[:forced].to_s
      end
      raw_api_call(method, url, expected_params)
    end

    it "should allow mark all as read without forced update" 


    it "should allow mark all as unread with forced update" 

  end

  context "rating" do
    before(:once) do
      @topic = create_topic(@course, title: "topic", message: "topic", allow_rating: true)
      @entry = create_entry(@topic, message: "top-level entry")
      @reply = create_reply(@entry, message: "first reply")
    end

    def call_rate_entry(course, topic, entry, rating)
      raw_api_call(:post,
                   "/api/v1/courses/#{course.id}/discussion_topics/#{topic.id}/entries/#{entry.id}/rating.json",
                   {controller: 'discussion_topics_api', action: 'rate_entry', format: 'json',
                    course_id: course.id.to_s, topic_id: topic.id.to_s, entry_id: entry.id.to_s, rating: rating})
    end

    it "should rate an entry" 

  end

  context "subscribing" do
    before :once do
      student_in_course(:active_all => true)
      @topic1 = create_topic(@course, :user => @student)
      @topic2 = create_topic(@course, :user => @teacher, :require_initial_post => true)
    end

    def call_subscribe(topic, user, course=@course)
      @user = user
      raw_api_call(:put, "/api/v1/courses/#{course.id}/discussion_topics/#{topic.id}/subscribed",
                   {:controller => "discussion_topics_api", :action => "subscribe_topic", :format => "json", :course_id => course.id.to_s, :topic_id => topic.id.to_s})
    end

    def call_unsubscribe(topic, user, course=@course)
      @user = user
      raw_api_call(:delete, "/api/v1/courses/#{course.id}/discussion_topics/#{topic.id}/subscribed",
                   {:controller => "discussion_topics_api", :action => "unsubscribe_topic", :format => "json", :course_id => course.id.to_s, :topic_id => topic.id.to_s})
    end

    it "should allow subscription" 


    it "should allow unsubscription" 


    it "should be idempotent" 


    context "when initial_post_required" do
      it "should allow subscription with an initial post" 


      it "should not allow subscription without an initial post" 


      it "should allow unsubscription even without an initial post" 


      it "should unsubscribe a user if all their posts get deleted" 

    end
  end

  context "subscription holds" do
    it "should hold when an initial post is required" 


    it "should hold when the user isn't in a group set" 


    it "should hold when the user isn't in a group" 

  end

  describe "threaded discussions" do
    before :once do
      student_in_course(:active_all => true)
      @topic = create_topic(@course, :threaded => true)
      @entry = create_entry(@topic)
      @sub1 = create_reply(@entry)
      @sub2 = create_reply(@sub1)
      @sub3 = create_reply(@sub2)
      @side2 = create_reply(@entry)
      @entry2 = create_entry(@topic)
    end

    context "in the original API" do
      it "should respond with information on the threaded discussion" 


      it "should return nested discussions in a flattened format" 


      it "should allow posting a reply to a sub-entry" 


      it "should set and return editor_id if editing another user's post" 


      it "should fail if the max entry depth is reached" 

    end

    context "in the updated API" do
      it "should return a paginated entry_list" 


      it "should return deleted entries, but with limited data" 

    end
  end

  context "materialized view API" do
    it "should respond with the materialized information about the discussion" 


    it "can include extra information for context cards" 


    context "with mobile overrides" do
      before :once do
        course_with_teacher(:active_all => true)
        student_in_course(:course => @course, :active_all => true)
        @topic = @course.discussion_topics.create!(:title => "title", :message => "message", :user => @teacher, :discussion_type => 'threaded')
        @root1 = @topic.reply_from(:user => @student, :html => "root1")
        @reply1 = @root1.reply_from(:user => @teacher, :html => "reply1")

        # materialized view jobs are now delayed
        Timecop.travel(Time.now + 20.seconds) do
          run_jobs

          # make everything slightly in the past to test updating
          DiscussionEntry.update_all(:updated_at => 5.minutes.ago)
          @reply2 = @root1.reply_from(:user => @teacher, :html => "reply2")
        end

        account = @course.root_account
        bc = BrandConfig.create(mobile_css_overrides: 'somewhere.css')
        account.brand_config_md5 = bc.md5
        account.save!

        @tag = "<link rel=\"stylesheet\" href=\"somewhere.css\">"
      end

      it "should include mobile overrides in the html if not in-app" 


      it "should not include mobile overrides in the html if in-app" 

    end

    it "should include new entries if the flag is given" 


    it "should resolve the placeholder domain in new entries" 

  end

  it "returns due dates as they apply to the user" 


  describe "duplicate" do
    before :once do
      course_with_teacher(:active_all => true)
      @student = User.create!(:name => "foo", :short_name => "fo")
      student_in_course(:course => @course, :active_all => true)
      group_discussion_topic_model()
    end

    it "should check permissions" 


    it "cannot duplicate announcements" 


    it "should not duplicate child topics" 


    it "should 404 if topic does not exist" 


    it "should 404 if deleted" 


    it "duplicate works if teacher" 


    it "duplicate carries sections over" 


    it "duplicate publishes group context discussions if its a student duplicating" 


    it "duplicate does not publish group context discussions if its a teacher duplicating" 


    it "duplicate updates positions" 

  end

  context "public courses" do
    let(:announcements_view_api) {
      ->(user, course_id, announcement_id, status = 200) do
        old_at_user = @user
        @user = user # this is required because of api_call :-(
        json = api_call(
          :get,
          "/api/v1/courses/#{course_id}/discussion_topics/#{announcement_id}/view?include_new_entries=1",
          {
            controller: "discussion_topics_api",
            action: "view",
            format: "json",
            course_id: course_id.to_s,
            topic_id: announcement_id.to_s,
            include_new_entries: 1
          },
          {},
          {},
          {
            expected_status: status
          }
        )
        @user = old_at_user
        json
      end
    }

    before :each do
      course_with_teacher(active_all: true, is_public: true) # sets @teacher and @course
      account_admin_user(account: @course.account) # sets @admin
      @student1 = student_in_course(active_all: true).user
      @student2 = student_in_course(active_all: true).user

      @context = @course
      @announcement = announcement_model(user: @teacher) # sets @a

      s1e = @announcement.discussion_entries.create!(:user => @student1, :message => "Hello I'm student 1!")
      @announcement.discussion_entries.create!(:user => @student2, :parent_entry => s1e, :message => "Hello I'm student 2!")
    end

    context "should be shown" do
      let(:check_access) {
        ->(json) do
          expect(json["new_entries"]).not_to be_nil
          expect(json["new_entries"].count).to eq(2)
          expect(json["new_entries"].first["user_id"]).to eq(@student1.id)
          expect(json["new_entries"].second["user_id"]).to eq(@student2.id)
        end
      }

      it "shows student comments to students" 


      it "shows student comments to teachers" 


      it "shows student comments to admins" 

    end

    context "should not be shown" do
      let(:check_access) {
        ->(json) do
          expect(json["new_entries"]).to be_nil
          expect(%w[unauthorized unauthenticated]).to include(json["status"])
        end
      }

      before :each do
        prev_course = @course
        course_with_teacher
        @student = student_in_course.user
        @course = prev_course
      end

      it "does not show student comments to unauthenticated users" 


      it "does not show student comments to other students not in the course" 


      it "does not show student comments to other teachers not in the course" 

    end
  end

  it "should order Announcement items by posted_at rather than by position" 

end

def create_attachment(context, opts={})
  opts[:uploaded_data] ||= StringIO.new('attachment content')
  opts[:filename] ||= 'content.txt'
  opts[:display_name] ||= opts[:filename]
  opts[:folder] ||= Folder.unfiled_folder(context)
  attachment = context.attachments.build(opts)
  attachment.save!
  attachment
end

def create_topic(context, opts={})
  attachment = opts.delete(:attachment)
  opts[:user] ||= @user
  topic = context.discussion_topics.build(opts)
  topic.attachment = attachment if attachment
  topic.save!
  topic.publish if topic.unpublished?
  topic
end

def create_subtopic(topic, opts={})
  opts[:user] ||= @user
  subtopic = topic.context.discussion_topics.build(opts)
  subtopic.root_topic_id = topic.id
  subtopic.save!
  subtopic
end

def create_entry(topic, opts={})
  attachment = opts.delete(:attachment)
  created_at = opts.delete(:created_at)
  opts[:user] ||= @user
  entry = topic.discussion_entries.build(opts)
  entry.attachment = attachment if attachment
  entry.created_at = created_at if created_at
  entry.save!
  entry
end

def create_reply(entry, opts={})
  created_at = opts.delete(:created_at)
  opts[:user] ||= @user
  opts[:html] ||= opts.delete(:message)
  opts[:html] ||= "<p>This is a test message</p>"
  reply = entry.reply_from(opts)
  reply.created_at = created_at if created_at
  reply.save!
  reply
end

