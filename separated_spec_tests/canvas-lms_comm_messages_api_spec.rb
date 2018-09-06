#
# Copyright (C) 2013 Instructure, Inc.
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

describe CommMessagesApiController, type: :request do
  describe "index" do
    context "a site admin" do
      context "with permission" do
        before :once do
          @test_user = user_factory(active_all: true)
          site_admin_user
        end

        it "should be able to see all messages" 


        it "should require a valid user_id parameter" 


        it "should use start_time and end_time parameters to limit results" 


        it "should paginate results" 


      end

      context "without permission" do
        before do
          @test_user = user_factory(active_all: true)
          account_admin_user_with_role_changes(:account => Account.site_admin,
                                               :role_changes => {:read_messages => false})
        end

        it "should receive unauthorized" 

      end
    end

    context "an account admin" do
      context "with permission" do
        before :once do
          @test_user = user_factory(active_all: true)
          account_admin_user_with_role_changes(:account => Account.default,
                                               :role_changes => {:view_notifications => true})
        end

        it "should receive unauthorized if account setting disabled" 


        it "should only be able to see associated account's messages" 

      end

      context "without permission" do
        before do
          @test_user = user_factory(active_all: true)
          account_admin_user_with_role_changes(:account => Account.default,
                                               :role_changes => {:view_notifications => false})
        end

        it "should receive unauthorized" 

      end
    end

    context "an unauthorized user" do
      before do
        @test_user = user_factory(active_all: true)
        @user = user_factory(active_all: true)
      end

      it "should receive unauthorized" 

    end

  end
end

