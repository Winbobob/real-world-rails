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

describe "account admin terms" do
  include_context "in-process server selenium tests"

  def click_term_action_link(term_div, action_link_css)
    term_div.find_element(:css, action_link_css).click
  end

  def validate_term_display(term_div_index = 0, title = 'Default Term', course_count = 1, user_count = 1)
    term_header = ff('.term .header')[term_div_index]
    expect(term_header).to include_text(title)
    expect(term_header).to include_text("#{course_count} Course")

    # TODO: pend until a better solution is found to calculate user counts
    #expect(term_header).to include_text("#{user_count} User")
  end

  before do
    course_with_admin_logged_in
  end

  context "default term" do
    before do
      get "/accounts/#{Account.default.id}/terms"
      @default_term = ff('.term')[0]
    end

    it "should validate default term" 


    it "should edit default term" 


    it "should cancel editing" 


    it "should validate that you cannot delete a term with courses in it" 

  end

  context "not default term" do

    it "should add a new term" 


    it "should delete a term" 


    it "should cancel term creation and validate nothing was created" 

  end

  context "with grading periods" do
    let(:account) { Account.default }

    before do
      admin_logged_in
    end

    context "with grading period set associated to a new term" do
      let(:term) { account.enrollment_terms.create! }
      let(:group) { Factories::GradingPeriodGroupHelper.new.create_for_account(account) }

      before do
        group.enrollment_terms = [ term ]
      end

      it "should display link to grading standards page", test_id: 2528663, priority: "1" 

    end
  end
end

