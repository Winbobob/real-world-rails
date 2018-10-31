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

describe ConversationsController do
  def conversation(opts = {})
    num_other_users = opts[:num_other_users] || 1
    course = opts[:course] || @course
    user_data = num_other_users.times.map{ {name: "User"} }
    users = create_users_in_course(course, user_data, account_associations: true, return_type: :record)
    @conversation = @user.initiate_conversation(users)
    @conversation.add_message(opts[:message] || 'test')
    @conversation.conversation.update_attribute(:context, course)
    @conversation
  end

  describe "GET 'index'" do
    before :once do
      course_with_student(:active_all => true)
    end

    it "should require login" 


    it "should assign variables" 


    it "should assign variables for json" 


    it "should work for an admin as well" 


    it "should return all sent conversations" 


    it "should return conversations matching the specified filter" 


    it "should use the boolean operation in filter_mode when combining multiple filters" 


    it "should return conversations matching a user filter" 


    it "should not allow student view student to load inbox" 


    context "masquerading" do
      before :once do
        a = Account.default
        @student = user_with_pseudonym(:active_all => true)
        course_with_student(:active_all => true, :account => a, :user => @student)
        @student.initiate_conversation([user_factory]).add_message('test1', :root_account_id => a.id)
        @student.initiate_conversation([user_factory]).add_message('test2') # no root account, so teacher can't see it

        course_with_teacher(:active_all => true, :account => a)
        a.account_users.create!(user: @user)
      end

      before :each do
        user_session(@teacher)
        session[:become_user_id] = @student.id
      end

      it "should filter conversations" 


      it "should filter conversations when returning ids" 


      it "should recompute inbox count" 

    end
  end

  describe "GET 'show'" do
    before :once do
      course_with_student(:active_all => true)
    end

    before :each do
      user_session(@student)
      conversation
    end

    it "should redirect if not xhr" 


    it "should assign variables" 

  end

  describe "POST 'create'" do
    before :once do
      course_with_teacher(active_all: true)
      student_in_course(active_all: true)
    end

    it "should create the conversation" 


    it "should require permissions for sending to other students" 


    it "should allow sending to instructors even if permissions are disabled" 


    it "should not add the wrong tags in a certain terrible cached edge case" 


    it "should allow messages to be forwarded from the conversation" 


    context "group conversations" do
      before :once do
        @old_count = Conversation.count

        @new_user1 = User.create
        @course.enroll_student(@new_user1).accept!

        @new_user2 = User.create
        @course.enroll_student(@new_user2).accept!

        @account_id = @course.account_id
      end

      before :each do
        user_session(@teacher)
      end

      ["1", "true", "yes", "on"].each do |truish|
        it "should create a conversation shared by all recipients if group_conversation=#{truish.inspect}" 

      end

      [nil, "", "0", "false", "no", "off", "wat"].each do |falsish|
        it "should create one conversation per recipient if group_conversation=#{falsish.inspect}" 

      end

      it "should set the root account id to the participants for group conversations" 


      it "should set the root account id to the participants for bulk private messages" 

    end

    it "should correctly infer context tags" 


    it "should populate subject" 


    it "should populate subject on batch conversations" 


    context "user_notes" do
      before :each do
        Account.default.update_attribute :enable_user_notes, true
        user_session(@teacher)

        @students = create_users_in_course(@course, 2, account_associations: true, return_type: :record)
      end

      it "should create user notes" 

    end
  end

  describe "POST 'update'" do
    it "should update the conversation" 

  end

  describe "POST 'add_message'" do
    it "should add a message" 


    it "should require permissions" 


    it "should queue a job if needed" 


    it "should generate a user note when requested" 

  end

  describe "POST 'add_recipients'" do
    before :once do
      course_with_student(:active_all => true)
      conversation(:num_other_users => 2)
    end
    before(:each) { user_session(@student) }

    it "should add recipients" 


    it "should correctly infer context tags" 

  end

  describe "POST 'remove_messages'" do
    before(:once) { course_with_student(active_all: true) }
    before(:each) { user_session(@student) }

    it "should remove messages" 


    it "should null a conversation_participant's last_message_at if all message_participants have been destroyed" 

  end

  describe "DELETE 'destroy'" do
    it "should delete conversations" 

  end

  describe "GET 'public_feed.atom'" do
    before :once do
      course_with_student(:course_name => "Message Course", :active_all => true)
    end

    it "should require authorization" 


    it "should return basic feed attributes" 


    it "should include message entries" 


    it "should not include messages the user is not a part of" 


    it "should include part the message text in the title" 


    it "should include the message in the content" 


    it "should include context about the conversation" 


    it "should include an attachment if one exists" 

  end

  describe "POST 'toggle_new_conversations'" do
    before :each do
      course_with_student_logged_in(:active_all => true)
    end

    it "should not disable new conversations for a user anymore" 

  end

  context "sharding" do
    specs_require_sharding

    describe 'index' do
      it "should list conversation_ids across shards" 

    end

    describe "show" do
      it "should find conversations across shards" 

    end
  end
end

