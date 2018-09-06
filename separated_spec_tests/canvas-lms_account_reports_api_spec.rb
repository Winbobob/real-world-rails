#
# Copyright (C) 2012 - 2013 Instructure, Inc.
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

describe 'Account Reports API', type: :request do
  before :once do
    @admin = account_admin_user
    user_with_pseudonym(:user => @admin)
    @report = AccountReport.new
    @report.account = @admin.account
    @report.user = @admin
    @report.progress=rand(100)
    @report.start_at=DateTime.now
    @report.end_at=(Time.now + (rand(60*60*4))).to_datetime
    @report.report_type = "student_assignment_outcome_map_csv"
    @report.parameters = HashWithIndifferentAccess['param' => 'test', 'error'=>'failed']

    folder = Folder.assert_path("test", @admin.account)
    @report.attachment = Attachment.create!(:folder => folder, :context => @admin.account, :filename => "test.txt", :uploaded_data => StringIO.new("test file"))

    @report.save!
  end

  describe 'available_reports' do
    it 'should list all available reports' 

  end

  describe 'create' do
    it 'should create a student report' 


    it 'should work with parameters' 


    it 'should 404 for non existing reports' 

  end

  describe 'index' do
    it 'should list all generated reports' 

  end

  describe 'show' do
    it 'should get all info about a report' 

  end

  describe 'destroy' do
    it 'delete a report' 

  end
end


