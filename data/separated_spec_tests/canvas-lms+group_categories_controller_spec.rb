#
# Copyright (C) 2012 - present Instructure, Inc.
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

describe GroupCategoriesController do
  before :once do
    course_with_teacher(:active_all => true)
    student_in_course(:active_all => true)
  end

  describe "POST create" do
    it "should require authorization" 


    it "should assign variables" 


    it "should give the new groups the right group_category" 


    it "should error if the group name is protected" 


    it "should error if the group name is already in use" 


    it "should require the group name" 


    it "should respect enable_self_signup" 


    it "should use create_group_count when self-signup" 


    it "respects auto_leader params" 


    it "should respect the max new-category group count" 


    it "should not distribute students when self-signup" 


    it "should respect restrict_self_signup" 

  end

  describe "PUT update" do
    before :once do
      @group_category = @course.group_categories.create(:name => "My Category")
    end

    it "should require authorization" 


    it "should update category" 


    it "should leave the name alone if not given" 


    it "should not accept a sent but empty name" 


    it "should error if the name is protected" 


    it "should error if the name is already in use" 


    it "should not error if the name is the current name" 


    it "should error if restrict_self_signups is specified but the category has heterogenous groups" 

  end

  describe "DELETE delete" do
    it "should require authorization" 


    it "should delete the category and groups" 


    it "should fail if category doesn't exist" 


    it "should fail if category is protected" 

  end

  describe "GET users" do
    before :each do
      @category = @course.group_categories.create(:name => "Study Groups")
      group = @course.groups.create(:name => "some group", :group_category => @category)
      group.add_user(@student)

      assignment = @course.assignments.create({
        :name => "test assignment",
        :group_category => @category
      })
      file = Attachment.create! context: @student, filename: "homework.pdf", uploaded_data: StringIO.new("blah blah blah")
      @sub = assignment.submit_homework(@student, attachments: [file], submission_type: "online_upload")
    end

    it "should include group submissions if param is present" 


    it "should not include group submissions if param is absent" 

  end

end

