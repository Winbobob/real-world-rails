#
# Copyright (C) 2012 - 2014 Instructure, Inc.
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

describe SectionsController, type: :request do
  describe '#index' do
    let(:user_api_fields) { %w(id name sortable_name short_name) }

    before :once do
      course_with_teacher(:active_all => true, :user => user_with_pseudonym(:name => 'UWP'))
      @me = @user
      @course1 = @course
      course_with_student(:user => @user, :active_all => true)
      @course2 = @course
      @course2.update_attribute(:sis_source_id, 'TEST-SIS-ONE.2011')
      @user.pseudonym.update_attribute(:sis_user_id, 'user1')
    end

    it "should return the list of sections for a course" 


    it "should return the list of enrollments if 'students' and 'enrollments' flags are given" 


    it "should return the count of active and invited students if 'total_students' flag is given" 


    it "should not return deleted sections" 


    it "should respect ?per_page=n" 


    it "should return sections but not students if user has :read but not :read_roster, :view_all_grades, or :manage_grades" 


    it "should return all sections if :all are specified" 

  end

  describe "#show" do
    before :once do
      course_with_teacher
      @section = @course.default_section
    end

    context "scoped by course" do
      before do
        @path_prefix = "/api/v1/courses/#{@course.id}/sections"
        @path_params = { :controller => 'sections', :action => 'show', :course_id => @course.to_param, :format => 'json' }
      end

      it "should be accessible from the course" 


      it "should return the count of active and invited students if 'total_students' flag is given" 


      it "should not include test students" 


      it "should be accessible from the course context via sis id" 


      it "should scope course sections to the course" 

    end

    context "unscoped" do
      before do
        @path_prefix = "/api/v1/sections"
        @path_params = { :controller => 'sections', :action => 'show', :format => 'json' }
      end

      it "should be accessible without a course context" 


      it "should be accessible without a course context via sis id" 


      it "should be accessible without a course context via integration id" 


      it "should not be accessible if the associated course is not accessible" 

    end

    context "as an admin" do
      before :once do
        site_admin_user
        @section = @course.default_section
        @path_prefix = "/api/v1/courses/#{@course.id}/sections"
        @path_params = { :controller => 'sections', :action => 'show', :course_id => @course.to_param, :format => 'json' }
      end

      it "should show sis information" 

    end
  end

  describe "#create" do
    before :once do
      course_factory
      @path_prefix = "/api/v1/courses/#{@course.id}/sections"
      @path_params = { :controller => 'sections', :action => 'create', :course_id => @course.to_param, :format => 'json' }
    end

    context "as teacher" do
      before :once do
        course_with_teacher :course => @course
      end

      it "should create a section with default parameters" 


      it "should find the course by SIS ID" 


      it "should create a section with custom parameters" 


      it "should fail if the context is deleted" 


      it "should ignore the sis source id parameter" 

    end

    context "as student" do
      before do
        course_with_student_logged_in(:course => @course)
      end

      it "should disallow creating a section" 

    end

    context "as admin" do
      before do
        site_admin_user
      end

      it "should set the sis source id and integration_id" 


      it "should set the integration_id by itself" 


      it "should allow reactivating deleting sections using sis_section_id" 


      it "should raise an error trying to reactivate an active section" 


      it "should carry on if there's no section to reactivate" 

    end
  end

  describe "#update" do
    before :once do
      course_factory
      @section = @course.course_sections.create! :name => "Test Section"
      @section.update_attribute(:sis_source_id, "SISsy")
      @path_prefix = "/api/v1/sections"
      @path_params = { :controller => 'sections', :action => 'update', :format => 'json' }
    end

    context "as teacher" do
      before :once do
        course_with_teacher :course => @course
      end

      it "should modify section data by id" 


      it "should modify section data by sis id" 


      it "should behave gracefully if the course_section parameter is missing" 


      it "should fail if the section is deleted" 


      it "should fail if the context is deleted" 


      it 'should return unauthorized when changing sis attributes' 

    end

    context "as student" do
      before do
        course_with_student_logged_in(:course => @course)
      end

      it "should disallow modifying a section" 

    end

    context "as admin" do
      before do
        site_admin_user
      end

      it 'should set integration_id' 


      it 'should not change sis attributes when not passed' 


      it "should set the sis id" 

    end
  end

  describe "#delete" do
    before :once do
      course_factory
      @section = @course.course_sections.create! :name => "Test Section"
      @section.update_attribute(:sis_source_id, "SISsy")
      @path_prefix = "/api/v1/sections"
      @path_params = { :controller => 'sections', :action => 'destroy', :format => 'json' }
    end

    context "as teacher" do
      before :once do
        course_with_teacher :course => @course
      end

      it "should delete a section by id" 


      it "should delete a section by sis id" 


      it "should fail to delete a section with enrollments" 


      it "should fail if the section is deleted" 


      it "should fail if the context is deleted" 

    end

    context "as student" do
      before do
        course_with_student_logged_in :course => @course
      end

      it "should disallow deleting a section" 

    end
  end

  describe "#crosslist" do
    before :once do
      @dest_course = course_factory
      course_factory
      @section = @course.course_sections.create!
      @params = { :controller => 'sections', :action => 'crosslist', :format => 'json' }
    end

    context "as admin" do
      before :once do
        site_admin_user
      end

      it "should cross-list a section" 


      it "should work with sis IDs" 



      it "should fail if the section is deleted" 


      it "should fail if the destination course is deleted" 


      it "should fail if the destination course is under a different root account" 


      it "should confirm crosslist by sis id" 


      it "should not confirm crosslisting when the caller lacks :manage rights on the destination course" 

    end

    context "as teacher" do
      before do
        course_with_teacher_logged_in :course => @course
      end

      it "should disallow cross-listing a section" 

    end
  end

  describe "#uncrosslist" do
    before :once do
      @dest_course = course_factory
      course_factory
      @section = @course.course_sections.create!
      @section.crosslist_to_course(@dest_course)
      @params = { :controller => 'sections', :action => 'uncrosslist', :format => 'json' }
    end

    context "as admin" do
      before :once do
        site_admin_user
      end

      it "should un-crosslist a section" 


      it "should work by SIS ID" 


      it "should fail if the section is not crosslisted" 


      it "should fail if the section is deleted" 


      it "should un-delete the original course" 


      it "should fail if the crosslisted course is deleted" 

    end

    context "as teacher" do
      before do
        course_with_teacher_logged_in(:course => @course)
      end

      it "should disallow un-crosslisting" 

    end
  end
end

