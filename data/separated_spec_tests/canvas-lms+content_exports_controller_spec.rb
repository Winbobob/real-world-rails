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

describe ContentExportsController do
  describe "POST 'create'" do
    it "should explicitly export everything" 

  end

  describe 'GET xml_schema' do
    describe 'with a valid file' do
      let(:filename) { 'cccv1p0' }
      let(:full_path) { Rails.root + "lib/cc/xsd/#{filename}.xsd" }
      before { get 'xml_schema', params: {:version => filename} }

      it 'sends in the entire file' 


      it 'recognizes the file as xml' 


    end

    describe 'with a nonexistant file' do
      before { get 'xml_schema', params: {:version => 'notafile'} }

      it 'returns a 404' 


      it 'renders the 404 template' 

    end
  end

  describe 'export visibility' do
    context 'course' do
      before(:once) do
        course_factory active_all: true
        course_with_ta(course: @course, active_all: true)
        student_in_course(course: @course, active_all: true)
        @acx = factory_with_protected_attributes(@course.content_exports, user: @ta, export_type: 'common_cartridge')
        @tcx = factory_with_protected_attributes(@course.content_exports, user: @teacher, export_type: 'common_cartridge')
        @tzx = factory_with_protected_attributes(@course.content_exports, user: @teacher, export_type: 'zip')
        @szx = factory_with_protected_attributes(@course.content_exports, user: @student, export_type: 'zip')
      end

      describe "index" do
        it "returns all course exports + the teacher's file exports" 

      end

      describe "show" do
        it "should find course exports" 


        it "should find teacher's file exports" 


        it "should not find other's file exports" 

      end
    end

    context "user" do
      before(:once) do
        course_factory active_all: true
        student_in_course(course: @course, active_all: true)
        @tzx = factory_with_protected_attributes(@student.content_exports, user: @teacher, export_type: 'zip')
        @sdx = factory_with_protected_attributes(@student.content_exports, user: @student, export_type: 'user_data')
        @szx = factory_with_protected_attributes(@student.content_exports, user: @student, export_type: 'zip')
      end

      describe "index" do
        it "should show one's own exports" 

      end

      describe "show" do
        it "should find one's own export" 


        it "should not find another's export" 

      end
    end
  end
end

