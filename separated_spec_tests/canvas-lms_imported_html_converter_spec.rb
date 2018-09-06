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

describe ImportedHtmlConverter do
  # tests link_parser and link_resolver

  context ".convert" do
    before :once do
      course_factory
      @path = "/courses/#{@course.id}/"
      @migration = @course.content_migrations.create!
      @converter = @migration.html_converter
    end

    def convert_and_replace(test_string)
      html = @migration.convert_html(test_string, 'sometype', 'somemigid', 'somefield')
      link_map = @converter.link_parser.unresolved_link_map

      @converter.link_resolver.resolve_links!(link_map)
      if link_map.present?
        @converter.link_replacer.sub_placeholders!(html, link_map.values.map(&:values).flatten)
      end
      html
    end

    it "should convert a wiki reference" 


    it "should convert a wiki reference without $ escaped" 


    it "should convert a wiki reference by migration id" 


    it "should convert a discussion reference by migration id" 


    def make_test_att
      att = Attachment.create(:filename => 'test.png', :display_name => "test.png", :uploaded_data => StringIO.new('psych!'), :folder => Folder.unfiled_folder(@course), :context => @course)
      att.migration_id = "1768525836051"
      att.save!
      att
    end

    it "should find an attachment by migration id" 


    it "should find an attachment by path" 


    it "should find an attachment by a path with a space" 


    it "should find an attachment even if the link has an extraneous folder" 


    it "should find an attachment by path if capitalization is different" 


    it "should find an attachment with query params" 


    it "should convert course section urls" 


    it "should leave invalid and absolute urls alone" 


    it "should prepend course files for unrecognized relative urls" 


    it "should preserve media comment links" 


    it "should handle and repair half broken media links" 


    it "should only convert url params" 


    it "should leave an anchor tag alone" 


    it "should convert base64 images to file links" 


  end

  context ".relative_url?" do
    it "should recognize an absolute url" 


    it "should recognize relative urls" 


    it "should not error on invalid urls" 

  end

end

