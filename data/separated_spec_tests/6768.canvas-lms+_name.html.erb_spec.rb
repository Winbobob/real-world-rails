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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../views_helper')

describe "/users/name" do
  it "should allow deletes for unmanagaged pseudonyms with correct privileges" 


  it "should allow deletes for managaged pseudonyms with correct privileges" 


  it "should not allow deletes for managed pseudonyms without correct privileges" 


  it "should not allow deletes for unmanaged pseudonyms without correct privileges" 


  describe "default email address" do
    before :once do
      course_with_teacher :active_all => true
      student_in_course :active_all => true
      @student.communication_channels.create!(:path_type => 'email', :path => 'secret@example.com').confirm!
    end

    it "includes email address for teachers by default" 


    it "does not include it if the permission is denied" 

  end

  describe "merge_user_link" do
    let(:account) { Account.default }
    let(:sally) { account_admin_user(account: account) }
    let(:bob) { teacher_in_course(account: account, active_enrollment: true).user }

    it "should display when acting user has permission to merge shown user" 


    it "should not display when acting user lacks permission to merge shown user" 


    it "should not display when non-admin looking at self" 

  end
end

