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

require File.expand_path(File.dirname(__FILE__) + '/common')
require File.expand_path(File.dirname(__FILE__) + '/helpers/assignments_common')

describe "assignments" do
  include_context "in-process server selenium tests"
  include AssignmentsCommon

  def click_away_accept_alert
    f('#section-tabs .home').click
    driver.switch_to.alert.accept # doing this step and the step above to avoid the alert from failing other selenium specs
  end

  def update_assignment_attributes(assignment, attribute, values, click_submit_link = true)
    assignment.update_attributes(attribute => values)
    get "/courses/#{@course.id}/assignments/#{assignment.id}"
    f('.submit_assignment_link').click if click_submit_link
  end

  context "as a student" do
    before(:each) do
      course_with_student_logged_in
    end

    before do
      @due_date = Time.now.utc + 2.days
      @assignment = @course.assignments.create!(:title => 'default assignment', :name => 'default assignment', :due_at => @due_date)
    end

    it "should validate an assignment created with the type of discussion" 


    it "should validate an assignment created with the type of not graded" 


    it "should validate on paper submission assignment type" 


    it "should validate no submission assignment type" 


    it "should validate that website url submissions are allowed" 


    it "should validate that text entry submissions are allowed" 


    it "should allow an assignment with all 3 online submission types" 


    it "should validate an assignment created with the type of external tool", priority: "1", test_id: 2624905 do
      allow(BasicLTI::Sourcedid).to receive(:encryption_secret) {'encryption-secret-5T14NjaTbcYjc4'}
      allow(BasicLTI::Sourcedid).to receive(:signing_secret) {'signing-secret-vp04BNqApwdwUYPUI'}
      t1 = factory_with_protected_attributes(@course.context_external_tools, :url => "http://www.example.com/", :shared_secret => 'test123', :consumer_key => 'test123', :name => 'tool 1')
      external_tool_assignment = assignment_model(:course => @course, :title => "test2", :submission_types => 'external_tool')
      external_tool_assignment.create_external_tool_tag(:url => t1.url)
      external_tool_assignment.external_tool_tag.update_attribute(:content_type, 'ContextExternalTool')
      get "/courses/#{@course.id}/assignments/#{external_tool_assignment.id}"

      expect(f('#tool_content')).to be_displayed
    end
  end
end

