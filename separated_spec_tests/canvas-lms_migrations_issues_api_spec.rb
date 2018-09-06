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

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')

describe MigrationIssuesController, type: :request do
  before :once do
    course_with_teacher(:active_all => true, :user => user_with_pseudonym)
    @migration = @course.content_migrations.create!
    @issue_url = "/api/v1/courses/#{@course.id}/content_migrations/#{@migration.id}/migration_issues"
    @params = { :controller => 'migration_issues', :format => 'json', :course_id => @course.id.to_param, :content_migration_id => @migration.id.to_param}
    @issue = @migration.add_warning("fail", :fix_issue_html_url => "https://example.com", :error_message => "secret error", :error_report_id => 0)
  end

  describe 'index' do
    before do
      @params = @params.merge( :action => 'index')
    end

    it "should return the list" 


    it "should paginate" 


    it "should 401" 

  end

  describe 'show' do
    before do
      @issue_url = @issue_url + "/#{@issue.id}"
      @params = @params.merge( :action => 'show', :id => @issue.id.to_param )
    end

    it "should return migration" 


    it "should return error messages to site admins" 


    it "should 404" 


    it "should 401" 

  end

  describe 'update' do
    before do
      @issue_url = @issue_url + "/#{@issue.id}"
      @params = @params.merge( :action => 'update', :id => @issue.id.to_param )
      @body_params = {:workflow_state => 'resolved'}
    end

    it "should update state" 


    it "should reject invalid state" 


    it "should 404" 


    it "should 401" 

  end

end

