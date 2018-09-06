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

describe ContentNotices do
  class Thing
    def asset_string; "thing_1"; end
    include ContentNotices
    define_content_notice :foo, text: 'foo!'
    define_content_notice :bar, template: 'some_template', should_show: ->(thing, user) { user == 'bob' }
  end

  describe "content_notices" do
    it "should return [] if no notices are active" 


    it "should add and remove a content notice" 


    it "should check the show condition of a notice" 


    it "should create expiring notices" 

  end
end

