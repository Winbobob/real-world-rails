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
require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper.rb')

describe Api::V1::Course do
  include Api::V1::Course

  def feeds_calendar_url(feed_code)
    "feed_calendar_url(#{feed_code.inspect})"
  end

  describe "#course_settings_json" do
  	it "should return course settings hash" 

  end

  describe "#course_json" do
    it "should work for a logged-out user" 


    it "should include course locale" 


    it "should include the image when it is asked for and the feature flag is on" 


    it "should not include the image if the feature flag is off" 


    it "should not include the image if the course_image include is not present" 

  end
end

