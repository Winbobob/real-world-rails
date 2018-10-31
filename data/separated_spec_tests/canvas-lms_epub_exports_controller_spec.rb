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
#

require File.expand_path(File.dirname(__FILE__) + '/../apis/api_spec_helper')

describe EpubExportsController do

  before :once do
    Account.default.enable_feature!(:epub_export)
    course_with_teacher(active_all: true)
    student_in_course(active_all: true)
  end

  describe "GET index, format html" do
    context "without user" do
      it "should require user to be logged in to access the page" 

    end

    context "with user" do
      before(:once) do
        @n = @student.courses.count
        @n_more = 4
        create_courses(@n_more, {
          enroll_user: @student,
          enrollment_type: 'StudentEnrollment'
        })
        @student.enrollments.last.update_attribute(
          :workflow_state, 'completed'
        )
      end

      before(:each) do
        user_session(@student)
      end

      it "should assign collection of courses and render" 

    end
  end

  describe "GET :index.json", type: :request do
    before(:once) do
      @n = @student.courses.count
      @n_more = 4
      create_courses(@n_more, {
        enroll_user: @student,
        enrollment_type: 'StudentEnrollment'
      })
      @student.enrollments.last.update_attribute(
        :workflow_state, 'completed'
      )
    end

    it "should return course epub exports" 

  end

  describe "GET :show.json", type: :request do
    let_once(:epub_export) do
      @course.epub_exports.create({
        user: @student
      })
    end

    it "should be success" 

  end

  describe "POST :create.json", type: :request do
    let_once(:url) do
      "/api/v1/courses/#{@course.id}/epub_exports"
    end

    context "when epub_export doesn't exist" do
      it "should return json with newly created epub_export" 


      it "should create one epub_export" 

    end

    context "when there is a running epub_export" do
      let_once(:epub_export) do
        @course.epub_exports.create({
          user: @student
        })
      end

      it "should not create one epub_export" 

    end
  end

  context "with feature disabled" do
    before(:each) do
      user_session(@student)
    end
    it "should return 404 with the feature disabled" 


    it "should return 404 with the feature enabled and offline web enabled" 

  end
end

