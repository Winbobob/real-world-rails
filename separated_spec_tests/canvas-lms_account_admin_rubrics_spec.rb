#
# Copyright (C) 2012 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../common')
require File.expand_path(File.dirname(__FILE__) + '/../helpers/rubrics_common')

describe "account shared rubric specs" do
  include_context "in-process server selenium tests"
  include RubricsCommon

  let(:rubric_url) { "/accounts/#{Account.default.id}/rubrics" }
  let(:who_to_login) { 'admin' }
  let(:account) { Account.default }

  before(:each) do
    resize_screen_to_normal
    course_with_admin_logged_in
  end

  it "should delete a rubric" 

  it "should edit a rubric" 


  it "should allow fractional points" 


  it "should round to 2 decimal places" 


  it "should round to an integer when splitting" 


  it "should pick the lower value when splitting without room for an integer" 

end

