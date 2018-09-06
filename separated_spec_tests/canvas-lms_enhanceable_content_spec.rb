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

describe "enhanceable_content" do
  include_context "in-process server selenium tests"

  it "should automatically enhance content using jQuery UI" 


  context "media file preview thumbnails" do
    before :each do
      stub_kaltura
      course_factory(active_all: true)

      @attachment = @course.attachments.create!(:uploaded_data => stub_file_data('video1.mp4', nil, 'video/mp4'))
      @page = @course.wiki_pages.build(:title => 'title')
      @page.body = %{
        <a id="media_comment_0_deadbeef" class="instructure_file_link instructure_video_link" title="Video.mp4"
          href="/courses/#{@course.id}/files/#{@attachment.id}/download?wrap=1">Video</a>
      }
      @page.save!
    end

    it "should show for students" 


    describe "for locked files" do
      before :each do
        @attachment.locked = true
        @attachment.save!
      end

      it "should not show for students" 


      it "should show for teachers" 

    end
  end
end


