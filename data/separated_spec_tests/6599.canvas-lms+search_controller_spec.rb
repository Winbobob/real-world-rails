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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SearchController do

  describe "GET 'recipients'" do
    it "should assign variables" 


    it "should sort alphabetically" 


    it "should optionally show users who haven't finished registration" 


    it "should allow filtering out non-messageable courses" 


    it "should return an empty list when searching in a non-messageable context" 


    it "should handle groups in courses without messageable enrollments" 


    context "with admin_context" do
      it "should return nothing if the user doesn't have rights" 


      it "should return sub-contexts" 


      it "should return sub-users" 

    end

    context "with section privilege limitations" do
      before do
        course_with_teacher_logged_in(:active_all => true)
        @section = @course.course_sections.create!(:name => 'Section1')
        @section2 = @course.course_sections.create!(:name => 'Section2')
        @enrollment.update_attribute(:course_section, @section)
        @enrollment.update_attribute(:limit_privileges_to_course_section, true)
        @student1 = user_with_pseudonym(:active_all => true, :name => 'Student1', :username => 'student1@instructure.com')
        @section.enroll_user(@student1, 'StudentEnrollment', 'active')
        @student2 = user_with_pseudonym(:active_all => true, :name => 'Student2', :username => 'student2@instructure.com')
        @section2.enroll_user(@student2, 'StudentEnrollment', 'active')
      end

      it "should exclude non-messageable contexts" 


      it "should exclude non-messageable users" 

    end
  end

  describe "GET 'all_courses'" do
    before(:once) do
      @c1 = course_factory(course_name: 'foo', active_course: true)
      @c2 = course_factory(course_name: 'bar', active_course: true)
      @c2.update_attribute(:indexed, true)
    end

    it "returns indexed courses" 


    it "searches" 


    it "doesn't explode with non-string searches" 


    it "does not cache XHR requests" 

  end

end

