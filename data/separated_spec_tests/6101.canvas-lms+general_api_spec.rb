#
# Copyright (C) 2011 - 2012 Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/api_spec_helper')

describe "API", type: :request do
  describe "Api::V1::Json" do
    it "should merge user options with the default api behavior" 


    it "should accept a block to add serialized field data" 

  end

  describe "as_json extensions" do
    it "should skip attribute filtering if obj doesn't respond" 


    it "should do attribute filtering if obj responds" 


    it "should not return the permissions list if include_permissions is false" 


    it "should serialize permissions if obj responds" 

  end

  describe "json post format" do
    before :once do
      course_with_teacher(:user => user_with_pseudonym, :active_all => true)
      enable_default_developer_key!
      @token = @user.access_tokens.create!(:purpose => "specs")
    end

    it "should use html form encoding by default" 


    it "should support json POST request bodies" 


    it "should use array params without the [] on the key" 

  end

  describe "application/json+canvas-string-ids" do
    it "should stringify fields with Accept header" 


    it "should not stringify fields without Accept header" 

  end
end

