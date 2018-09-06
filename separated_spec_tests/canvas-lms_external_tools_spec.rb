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

require 'nokogiri'

describe "External Tools" do
  describe "Assignments" do
    before do
      allow(BasicLTI::Sourcedid).to receive(:encryption_secret) {'encryption-secret-5T14NjaTbcYjc4'}
      allow(BasicLTI::Sourcedid).to receive(:signing_secret) {'signing-secret-vp04BNqApwdwUYPUI'}
      course_factory(active_all: true)
      assignment_model(:course => @course, :submission_types => "external_tool", :points_possible => 25)
      @tool = @course.context_external_tools.create!(:shared_secret => 'test_secret', :consumer_key => 'test_key', :name => 'my grade passback test tool', :domain => 'example.com')
      @tag = @assignment.build_external_tool_tag(:url => "http://example.com/one")
      @tag.content_type = 'ContextExternalTool'
      @tag.save!
    end

    it "should generate valid LTI parameters" 


    it "should include outcome service params when viewing as student" 


    it "should not include outcome service sourcedid when viewing as teacher" 


    it "should include time zone in LTI paramaters if included in custom fields" 


    it "should redirect if the tool can't be configured" 


    it "should render inline external tool links with a full return url" 


    it "should render user navigation tools with a full return url" 


  end

  it "should highlight the navigation tab when using an external tool" 


  context 'global navigation' do
    before :once do
      Account.default.enable_feature!(:lor_for_account)
      @admin_tool = Account.default.context_external_tools.new(:name => "a", :domain => "google.com", :consumer_key => '12345', :shared_secret => 'secret')
      @admin_tool.global_navigation = {:visibility => 'admins', :url => "http://www.example.com", :text => "Example URL"}
      @admin_tool.save!
      @member_tool = Account.default.context_external_tools.new(:name => "b", :domain => "google.com", :consumer_key => '12345', :shared_secret => 'secret')
      @member_tool.global_navigation = {:url => "http://www.example.com", :text => "Example URL 2"}
      @member_tool.save!
    end

    it "should show the admin level global navigation menu items to teachers" 


    it "should only show the member level global navigation menu items to students" 

  end
end

