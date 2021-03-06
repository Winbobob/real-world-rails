#
# Copyright (C) 2015 - present Instructure, Inc.
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

require_relative '../helpers/gradezilla_common'
require_relative '../grades/pages/gradezilla_page'
require_relative '../grades/setup/gradebook_setup'

describe "outcome gradezilla" do
  include_context "in-process server selenium tests"
  include GradezillaCommon
  include GradebookSetup

  context "as a teacher" do
    before(:once) do
      gradebook_data_setup
      show_sections_filter(@teacher)
    end

    before(:each) do
      user_session(@teacher)
    end

    after(:each) do
      clear_local_storage
    end

    it "should not be visible by default" 


    context "when enabled" do
      before :once do
        Account.default.set_feature_flag!('outcome_gradebook', 'on')
      end

      it "is visible" 


      it "allows showing only a certain section" 


      it "should handle multiple enrollments correctly" 

    end
  end
end

