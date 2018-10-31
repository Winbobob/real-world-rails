#
# Copyright (C) 2014 - present Instructure, Inc.
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

require_relative '../helpers/outcome_common'

describe "outcomes as a teacher" do
  include_context "in-process server selenium tests"
  include OutcomeCommon

  let(:who_to_login) { 'teacher' }
  let(:outcome_url) { "/courses/#{@course.id}/outcomes" }

  def goto_account_default_outcomes
    f('.find_outcome').click
    wait_for_ajaximations
    f(".ellipsis[title='Account Standards']").click
    wait_for_ajaximations
    f(".ellipsis[title='Default Account']").click
    wait_for_ajaximations
  end

  context "account level outcomes" do

    before do
      course_with_teacher_logged_in
      @account = Account.default
      account_outcome(1)
      get outcome_url
      wait_for_ajaximations
      goto_account_default_outcomes
    end

    it "should have account outcomes available for course" 


    it "should add account outcomes to course" 


    it "should remove account outcomes from course" 

  end

  context "find/import dialog" do
    before do
      course_with_teacher_logged_in
      @account = Account.default
      account_outcome(1)
    end

    it "should not allow importing top level groups" 


    it "should update the selected group when re-opened" 

  end

  context "bulk groups and outcomes" do
    before(:each) do
      course_with_teacher_logged_in
    end

    it "should load groups and then outcomes" 


    it "should be able to display 20 groups" 


    it "should be able to display 20 nested outcomes" 


    context "instructions" do
      it "should display outcome instructions" 

    end
  end

  context "moving outcomes tree" do
    before (:each) do
      course_with_teacher_logged_in
      who_to_login == 'teacher' ? @context = @course : @context = account
    end

    it "should alert user if attempting to move with no directory selected" 


    it "should move a learning outcome via tree modal" 


    it "should move a learning outcome group via tree modal" 

  end
end

