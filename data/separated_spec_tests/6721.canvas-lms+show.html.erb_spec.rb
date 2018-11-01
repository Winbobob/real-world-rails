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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../lti2_spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../views_helper')

describe "/assignments/show" do
  it "should render" 


  describe "assignments_2 feature flag" do
    describe "as a teacher" do
      before :each do
        course_with_teacher(active_all: true)
        view_context(@course, @user)
        a = @course.assignments.create!(title: "some assignment")
        assign(:assignment, a)
        allow(view).to receive(:show_moderation_link).and_return(false)
      end

      describe "with feature disabled" do
        it "does not show the new assignments_2 toggle button" 


        it "shows the old assignments page even with query parameter" 

      end

      describe "with feature enabled" do
        before :once do
          Account.default.enable_feature! :assignments_2
        end

        it "it shows old assignments with assignments_2 toggle button" 


        it "shows the assignments_2 page when the query parameter is present" 

      end
    end

    describe "as a student" do
      before :each do
        course_with_student(active_all: true)
        view_context(@course, @user)
        a = @course.assignments.create!(title: "some assignment")
        # mocking this method seems to be the easiest thing to do
        allow(a).to receive(:multiple_due_dates?).and_return(false)
        assign(:assignment, a)
      end

      describe "with feature disabled" do
        it "does not show the new assignments toggle button" 


        it "shows the old assignments page even with query parameter" 

      end

      describe "with feature enabled" do
        before :once do
          Account.default.enable_feature! :assignments_2
        end

        it "shows the new assignments toggle button" 


        it "shows the assignments 2 page when the query parameter is present" 

      end
    end
  end

  describe "moderation page link" do
    before :each do
      course_with_teacher(active_all: true)
      view_context(@course, @user)
      g = @course.assignment_groups.create!(name: "Homework")
      a = @course.assignments.create!(title: "Introduce Yourself")
      a.assignment_group_id = g.id
      a.save!
      assign(:assignment, a)
      assign(:assignment_groups, [g])
      assign(:current_user_rubrics, [])
    end

    it "is rendered when 'show_moderation_link' is true" 


    it "is not rendered when 'show_moderation_link' is false" 

  end

  context 'plagiarism platform' do
    include_context 'lti2_spec_helper'

    let(:eula_url) { 'https://www.test.com/eula' }
    let(:eula_service) do
      {
        "endpoint" => eula_url,
        "action" => ["GET"],
        "@id" => 'http://www.test.com/lti/v2/services#vnd.Canvas.Eula',
        "@type" => "RestService"
      }
    end

    before do
      allow_any_instance_of(Assignment).to receive(:multiple_due_dates?) { true }
      allow(view).to receive(:eula_url) { eula_url }
    end

    it 'renders the eula url if present' 

  end
end

