#
# Copyright (C) 2011 - 2015 Instructure, Inc.
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

describe 'Course Nicknames API', type: :request do
  before(:once) do
    @params = { :controller => 'course_nicknames', :format => 'json' }
  end

  it "requires a user for index" 


  context "with user" do
    before(:once) do
      course_with_student :active_all => true
    end

    describe "index" do
      it "lists all nicknames" 


      it "deals with no nicknames existing" 

    end

    describe "show" do
      it "returns a single nickname" 


      it "returns a null nickname if no nickname exists" 


      it "errors if you don't have permission to view the course" 

    end

    describe "update" do
      it "creates a course nickname" 


      it "updates a course nickname" 


      it "requires the nickname param" 


      it "rejects an empty nickname" 


      it "rejects an overly long nickname" 


      it "doesn't create a nickname for a course the caller can't access" 

    end

    describe "delete" do
      it "deletes a single nickname" 

    end

    describe "clear" do
      it "removes all course nicknames" 

    end
  end
end

