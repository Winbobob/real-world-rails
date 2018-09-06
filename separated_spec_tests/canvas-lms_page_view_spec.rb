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

describe "page views" do
  before(:each) do
    Setting.set('enable_page_views', 'db')
  end

  it "should record the context when commenting on a discussion" 


  it "should record get request for api request" 


  it "should not record gets for api request when setting disabled" 


  it "records the developer key when an access token was used" 


  describe "update" do
    it "should set the canvas meta header on interaction_seconds update" 

  end
end

