#
# Copyright (C) 2017 Instructure, Inc.
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

describe "legacyNode" do
  before(:once) do
    course_with_student(active_all: true)
  end

  def run_query(query, user)
    CanvasSchema.execute(query, context: {current_user: user})
  end

  context "courses" do
    before(:once) do
      @query = <<-GQL
      query {
        course: legacyNode(type: Course, _id: "#{@course.id}") {
          ... on Course {
            _id,
            name
          }
        }
      }
      GQL
    end

    it "works" 


    it "needs read permission" 

  end

  context "assignments" do
    before(:once) do
      @assignment = @course.assignments.create! name: "Some Assignment"
      @query = <<-GQL
      query {
        assignment: legacyNode(type: Assignment, _id: "#{@assignment.id}") {
          ... on Assignment {
            _id
            name
          }
        }
      }
      GQL
    end

    it "works" 


    it "needs read permission" 

  end

  context "sections" do
    before(:once) do
      @section = @course.course_sections.create! name: "Section 1"
      @query = <<-GQL
      query {
        section: legacyNode(type: Section, _id: "#{@section.id}") {
          ... on Section {
            _id
          }
        }
      }
      GQL
    end

    it "works" 


    it "requires read permission" 

  end

  context "users" do
    before(:once) do
      @query = <<-GQL
      query {
        user: legacyNode(type: User, _id: "#{@student.id}") {
          ... on User {
            _id
          }
        }
      }
      GQL
    end

    it "works" 


    it "requires read_full_profile permission" 

  end

  context "enrollments" do
    before(:once) do
      @enrollment = @student.enrollments.first

      @query = <<-GQL
      query {
        enrollment: legacyNode(type: Enrollment, _id: "#{@enrollment.id}") {
          ... on Enrollment {
            _id
          }
        }
      }
      GQL
    end

    it "works" 


    it "requires read_roster permission on the course" 

  end
end

