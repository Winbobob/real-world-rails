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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe SortsAssignments do

  before do
    @time_now = Time.parse("October 31 2012")
    allow(Time).to receive(:now).and_return(@time_now)
  end

  let(:due_yesterday) {double({:id => 1, :due_at => 1.days.ago }) }
  let(:due_today) {double({ :id => 2, :due_at => @time_now }) }
  let(:due_tomorrow) {double({ :id => 3, :due_at =>  1.days.from_now }) }
  let(:no_due_date) {double({:id => 4, :due_at => nil }) }
  let(:due_in_one_week) {double({ :id => 5, :due_at => 1.week.from_now }) }
  let(:due_in_two_weeks) {double({ :id => 6, :due_at => 2.weeks.from_now }) }
  let(:assignments) {
    [
      due_yesterday,
      due_today,
      due_tomorrow,
      due_in_one_week,
      due_in_two_weeks,
      no_due_date
    ]
  }

  describe "past" do

    it "and_return an array of assignments that are due before now" 


  end

  describe "undated" do

    it "and_return an array of assignments without a due date" 


  end

  describe "future" do

    it "and_return an array of assignments due in the future (>= Time.now)" 


  end

  describe "upcoming" do

    it "and_return an array of assignments due between right now and 1 week " +
      "from now" do
      expect(SortsAssignments.upcoming(assignments)).to match_array(
      [
        due_today,
        due_tomorrow,
        due_in_one_week
      ]
      )
    end
  end

  describe "up_to" do

    it "gives all the assignments due before the given time" 


    it "does not include assignments due exactly at the given time" 


  end

  describe "down_to" do

    it "and_return all assignments after the given time" 


    it "does not include assignments with a due_at equal to the given time" 


  end

  describe "ungraded_for_user_and_session" do
    let(:user) { double }
    let(:current_user) { double }
    let(:session) { double }
    let(:assignment1) { double }
    let(:assignment2) { double }
    let(:assignment3) { double }
    let(:assignments) { [ assignment1, assignment2, assignment3 ] }
    let(:one_count_query){double(count: 1)}
    let(:zero_count_query){double(count: 0) }
    let(:bad_count_query){double(count: -1) }

    before :each do
      assignments.each { |assignment|
        allow(assignment).to receive_messages(
          :grants_right? => true,
          :expects_submission? => true
        )
      }

      allow(Assignments::NeedsGradingCountQuery).to receive_messages(new: one_count_query)
    end

    it "only includes assignments that current user has permission to view" 


    it "only includes assignments that are expecting a submission" 


    it "only includes assignments that have a grading_count_for_user > 0" 


  end

  describe "by_due_date" do
    let(:user) { double }
    let(:session) { double }
    let(:submissions) { [] }
    let(:sorted_assignments) {
      SortsAssignments.by_due_date({
        :assignments => assignments,
        :user => user,
        :session => session,
        :upcoming_limit => 1.week.from_now,
        :submissions => []
      })
    }

    before :each do
      assignments.each { |assignment|
        allow(assignment).to receive_messages(
          :grants_right? => true,
          :expects_submission? => true,
          :submission_for_student => {id: nil}
        )
      }
    end

    it "raises an IndexError if a required field is not passed" 


    describe "the Struct returned" do

      before :each do
        ungraded_assignments = []
        allow(SortsAssignments).to receive(:vdd_map).and_return(assignments)
        allow(SortsAssignments).to receive(:ungraded_for_user_and_session).
          and_return(ungraded_assignments)
        allow(SortsAssignments).to receive(:overdue).with(assignments,user,session,submissions).
          and_return []
      end

      it "stores the past assignments" 


      it "stores the undated assignments" 


      it "stores the ungraded assignments" 


      it "stores the upcoming assignments" 


      it "stores the future events" 


      it "and_return the overdue assignments" 


    end

  end

  describe "without_graded_submission" do
    let(:submission1) {double(:assignment_id => due_yesterday.id,
                           :without_graded_submission? => false)}
    let(:submission2) {double(:assignment_id => due_today.id,
                           :without_graded_submission? => false)}
    let(:submissions) { [ submission1, submission2 ] }
    let(:assignments) { [ due_yesterday, due_today ] }

    it "and_return assignments that don't have a matching submission in the "+
      "passed submissions collection" do
      allow(submission1).to receive_messages(:assignment_id => nil )
      expect(SortsAssignments.without_graded_submission(assignments,submissions)).
        to match_array [ due_yesterday ]
    end

    it "and_return assignments that have a matching submission in the collection "+
      "but the submission is without a graded submission." do
      expect(submission1).to receive(:without_graded_submission?).and_return true
      expect(SortsAssignments.without_graded_submission(assignments,submissions)).
        to match_array [ due_yesterday ]
    end

  end

  describe "user_allowed_to_submit" do
    let(:session) {double}
    let(:user) {double}

    before :each do
      assignments.each{|assignment|
        allow(assignment).to receive(:expects_submission?).and_return true
        allow(assignment).to receive(:grants_right?).and_return false
      }
    end

    it "includes assignments where assignment not expecting a submission and "+
      "don't grant rights to user" do
      expect(due_yesterday).to receive(:expects_submission?).and_return true
      expect(due_yesterday).to receive(:grants_right?).with(user,session,:submit).and_return true
      expect(SortsAssignments.user_allowed_to_submit(assignments,user,session)).
        to match_array [ due_yesterday ]
    end

  end

  describe "overdue" do
    let(:session) { double }
    let(:user) { double }
    let(:submissions) { double }

    it "and_return the set of assignments that user is allowed to submit and "+
      "without graded submissions" do
      allow(SortsAssignments).to receive(:past).and_return([ due_yesterday ])
      allow(SortsAssignments).to receive(:user_allowed_to_submit).and_return [ due_yesterday ]
      allow(SortsAssignments).to receive(:without_graded_submission).and_return [ due_yesterday ]
      expect(SortsAssignments.overdue(assignments,user,session,submissions)).to eq [due_yesterday]
    end

  end

  describe "unsubmitted_for_user_and_session" do
    let(:course) { double }
    let(:user) { double }
    let(:current_user) { double }
    let(:session) { double }
    let(:assignment1) { double }
    let(:assignment2) { double }
    let(:assignment3) { double }
    let(:assignments) { [ assignment1, assignment2, assignment3 ] }
    before :each do
      allow(course).to receive_messages(:grants_right? => true)
      assignments.each { |assignment|
        allow(assignment).to receive_messages(
          :expects_submission? => true,
          :submission_for_student => {id: nil}
        )
      }
    end

    it "only includes assignments that current user has permission to view" 


    it "only includes assignments that are expecting a submission" 


    it "only includes assignments that do not have a saved submission for the user" 

  end

end

