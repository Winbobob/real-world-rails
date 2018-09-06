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

describe "accounts/_add_course_or_user.html.erb" do
  describe "sis_source_id with sis_batches" do
    before do
      @account = Account.default
      @account.allow_sis_import = true
      @account.save

      assign(:account, @account)
      assign(:root_account, @account)
    end

    it "should show to sis admin" 


    it "should not show to non-sis admin" 

  end

  describe "sis_source_id without sis_batches" do
    before do
      @account = Account.default
      @account.allow_sis_import = false
      @account.save

      assign(:account, @account)
      assign(:root_account, @account)
    end

    it "should not show to sis admin, because there are no sis batches" 


    it "should not show to non-sis admin" 

  end
end

