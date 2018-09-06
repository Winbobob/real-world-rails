#
# Copyright (C) 2016 Instructure, Inc.
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

describe "Announcements API", type: :request do
  before :once do
    course_with_teacher :active_all => true
    student_in_course :active_enrollment => true
    @course1 = @course
    @ann1 = @course1.announcements.build :title => "Announcement 1", :message => '1'
    @ann1.posted_at = 7.days.ago
    @ann1.save!

    # For testing chronological ordering
    @anns = []

    1.upto(5) do |i|
      ann = @course1.announcements.build :title => "Accountment 1.#{i}", message: i
      ann.posted_at = (7 - i).days.ago # To make them more recent each time
      ann.save!

      @anns << ann
    end

    course_with_teacher :active_all => true, :user => @teacher
    student_in_course :active_enrollment => true, :user => @student
    @course2 = @course
    @ann2 = @course2.announcements.build :title => "Announcement 2", :message => '2'
    @ann2.workflow_state = 'post_delayed'
    @ann2.posted_at = Time.now
    @ann2.delayed_post_at = 21.days.from_now
    @ann2.save!

    @params = { :controller => 'announcements_api', :action => 'index', :format => 'json' }
  end

  context "as teacher" do
    it "requires course_ids argument" 


    it "does not accept contexts other than courses" 


    it "requires :read_announcements permission on all courses" 


    it "returns announcements for the the surrounding 14 days by default" 


    it "returns announcements for the given date range" 


    it "validates date formats" 


    it "matches dates inclusive" 


    it "paginates" 


    it "orders by reverse chronological order" 


    describe "active_only" do
      it "excludes delayed-post announcements" 


      it "includes 'active' announcements with past `delayed_post_at`" 


      it "excludes courses not in the context_ids list" 

    end
  end

  context "as student" do
    it "excludes delayed-post announcements" 


    it "excludes 'active' announcements with future `delayed_post_at`" 



    it "includes 'active' announcements with past `delayed_post_at`" 


    it "excludes courses not in the context_ids list" 

  end

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

    it "teacher should be able to see section specific announcements" 


    it "teacher should be able to see section specific announcements and include sections" 


    it "teacher should be able to see section specific announcements and include sections and sections user count" 


    it "student in section should be able to see section specific announcements" 


    it "student not in section should not be able to see section specific announcements" 

  end
end

