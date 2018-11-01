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

describe TokensController do
  describe "developer keys" do
    context "not logged in" do
      it "should require being logged in to create an access token" 


      it "should require being logged in to delete an access token" 


      it "should require being logged in to retrieve an access token" 

    end

    context "logged in" do
      before :once do
        user_factory(active_user: true)
      end

      before :each do
        user_session(@user)
      end

      it "should allow creating an access token" 


      it "should not allow creating an access token while masquerading" 


      it "should not allow explicitly setting the token value" 


      it "should allow deleting an access token" 


      it "should not allow deleting an access token while masquerading" 


      it "should not allow deleting someone else's access token" 


      it "should allow retrieving an access token, but not give the full token string" 


      it "should not include token for protected tokens" 


      it "should not allow retrieving someone else's access token" 


      it "should allow updating a token" 


      it "should allow regenerating an unprotected token" 


      it "should not allow regenerating a token while masquerading" 


      it "should not allow regenerating a protected token" 


      it "should not allow updating someone else's token" 

    end
  end
end

