#
# Copyright (C) 2013 - present Instructure, Inc.
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

describe AttachmentHelper do
  include ApplicationHelper
  include AttachmentHelper

  before :once do
    course_with_student
    @att = attachment_model(:context => @user)
  end

  it "should return a valid crocodoc session url" 


  it "should return a valid canvadoc session url" 


  describe "set_cache_header" do
    it "should not allow caching of instfs redirects" 

  end
end

