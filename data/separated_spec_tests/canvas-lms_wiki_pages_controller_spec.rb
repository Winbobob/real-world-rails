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

describe WikiPagesController do
  before do
    course_with_teacher_logged_in(active_all: true)
    @wiki = @course.wiki
  end

  describe "GET 'front_page'" do
    it "should redirect" 


    it "sets up js_env for view_all_pages link" 

  end

  context "with page" do
    before do
      @page = @course.wiki_pages.create!(title: "ponies5ever", body: "")
    end

    describe "GET 'show_redirect'" do
      it "should redirect" 

    end

    describe "GET 'show'" do
      it "should render" 

    end

    describe "GET 'edit'" do
      it "should render" 

    end

    describe "GET 'revisions'" do
      it "should render" 

    end

    context "differentiated assignments" do
      before do
        assignment = @course.assignments.create!(
          submission_types: 'wiki_page',
          only_visible_to_overrides: true
        )
        @page.assignment = assignment
        @page.editing_roles = "teachers,students"
        @page.save!

        @student_with_override, @student_without_override = create_users(2, return_type: :record)
        @section = @course.course_sections.create!(name: "test section")
        create_section_override_for_assignment(assignment, course_section: @section)
      end

      context "for unassigned students" do
        before do
          @course.enroll_student(@student_without_override, enrollment_state: 'active')
          user_session(@student_without_override)
        end

        it "should allow show" 


        it "should allow edit" 


        it "should allow revisions" 


        context "feature enabled" do
          before do
            allow(ConditionalRelease::Service).to receive(:configured?).and_return(true)
            @course.enable_feature!(:conditional_release)
          end

          it "should forbid show" 


          it "should forbid edit" 


          it "should forbid revisions" 

        end
      end

      context "for assigned students" do
        before do
          student_in_section(@section, user: @student_with_override)
          user_session(@student_with_override)
        end

        it "should allow show" 


        it "should allow edit" 


        it "should allow revisions" 

      end
    end
  end
end

