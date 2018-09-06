#
# Copyright (C) 2012 Instructure, Inc.
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

describe 'ExternalFeedsController', type: :request do
  shared_examples_for "Announcement External Feeds" do
    before :once do
      @url_params = { :controller => "external_feeds", :action => "index", :format => "json" }
    end

    it "should not allow access to unauthorized users" 


    def feed_json(f)
      {
        'id' => f.id,
        'display_name' => f.display_name,
        'url' => f.url,
        'header_match' => f.header_match,
        'created_at' => f.created_at.as_json,
        'verbosity' => f.verbosity,
        'external_feed_entries_count' => f.external_feed_entries.size,
      }
    end

    it "should allow listing feeds" 


    it "should allow creating feeds" 


    it "should allow deleting a feed" 

  end

  describe "in a Course" do
    include_examples "Announcement External Feeds"
    before :once do
      @allowed_user = teacher_in_course(:active_all => true).user
      @context = @course
      @denied_user = student_in_course(:course => @course, :active_all => true).user
      @url_base = "/api/v1/courses/#{@course.id}/external_feeds"
      @url_params.merge!({ :course_id => @course.to_param })
    end
  end

  describe "in a Group" do
    include_examples "Announcement External Feeds"
    before :once do
      group_with_user(:moderator => true, :active_all => true)
      @allowed_user = @user
      @allowed_user.pseudonyms.create!(:unique_id => 'user1', :account => Account.default)
      @context = @group
      @denied_user = user_with_pseudonym(:active_all => true, :unique_id => 'user2')
      @url_base = "/api/v1/groups/#{@group.id}/external_feeds"
      @url_params.merge!({ :group_id => @group.to_param })
    end
  end
end

