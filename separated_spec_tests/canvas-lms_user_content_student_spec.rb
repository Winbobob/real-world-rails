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

require File.expand_path(File.dirname(__FILE__) + '/common')

require 'nokogiri'

describe "user_content" do
  include_context "in-process server selenium tests"

  context "as a student" do
    let(:message_body) do
      <<-MESSAGE
<p>flash:</p>
<p><object width="425" height="350" data="/javascripts/swfobject/test.swf" type="application/x-shockwave-flash"><param name="wmode" value="transparent" /><param name="src" value="/javascripts/swfobject/test.swf" /></object></p>
      MESSAGE
    end

    before (:each) do
      course_with_student_logged_in(:active_all => true)
      allow(HostUrl).to receive(:is_file_host?).and_return(true)
    end

    describe "iframes" do
      it "should serve embed tags from a safefiles iframe" 


      it "should iframe calendar json requests" 

    end
  end
end

