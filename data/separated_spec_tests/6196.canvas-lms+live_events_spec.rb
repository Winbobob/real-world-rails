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

describe LiveEvents do

  it 'should trigger a live event on login' 


  context 'Courses' do

    before do
      course_with_teacher_logged_in(:active_all => true)
    end

    context 'Wiki Pages' do

      def create_page(attrs)
        page = @course.wiki_pages.create!(attrs)
        page.publish! if page.unpublished?
        page
      end

      it 'should trigger a live event on page creation' 


      it 'should trigger a live event on page update' 


      it 'should trigger a live event on page delete' 


    end

    context 'Files' do
      def course_file
        data = fixture_file_upload('docs/doc.doc', 'application/msword', true)
        factory_with_protected_attributes(@course.attachments, :uploaded_data => data)
      end

      it 'should trigger a live event on files being added to the course' 


      it 'should trigger a live event on file updates' 


      it 'should trigger a live event on file deletes' 

    end
  end

  context 'Enrollments' do
    it "should trigger a live event on limit_privileges_to_course_section!" 

  end
end

