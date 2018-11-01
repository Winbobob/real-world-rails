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

describe "terms/_term.html.erb" do
  describe "sis_source_id edit box" do
    before do
      @account = Account.default
      @term = @account.enrollment_terms.create(:name=>"test term")
      @term.sis_source_id = "sis_this_fool"

      assign(:context, @account)
      assign(:account, @account)
      assign(:root_account, @account)
      assign(:course_counts_by_term, EnrollmentTerm.course_counts([@term]))
    end

    it "should show to sis admin" 


    it "should not show to non-sis admin" 

  end
end

