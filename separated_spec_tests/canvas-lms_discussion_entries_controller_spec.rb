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

describe DiscussionEntriesController do
  before :once do
    course_with_teacher(:active_all => true)
    student_in_course(:active_all => true)
    @topic = @course.discussion_topics.create(:title => "some topic")
    @entry = @topic.discussion_entries.create(:message => "some message", :user => @student)
  end

  def topic_with_media_reply
    @topic.update_attribute(:podcast_enabled, true)
    @mo1 = @course.media_objects.build(:media_id => 'asdf', :title => 'asdf')
    @mo1.data = {:extensions => {:mp4 => {
      :size => 100,
      :extension => 'mp4'
    }}}
    @mo1.save!
    @entry = @topic.discussion_entries.create!(:user => @student, :message => " media_comment_asdf ")
  end

  describe "GET 'show'" do
    it "should require authorization" 


    it "should require course to be published for students" 


    it "should assign variables" 

  end

  describe "POST 'create'" do
    it "should require authorization" 


    it "should create a message" 


    it "should attach a file if authorized" 


    it "should NOT attach a file if not authorized" 


    it "should create a submission if the topic has an assignment" 

  end

  describe "PUT 'update'" do
    it "should require authorization" 


    it "should update the entry" 


    it "should attach a new file to the entry" 


    it "should replace the file on the entry" 


    it "should remove the file from the entry" 


    it "should not replace the file to the entry if not authorized" 


    it "should set the editor_id to whoever edited to entry" 

  end

  describe "DELETE 'destroy'" do
    it "should require authorization" 


    it "should delete the entry" 

  end

  describe "GET 'public_feed.rss'" do
    before :once do
      @entry.destroy
    end

    it "should require authorization" 


    it "should require the podcast to be enabled" 


    it "should return a valid RSS feed" 


    it "should leave out deleted media comments" 


    it "should leave out media objects if the attachment is already included" 


    it "should include student entries if enabled" 


    it "should not include student entries if locked" 


    it "should not include student entries if initial post is required but missing" 


    it "should include student entries if initial post is required and given" 


    it "should not include student entries if disabled" 


    it "should not error if data is missing and kaltura is unresponsive" 


    it 'respects podcast_has_student_posts for course discussions' 


    it 'always returns student entries for group discussions' 

  end
end

