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

require 'nokogiri'

describe WikiPagesController do
  before do
    course_with_teacher_logged_in(:active_all => true)
  end

  def create_page(attrs)
    page = @course.wiki_pages.create!(attrs)
    page.publish! if page.unpublished?
    page
  end

  it "should still work with periods in titles for new pages" 


  it "should not render wiki page body at all if it was deleted" 


  it "should link correctly in the breadcrumbs for group wikis" 


  it "should work with account group wiki pages" 


  context "draft state forwarding" do
    before do
      @wiki_page = create_page :title => "a-page", :body => "body"
      @base_url = "/courses/#{@course.id}/"
      @course.reload
    end

    it "should forward /wiki to /pages index if no front page" 


    it "should render /wiki as the front page if there is one" 


    it "should forward /wiki/name to /pages/name" 


    it "should forward module_item_id parameter" 


    it "should forward /wiki/name/revisions to /pages/name/revisions" 


    it "should forward /wiki/name/revisions/revision to /pages/name/revisions" 


  end

  describe "wiki_sidebar" do

    it "should load as many pages as the setting allows" 

  end
end


