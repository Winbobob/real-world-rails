#
# Copyright (C) 2014 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe CourseLinkValidator do

  it "should validate all the links" 


  it "should not run on assessment questions in deleted banks" 


  it "should not run on deleted quiz questions" 


  it "should not care if it can reach it" 


  describe "insecure hosts" do
    def test_url(url)
      course_factory
      topic = @course.discussion_topics.create!(:message => %{<a href="#{url}">kekeke</a>}, :title => "title")

      expect(CanvasHttp).to_not receive(:connection_for_uri) # don't try to continue after failing validation
      CourseLinkValidator.queue_course(@course)
      run_jobs

      issues = CourseLinkValidator.current_progress(@course).results[:issues]
      expect(issues.first[:invalid_links].first[:reason]).to eq :unreachable
    end

    it "should not try to access local ips" 


    it "should be able to set the ip filter" 

  end

  it "should check for deleted/unpublished objects" 


  it "should work with absolute links to local objects" 


  it "should find links to other courses" 


  it "should find links to wiki pages" 


  it "should identify typo'd canvas links" 


  it "should not flag valid replaced attachments" 


  it "should not flag links to public paths" 


  it "should flag sneaky links" 


  it "should not flag wiki pages with url encoding" 

end

