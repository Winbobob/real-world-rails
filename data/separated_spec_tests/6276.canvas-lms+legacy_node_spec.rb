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

  context "modules" do
    before(:once) do
      @module = @course.context_modules.create! name: "asdf"
      @query = <<~GQL
      query {
        module: legacyNode(type: Module, _id: "#{@module.id}") {
          ... on Module {
            _id
          }
        }
      }
      GQL
    end

    it "works" 


    it "requires read permission" 

  end

  context "page" do
    before(:once) do
      @course.create_wiki! has_no_front_page: false, title: "asdf"
      @page = @course.wiki.front_page
      @page.save!
      @query = <<~GQL
      query {
        page: legacyNode(type: Page, _id: "#{@page.id}") {
          ... on Page {
            _id
          }
        }
      }
      GQL
    end

    it "works" 


    it "requires read permission" 

  end
end

