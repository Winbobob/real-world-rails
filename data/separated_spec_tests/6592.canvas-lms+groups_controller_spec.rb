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

describe GroupsController do
  before :once do
    course_with_teacher(:active_all => true)
    students = create_users_in_course(@course, 3, return_type: :record)
    @student1, @student2, @student3 = students
    @student = @student1
  end

  describe "GET context_index" do
    context "student context cards" do
      before(:once) do
        @course.root_account.enable_feature! :student_context_cards
      end

      it "is disabled when feature_flag is off" 


      it "is enabled for teachers when feature_flag is on" 


      it "is always disabled for students" 

    end

    it "should require authorization" 


    it "should assign variables" 


    it "should return groups in sorted by group category name, then group name for student view" 


    it "don't filter out inactive students if json and param set" 

  end

  describe "GET index" do
    it 'should split up current and previous groups' 


    it 'should not show restricted previous groups' 


    it 'should put groups in courses in terms concluded for students in "previous groups"' 


    describe 'pagination' do
      before :once do
        group_with_user(:group_context => @course, :user => @student, :active_all => true)
        group_with_user(:group_context => @course, :user => @student, :active_all => true)
      end

      before :each do
        user_session(@student)
      end

      it "should not paginate non-json" 


      it "should paginate json" 

    end
  end

  describe "GET show" do
    it "should require authorization" 


    it "should assign variables" 


    it "should allow user to join self-signup groups" 


    it "should allow user to leave self-signup groups" 


    it "should allow user to join student organized groups" 


    it "should allow user to leave student organized groups" 


    it "should allow teachers to view after conclusion" 

  end

  describe "GET new" do
    it "should require authorization" 

  end

  describe "POST add_user" do
    it "should require authorization" 


    it "should add user" 


    it "should check user section in restricted self-signup category" 

  end

  describe "DELETE remove_user" do
    it "should require authorization" 


    it "should remove user" 

  end

  describe "POST create" do
    it "should require authorization" 


    it "should create new group" 


    it "should honor group[group_category_id] when permitted" 


    it "should not honor group[group_category_id] when not permitted" 


    it "should fail when group[group_category_id] would be honored but doesn't exist" 


    describe "quota" do
      before do
        Setting.set('group_default_quota', 11.megabytes)
      end

      context "teacher" do
        before do
          user_session(@teacher)
        end

        it "should ignore the storage_quota_mb parameter" 

      end

      context "account admin" do
        before do
          account_admin_user
          user_session(@admin)
        end

        it "should set the storage_quota_mb parameter" 

      end
    end
  end

  describe "PUT update" do
    it "should require authorization" 


    it "should update group" 


    it "should honor group[group_category_id]" 


    it "should fail when group[group_category_id] doesn't exist" 


    it "should be able to unset a leader" 


    describe "quota" do
      before :once do
        @group = @course.groups.build(:name => "teh gruop")
        @group.storage_quota_mb = 11
        @group.save!
      end

      context "teacher" do
        before do
          user_session(@teacher)
        end

        it "should ignore the quota parameter" 

      end

      context "account admin" do
        before do
          account_admin_user
          user_session(@admin)
        end

        it "should update group quota" 

      end
    end
  end

  describe "DELETE destroy" do
    it "should require authorization" 


    it "should delete group" 

  end

  describe "GET 'unassigned_members'" do
    it "should include all users if the category is student organized" 


    it "should include only users not in a group in the category otherwise" 


    it "should include the users' sections when available" 

  end

  describe "GET 'context_group_members'" do
    it "should include the users' sections when available" 


    it "should require :read_roster permission" 

  end

  describe "GET 'public_feed.atom'" do
    before :once do
      group_with_user(:active_all => true)
      @group.discussion_topics.create!(:title => "hi", :message => "intros", :user => @user)
    end

    it "should require authorization" 


    it "should include absolute path for rel='self' link" 


    it "should include an author for each entry" 

  end

  describe "GET 'accept_invitation'" do
    before :once do
      @communities = GroupCategory.communities_for(Account.default)
      group_model(:group_category => @communities)
      user_factory(active_user: true)
      @membership = @group.add_user(@user, 'invited', false)
    end

    before :each do
      user_session(@user)
    end

    it "should successfully create invitations" 


    it "should reject an invalid invitation uuid" 

  end

  describe "GET users" do
    before :each do
      category = @course.group_categories.create(:name => "Study Groups")
      @group = @course.groups.create(:name => "some group", :group_category => category)
      @group.add_user(@student)

      assignment = @course.assignments.create({
        :name => "test assignment",
        :group_category => category
      })
      file = Attachment.create! context: @student, filename: "homework.pdf", uploaded_data: StringIO.new("blah blah blah")
      @sub = assignment.submit_homework(@student, attachments: [file], submission_type: "online_upload")
    end

    it "should include group submissions if param is present" 


    it "should not include group submissions if param is absent" 


    describe "inactive students" do
      before :once do
        course_with_teacher(:active_all => true)
        students = create_users_in_course(@course, 3, return_type: :record)
        @student1, @student2, @student3 = students
        category1 = @course.group_categories.create(:name => "category 1")
        @group = @course.groups.create(:name => "some group", :group_category => category1)
        @group.add_user(@student1)
        @group.add_user(@student2)
        @group.add_user(@student3)
        @student2.enrollments.first.deactivate
        @student3.enrollments.first.update_attributes(:start_at => 1.day.from_now, :end_at => 2.days.from_now) # technically "inactive" but not really
      end

      it "include active status if requested" 


      it "don't include active status if not requested" 

    end
  end
end

