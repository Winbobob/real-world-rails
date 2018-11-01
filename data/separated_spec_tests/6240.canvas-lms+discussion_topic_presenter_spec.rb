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
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DiscussionTopicPresenter do
  let (:topic)      { DiscussionTopic.new(:title => 'Test Topic', :assignment => assignment) }
  let (:user)       { user_model }
  let (:presenter)  { DiscussionTopicPresenter.new(topic, user) }
  let (:course)     { course_model }
  let (:assignment) {
    Assignment.new(:title => 'Test Topic',
                   :due_at => Time.now,
                   :lock_at => Time.now + 1.week,
                   :unlock_at => Time.now - 1.week,
                   :submission_types => 'discussion_topic')
  }

  before do
    allow(AssignmentOverrideApplicator).to receive(:assignment_overridden_for).
      with(topic.assignment,user).and_return assignment
  end

  describe "#initialize" do
    context "when no arguments passed" do
      it "creates a discussion topic and current_user for you" 

    end

    context "when discussion_topic and current_user args passed" do
      it "returns the overridden assignment if topic is for assignment" 


      it "will have a nil assignment if topic not for grading" 

    end
  end

  describe "#has_attached_rubric?" do
    it "returns true if assignment has a rubric association with a rubric" 


    it "returns false if assignment has nil rubric association" 


    it "returns false if assignment has a rubric association but no rubric" 

  end

  describe "#should_show_rubric?" do
    it "returns false if no assignment on the topic" 


    it "returns true if has_attached_rubric? is false" 


    context "no rubric association or rubric for the topic's assignment" do
      before { allow(assignment).to receive(:rubric_association).and_return nil }

      it "returns true when the assignment grants the user update privs" 


      it "returns false when the assignment grants the user update privs" 

    end

  end

  describe "#comments_disabled?" do
    it "only returns true when topic is assignment, its context is a course, "+
      "and the course settings lock all announcements" do
      course_factory
      @course.lock_all_announcements = true
      @course.save!
      announcement = Announcement.new(:title => "Announcement", :context => @course)
      expect(DiscussionTopicPresenter.new(announcement).comments_disabled?).
        to eq true
    end

    it "returns false for announcements or other criteria not met" 

  end

  describe "#large_roster?" do
    it "returns true when context responds to large_roster and context " +
      "has a large roster" do
      topic.context = Course.new(:name => "Canvas")
      topic.context.large_roster = true
      expect(presenter.large_roster?).to eq true
    end

    it "returns false when context responds to large roster and context " +
      "doesn't have a large roster" do
      topic.context = Course.new(:name => "Canvas")
      topic.context.large_roster = false
      expect(presenter.large_roster?).to eq false
    end

    context "topic's context isn't a course" do

      before do
        @group = Group.new(:name => "Canvas")
        topic.context = @group
        @group.context = Course.new(:name => "Canvas")
        @group.context.large_roster = true
      end

      it "returns false if topic's context's context is nil" 


      it "returns true if topic's context's context has large_roster?" 


    end
  end

  describe "#allows_speed_grader?" do

    it "returns false when course is large roster" 


    context "with assignment" do

      before do
        course = topic.context = Course.create!(name: 'Canvas')
        assignment.context = course
        assignment.save!
        topic.assignment = assignment
      end

      it "returns false when assignment unpublished" 


      it "returns true when assignment published" 

    end
  end

end

