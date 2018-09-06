#
# Copyright (C) 2015 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Bookmarks::BookmarksController do
  context "when user is not logged in" do
    it "should fail" 

  end

  context "when user is logged in" do
    let(:u) { user_factory }
    let!(:bookmark) { Bookmarks::Bookmark.create(user_id: u.id, name: 'bio 101', url: '/courses/1') }

    before(:each) do
      user_session(u)
    end

    describe "GET 'index'" do
      it "should succeed" 

    end

    describe "GET 'show'" do
      it "should succeed" 


      it "includes data" 


      it "restricts to own bookmarks" 

    end

    describe "POST 'create'" do
      let(:params) { { name: 'chem 101', url: '/courses/2'} }

      it "should succeed" 


      it "should create a bookmark" 


      it "should set user" 


      it "should set data" 


      it "should append by default" 


      it "should set position" 


      it "should handle position strings" 

    end

    describe "PUT 'update'" do
      it "should succeed" 

    end

    describe "DELETE 'delete'" do
      it "should succeed" 

    end
  end
end

