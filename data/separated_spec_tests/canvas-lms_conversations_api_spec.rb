#
# Copyright (C) 2011 - 2013 Instructure, Inc.
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
require File.expand_path(File.dirname(__FILE__) + '/../../sharding_spec_helper')

describe ConversationsController, type: :request do
  before :once do
    @other = user_factory(active_all: true)

    course_with_teacher(:active_course => true, :active_enrollment => true, :user => user_with_pseudonym(:active_user => true))
    @course.update_attribute(:name, "the course")
    @course.account.role_overrides.create!(permission: 'send_messages_all', role: teacher_role, enabled: false)
    @course.default_section.update_attributes(:name => "the section")
    @other_section = @course.course_sections.create(:name => "the other section")
    @me = @user

    @bob = student_in_course(:name => "bob smith", :short_name => "bob")
    @billy = student_in_course(:name => "billy")
    @jane = student_in_course(:name => "jane")
    @joe = student_in_course(:name => "joe")
    @tommy = student_in_course(:name => "tommy", :section => @other_section)
  end

  def student_in_course(options = {})
    section = options.delete(:section)
    u = User.create(options)
    enrollment = @course.enroll_user(u, 'StudentEnrollment', :section => section)
    enrollment.workflow_state = 'active'
    enrollment.save
    u
  end

  context "conversations" do
    it "should return the conversation list" 


    it "should properly respond to include[]=participant_avatars" 


    it "should ignore include[]=participant_avatars if you're going to break everything" 


    it "should stringify audience ids if requested" 


    it "should paginate and return proper pagination headers" 


    it "should filter conversations by scope" 


    describe "context_name" do
      before :once do
        @c1 = conversation(@bob, :workflow_state => 'read') # implicit tag from shared context
        @c2 = conversation(@bob, @billy, :workflow_state => 'unread', :subscribed => false) # manually specified context which would not be implied
        course_with_student(:course_name => 'the other course')
        conversation = @c2.conversation
        conversation.context = @course
        conversation.save!
        @c2.save!
        @c3 = conversation(@student) # no context
        @user = @me
      end

      describe 'index' do
        it "should prefer the context but fall back to the first context tag" 

      end

      describe 'show' do
        it "should prefer the context but fall back to the first context tag" 

      end
    end

    context "filtering by tags" do
      specs_require_sharding

      before :once do
        @conversations = []
      end

      def verify_filter(filter)
        @user = @me
        json = api_call(:get, "/api/v1/conversations.json?filter=#{filter}",
                { :controller => 'conversations', :action => 'index', :format => 'json', :filter => filter })
        expect(json.size).to eq @conversations.size
        expect(json.map{ |item| item["id"] }.sort).to eq @conversations.map(&:conversation_id).sort
      end

      context "tag context on default shard" do
        before :once do
          Shard.default.activate do
            account = Account.create!
            course_with_teacher(:account => account, :active_course => true, :active_enrollment => true, :user => @me)
            @course.update_attribute(:name, "another course")
            @alex = student_in_course(:name => "alex")
            @buster = student_in_course(:name => "buster")
          end

          @conversations << conversation(@alex)
          @conversations << @shard1.activate{ conversation(@buster) }
        end

        it "should recognize filter on the default shard" 


        it "should recognize filter on an unrelated shard" 


        it "should recognize explicitly global filter on the default shard" 

      end

      context "tag context on non-default shard" do
        before :once do
          @shard1.activate do
            account = Account.create!
            course_with_teacher(:account => account, :active_course => true, :active_enrollment => true, :user => @me)
            @course.update_attribute(:name, "the course 2")
            @alex = student_in_course(:name => "alex")
            @buster = student_in_course(:name => "buster")
          end

          @conversations << @shard1.activate{ conversation(@alex) }
          @conversations << conversation(@buster)
        end

        it "should recognize filter on the default shard" 


        it "should recognize filter on the context's shard" 


        it "should recognize filter on an unrelated shard" 


        it "should recognize explicitly global filter on the context's shard" 

      end

      context "tag user on default shard" do
        before :once do
          Shard.default.activate do
            account = Account.create!
            course_with_teacher(:account => account, :active_course => true, :active_enrollment => true, :user => @me)
            @course.update_attribute(:name, "another course")
            @alex = student_in_course(:name => "alex")
          end

          @conversations << conversation(@alex)
        end

        it "should recognize filter on the default shard" 


        it "should recognize filter on an unrelated shard" 

      end

      context "tag user on non-default shard" do
        before :once do
          @shard1.activate do
            account = Account.create!
            course_with_teacher(:account => account, :active_course => true, :active_enrollment => true)
            @course.update_attribute(:name, "the course 2")
            @alex = student_in_course(:name => "alex")
            @me = @teacher
          end

          @conversations << @shard1.activate{ conversation(@alex) }
        end

        it "should recognize filter on the default shard" 


        it "should recognize filter on the user's shard" 


        it "should recognize filter on an unrelated shard" 

      end
    end

    context "sent scope" do
      it "should sort by last authored date" 


      it "should include conversations with at least one message by the author, regardless of workflow_state" 

    end

    it "should show the calculated audience_contexts if the tags have not been migrated yet" 


    it "should include starred conversations in starred scope regardless of if read or archived" 


    it "should not include unstarred conversations in starred scope regardless of if read or archived" 


    it "should mark all conversations as read" 


    context "create" do

      it "should render error if no body is provided" 


      it "should create a private conversation" 


      it "should add a context to a private conversation" 


      it "should not re-use a private conversation with a different explicit context" 


      it "should re-use a private conversation with an old contextless private hash if the original context matches" 


      describe "context is an account for admins validation" do
        it "should allow root account context if the user is an admin on that account" 


        it "should not allow account context if the user is not an admin in that account" 


        it "should allow an admin to send a message in course context" 


        it "should always have the right tags when sending a bulk message in course context" 


        it "allows users to send messages to themselves" 


        it "should allow site admin to set any account context" 


        context "sub-accounts" do
          before :once do
            @sub_account = Account.default.sub_accounts.build(name: "subby")
            @sub_account.root_account_id = Account.default.id
            @sub_account.save!
            account_admin_user(account: @sub_account, name: "sub admin", active_all: true)
          end

          it "should allow root account context if the user is an admin on a sub-account" 


          it "should not allow non-root account context" 

        end
      end

      it "should create a group conversation" 


      context "private conversations" do
        # set up a private conversation in advance
        before(:once) { @conversation = conversation(@bob) }

        it "should update the private conversation if it already exists" 


        it "should create/update bulk private conversations synchronously" 


        it "should set the context on new synchronous bulk private conversations" 


        it "constraints the length of the subject of a conversation batch" 


        it "should create/update bulk private conversations asynchronously" 


        it "should set the context on new asynchronous bulk private conversations" 

      end

      it "should create a conversation with forwarded messages" 


      context "cross-shard message forwarding" do
        specs_require_sharding

        it "should not asplode" 

      end

      it "should set subject" 


      it "should set subject on batch conversations" 


      it "should constrain subject length" 


      it "respects course's send_messages_all permission" 


      it "requires send_messages_all to send to all students" 


      it "does not require send_messages_all to send to all teachers" 


      it "should send bulk group messages" 


      it "should send bulk group messages with a single recipient" 

    end
  end

  context "conversation" do
    it "should return the conversation" 


    it "should indicate if conversation permissions for the context are missing" 


    it "should not explode on account group conversations" 


    it "should still include attachment verifiers when using session auth" 


    it "should use participant's last_message_at and not consult the most recent message" 


    context "sharding" do
      specs_require_sharding

      def check_conversation
        json = api_call(:get, "/api/v1/conversations/#{@conversation.conversation_id}",
                        { :controller => 'conversations', :action => 'show', :id => @conversation.conversation_id.to_s, :format => 'json' })
        json.delete("avatar_url")
        json["participants"].each{ |p|
          p.delete("avatar_url")
        }
        json["messages"].each {|m| m["participating_user_ids"].sort!}
        json.delete("last_authored_message_at") # This is sometimes not updated. It's a known bug.
        expected = {
          "id" => @conversation.conversation_id,
          "subject" => nil,
          "workflow_state" => "read",
          "last_message" => "test",
          "last_message_at" => @conversation.last_message_at.to_json[1, 20],
          "last_authored_message" => "test",
          # "last_authored_message_at" => @conversation.last_message_at.to_json[1, 20],
          "message_count" => 1,
          "subscribed" => true,
          "private" => true,
          "starred" => false,
          "properties" => ["last_author"],
          "visible" => true,
          "audience" => [@bob.id],
          "audience_contexts" => {
              "groups" => {},
              "courses" => {@course.id.to_s => ["StudentEnrollment"]}
          },
          "participants" => [
              {"id" => @me.id, "name" => @me.short_name, "full_name" => @me.name, "common_courses" => {}, "common_groups" => {}},
              {"id" => @bob.id, "name" => @bob.short_name, "full_name" => @bob.name, "common_courses" => {@course.id.to_s => ["StudentEnrollment"]}, "common_groups" => {}}
          ],
          "messages" => [
              {"id" => @conversation.messages.last.id, "created_at" => @conversation.messages.last.created_at.to_json[1, 20], "body" => "test", "author_id" => @me.id, "generated" => false, "media_comment" => nil, "forwarded_messages" => [], "attachments" => [], "participating_user_ids" => [@me.id, @bob.id].sort}
          ],
          "submissions" => [],
          "context_name" => @conversation.context_name,
          "context_code" => @conversation.conversation.context_code,
        }
        expect(json).to eq expected
      end

      it "should show ids relative to the current shard" 

    end

    it "should auto-mark-as-read if unread" 


    it "should not auto-mark-as-read if auto_mark_as_read = false" 


    it "should properly flag if starred in the response" 


    it "should not link submission comments and conversations anymore" 


    it "should add a message to the conversation" 


    it "should only add participants for the new message to the given recipients" 


    it "should return an error if trying to add more participants than the maximum group size on add_message" 


    it "should add participants for the given messages to the given recipients" 


    it "should exclude participants that aren't in the recipient list" 


    it "should add message participants for all conversation participants (if recipients are not specified) to included messages only" 


    it "should allow users to respond to admin initiated conversations" 


    it "should allow users to respond to anyone who is already a participant" 


    it "should create a media object if it doesn't exist" 


    it "should add recipients to the conversation" 


    it "should return an error if trying to add more participants than the maximum group size on add_recipients" 


    it "should not cache an old audience when adding recipients" 


    it "should update the conversation" 


    it "should be able to star the conversation via update" 


    it "should be able to unstar the conversation via update" 


    it "should leave starryness alone when left out of update" 


    it "should delete messages from the conversation" 


    it "should delete the conversation" 

  end

  context "recipients" do
    before :once do
      @group = @course.groups.create(:name => "the group")
      @group.users = [@me, @bob, @joe]
    end

    it "should support the deprecated route" 

  end

  context "batches" do
    it "should return all in-progress batches" 

  end

  describe "visibility inference" do
    it "should not break with empty string as filter" 

  end

  describe "bulk updates" do
    let_once(:c1) { conversation(@me, @bob, :workflow_state => 'unread') }
    let_once(:c2) { conversation(@me, @jane, :workflow_state => 'read') }
    let_once(:conversation_ids) { [c1,c2].map {|c| c.conversation.id} }

    it "should mark conversations as read" 


    it "should mark conversations as unread" 


    it "should mark conversations as starred" 


    it "should mark conversations as unstarred" 


    # it "should mark conversations as subscribed"
    # it "should mark conversations as unsubscribed"
    it "should archive conversations" 


    it "should destroy conversations" 


    describe "immediate failures" do
      it "should fail if event is invalid" 


      it "should fail if event parameter is not specified" 


      it "should fail if conversation_ids is not specified" 


      it "should fail if batch size limit is exceeded" 

    end

    describe "progress" do
      it "should create and update a progress object" 


      describe "progress failures" do
        it "should not update conversations the current user does not participate in" 


        it "should fail if all conversation ids are invalid" 


        it "should fail progress if exception is raised in job" 

      end
    end
  end

  describe "delete_for_all" do
    it "should require site_admin with manage_students permissions" 


    it "should fail if conversation doesn't exist" 


    it "should delete the conversation for all participants" 


    context "sharding" do
      specs_require_sharding

      it "should delete the conversation for users on multiple shards" 

    end
  end

  describe 'unread_count' do
    it 'should return the number of unread conversations for the current user' 

  end

  context 'deleted_conversations' do
    before :once do
      @me = nil
      @c1 = conversation(@bob)
      @c1.remove_messages(:all)

      @c2 = conversation(@billy)
      @c2.remove_messages(:all)

      account_admin_user(:account => Account.site_admin)
    end

    it 'returns a list of deleted conversation messages' 


    it 'returns a paginated response with proper link headers' 


    it 'can respond with multiple users data' 


    it 'will only get the provided conversation id' 


    it 'can filter based on the deletion date' 

  end

  context 'restore_message' do
    before :once do
      @me = nil
      @c1 = conversation(@bob)

      account_admin_user(:account => Account.site_admin)
    end

    before :each do
      @c1.remove_messages(:all)
      @c1.message_count = 0
      @c1.last_message_at = nil
      @c1.save!
    end

    it 'returns an error when the conversation_message_id is not provided' 


    it 'returns an error when the user_id is not provided' 


    it 'returns an error when the conversation_id is not provided' 


    it 'restores the message' 


    it 'updates the message count and last_message_at on the conversation' 

  end

end

