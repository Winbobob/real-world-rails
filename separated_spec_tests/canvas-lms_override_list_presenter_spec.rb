#
# Copyright (C) 2013 - present Instructure, Inc.
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

describe OverrideListPresenter do
  include TextHelper
  before do
    allow(AssignmentOverrideApplicator).to receive(:assignment_overridden_for).
      with(assignment,user).and_return overridden_assignment
    allow(AssignmentOverrideApplicator).to receive(:assignment_overridden_for).
      with(assignment,nil).and_return assignment
    allow(assignment).to receive(:has_active_overrides?).and_return true
  end

  around do |example|
    Timecop.freeze(Time.zone.local(2013,3,13,0,0), &example)
  end

  let(:course) { course_factory(active_all: true) }
  let(:assignment) { course.assignments.create!(title: "Testing") }
  let(:user) { student_in_course(course: course, name: "Testing").user }
  let(:second_user) { student_in_course(course: course, name: "Testing 2").user }
  let(:overridden_assignment) { assignment }
  let(:presenter) { OverrideListPresenter.new assignment,user }

  describe "#initialize" do

    it "keeps a reference to the user" 


    context "assignment present? and user present?" do

      it "stores a reference to the overridden assignment for that user" 

    end

    context "assignment or user not present?" do

      it "stores the assignment as nil if assignment not present?" 

    end

  end

  describe "#formatted_date_string" do

    context "due_at" do
      it "returns - if due_at isn't present" 


      it "returns a shortened version with just the date if time is 11:59" 


      it "returns returns datetime_string if not all day but date present" 

    end

    context "lock_at and unlock_at" do
      it "returns returns datetime_string of not all day but date present" 


      it "returns - if due_at isn't present" 


      it "never takes all_day into effect" 

    end
  end

  describe "#multiple_due_dates?" do
    it "returns the result of assignment.multiple_due_dates_apply_to?(user)" 


    it "returns false if its assignment is nil" 

  end

  describe "#due_for" do
    it "returns the due date's title if it is present?" 


    it "returns 'Everyone else' if multiple due dates for assignment" 


    it "returns 'Everyone' translated if not multiple due dates" 


    context "for ADHOC overrides" do
      before :each do
        override = assignment.assignment_overrides.create!(due_at: 1.week.from_now)
        override.assignment_override_students.create!(user: user, assignment: assignment)
        override.assignment_override_students.create!(user: second_user, assignment: assignment)
        override.save!

        @due_date = presenter.assignment.dates_hash_visible_to(user).first
      end

      it "returns a dynamically generated title based on the number of current and invited users" 


      it "does not count concluded students" 


      it "does not count inactive students" 


      it "does not count deleted students" 


      it "does not double-count students that have multiple enrollments in the course" 

    end
  end

  describe "#visible_due_dates" do
      def visible_due_dates; @visible_due_dates; end
      let(:sections) do
        # the count is the important part, the actual course sections are
        # not used
        [ double, double, double ]
      end

      def dates_visible_to_user
        [
          {:due_at => "", :lock_at => nil, :unlock_at => nil, :set_type => 'CourseSection'},
          {:due_at => Time.now + 1.day, :lock_at => nil, :unlock_at => nil, :set_type => 'CourseSection'},
          {:due_at => Time.now + 2.days, :lock_at => nil, :unlock_at => nil, :set_type => 'CourseSection'},
          {:due_at => Time.now - 2.days, :lock_at => nil, :unlock_at => nil, :base => true}
        ]
      end

    it "returns empty array if assignment is not present" 


    context "when all sections have overrides" do

      before do
        allow(assignment.context).to receive(:active_section_count).
          and_return sections.count
        allow(assignment).to receive(:all_dates_visible_to).with(user).
          and_return dates_visible_to_user
        @visible_due_dates = presenter.visible_due_dates
      end

      it "doesn't include the default due date" 


      it "sorts due dates by due_at, placing not present?/nil after dates" 


      it "includes the actual Time for presentation transforms in templates" 


    end

    context "only some sections have overrides" do
      let(:dates_visible) { dates_visible_to_user[1..-1] }

      before do
        allow(assignment.context).to receive(:active_section_count).
          and_return sections.count
        allow(assignment).to receive(:all_dates_visible_to).with(user).
          and_return dates_visible
        @visible_due_dates = presenter.visible_due_dates
      end

      it "includes the default due date" 

    end

  end

end

