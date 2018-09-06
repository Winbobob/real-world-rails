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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe SubmissionList do
  it "should initialize with a course" 


  it "should provide a dictionary in 'list'" 


  it "should create keys in the data when versions of submissions existed" 


  it "should take the time zone into account when dividing grading history into days" 


  it "handles excused assignments" 


  context "named loops" do

    before do
      interesting_submission_data
    end

    it "should be able to loop on days" 


    it "should be able to loop on graders" 


    it "should only keep one diff per grader per day" 


    it "should be able to loop on assignments" 


    context "submissions" do
      it "should be able to loop on submissions" 


      it "sorts submissions alphabetically by student name" 

    end
  end

  context "regrading" do
    it 'should include regrade events in the final data' 

  end

  context "remembers the most recent grade change" do
    let(:grader)  { User.create name: 'some_grader' }
    let(:student) { User.create name: "some student", workflow_state: "registered" }
    let(:course)  { Course.create name: "some course", workflow_state: "available" }
    let(:list)    { SubmissionList.new course }

    let(:assignment) do
      course.assignments.create title: "some assignment",
      points_possible: 10,
      workflow_state: "published"
    end

    let(:submission) do
      list.days.first.
        graders.first.
        assignments.first.
        submissions.first
    end

    let!(:enroll_teacher_and_student) do
      course.enroll_teacher(grader).accept
      course.enroll_student student
    end

    context "when the grade is not blank" do
      let!(:grade_assignment) do
        assignment.grade_student student, {grade: 5, grader: grader}
        assignment.grade_student student, {grade: 3, grader: grader}
      end

      it "remembers the 'Before' grade " 

      it "remembers the 'After' grade" 

      it "remembers the 'Current' grade" 

    end

    context "when the grade is blank" do
      let!(:grade_assignment) do
        assignment.grade_student student, {grade: 6, grader: grader}
        assignment.grade_student student, {grade: 7, grader: grader}
        assignment.grade_student student, {grade: "", grader: grader}
      end

      it "remembers the 'Before' grade" 

      it "remembers the 'After' grade" 

      it "remembers the 'Current' grade" 

    end
  end

end

def interesting_submission_list(opts={})
  interesting_submission_data(opts)
  @course.reload
  @sl = SubmissionList.new(@course)
end

def interesting_submission_data(opts={})
  opts[:grader] ||= {}
  opts[:user] ||= {}
  opts[:course] ||= {}
  opts[:assignment] ||= {}
  opts[:submission] ||= {}

  @grader = user_model({:name => 'some_grader'}.merge(opts[:grader]))
  @grader2 = user_model({:name => 'another_grader'}.merge(opts[:grader]))
  @student = factory_with_protected_attributes(User, {:name => "studeñt", :workflow_state => "registered"}.merge(opts[:user]))
  @course = factory_with_protected_attributes(Course, {:name => "some course", :workflow_state => "available"}.merge(opts[:course]))
  [@grader, @grader2].each do |grader|
    e = @course.enroll_teacher(grader)
    e.accept
  end
  @course.enroll_student(@student)
  @assignment = @course.assignments.new({
    :title => "some assignment",
    :points_possible => 10
  }.merge(opts[:assignment]))
  @assignment.workflow_state = "published"
  @assignment.save!
  @assignment.grade_student(@student, {:grade => 1.5, :grader => @grader}.merge(opts[:submission]))
  @assignment.grade_student(@student, {:grade => 3, :grader => @grader}.merge(opts[:submission]))
  @assignment.grade_student(@student, {:grade => 5, :grader => @grader2}.merge(opts[:submission]))
  @student = user_model(:name => 'studeЖt')
  @course.enroll_student(@student)
  @assignment.reload
  @assignment.grade_student(@student, {:grade => 8, :grader => @grader}.merge(opts[:submission]))
  @student = user_model(:name => 'student')
  @course.enroll_student(@student)
  @assignment.reload
  @assignment.grade_student(@student, {:grade => 10, :grader => @grader}.merge(opts[:submission]))
  @assignment = @course.assignments.create({
    :title => "another assignment",
    :points_possible => 10
  })
  @assignment.workflow_state = "published"
  @assignment.save!
  @assignment.grade_student(@student, {:grade => 10, :grader => @grader}.merge(opts[:submission]))
end

