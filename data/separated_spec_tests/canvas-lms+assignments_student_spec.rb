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

require_relative '../common'
require_relative '../helpers/assignments_common'
require_relative '../helpers/google_drive_common'

describe "assignments" do
  include_context "in-process server selenium tests"
  include GoogleDriveCommon
  include AssignmentsCommon

  context "as a student" do

    before(:each) do
      course_with_student_logged_in
    end

    before do
      @due_date = Time.now.utc + 2.days
      @assignment = @course.assignments.create!(:title => 'default assignment', :name => 'default assignment', :due_at => @due_date)
    end

    it "should order undated assignments by title and dated assignments by first due" 


    it "should highlight mini-calendar dates where stuff is due" 


    it "should not show submission data when muted" 


    it "should have group comment radio buttons for individually graded group assignments" 


    it "should have hidden group comment input for group graded group assignments" 


    it "should not show assignments in an unpublished course" 


    it "should verify lock until date is enforced" 


    it "should verify due date is enforced" 


    it "should show assignment data if locked by due date or lock date" 



    it "should still not show assignment data if locked by unlock date" 


    context "overridden lock_at" do
      before :each do
        setup_sections_and_overrides_all_future
        @course.enroll_user(@student, 'StudentEnrollment', :section => @section2, :enrollment_state => 'active')
      end

      it "should show overridden lock dates for student" 


      it "should allow submission when within override locks" 

    end

    context "click_away_accept_alert" do #this context exits to handle the click_away_accept_alert method call after each spec that needs it even if it fails early to prevent other specs from failing
      after(:each) do
        click_away_accept_alert
      end

      it "should expand the comments box on click" 


      it "should validate file upload restrictions" 

    end

    context "google drive" do
      before do
        PluginSetting.create!(:name => 'google_drive', :settings => {})
        setup_google_drive()
      end

      it "should have a google doc tab if google docs is enabled", priority: "1", test_id: 161884 do
        @assignment.update_attributes(:submission_types => 'online_upload')
        get "/courses/#{@course.id}/assignments/#{@assignment.id}"
        f('.submit_assignment_link').click
        wait_for_animations

        expect(f("a[href*='submit_google_doc_form']")).to_not be_nil
      end

      context "select file or folder" do
        before(:each) do
          # double out function calls
          google_drive_connection = double()
          allow(google_drive_connection).to receive(:service_type).and_return('google_drive')
          allow(google_drive_connection).to receive(:retrieve_access_token).and_return('access_token')
          allow(google_drive_connection).to receive(:authorized?).and_return(true)

          # double files to show up from "google drive"
          file_list = create_file_list
          allow(google_drive_connection).to receive(:list_with_extension_filter).and_return(file_list)

          allow_any_instance_of(ApplicationController).to receive(:google_drive_connection).and_return(google_drive_connection)

          # create assignment
          @assignment.update_attributes(:submission_types => 'online_upload')
          get "/courses/#{@course.id}/assignments/#{@assignment.id}"
          f('.submit_assignment_link').click
          f("a[href*='submit_google_doc_form']").click
          wait_for_animations
        end

        it "should select a file from google drive", priority: "1", test_id: 161886 do
          # find file in list
          # the file we are looking for is created as the second file in the list
          expect(ff(".filename")[1]).to include_text("test.mydoc")
        end

        it "should select a file in a folder from google drive", priority: "1", test_id: 161885 do
          # open folder
          f(".folder").click
          wait_for_animations

          # find file in list
          expect(f(".filename")).to include_text("nested.mydoc")
        end
      end

      it "forces users to authenticate", priority: "1", test_id: 161892 do
        # double out google drive
        google_drive_connection = double()
        allow(google_drive_connection).to receive(:service_type).and_return('google_drive')
        allow(google_drive_connection).to receive(:retrieve_access_token).and_return(nil)
        allow(google_drive_connection).to receive(:authorized?).and_return(nil)
        allow_any_instance_of(ApplicationController).to receive(:google_drive_connection).and_return(google_drive_connection)

        @assignment.update_attributes(:submission_types => 'online_upload')
        get "/courses/#{@course.id}/assignments/#{@assignment.id}"
        f('.submit_assignment_link').click
        f("a[href*='submit_google_doc_form']").click
        wait_for_animations

        # button that forces users to authenticate if they want to use google drive
        expect(fln("Authorize Google Drive Access")).to be_truthy
      end
    end

    it "should list the assignments" 


    it "should not show add/edit/delete buttons" 


    it "should default to grouping by date" 


    it "should allowing grouping by assignment group (and remember)" 


    it "should not show empty groups" 


    it "should show empty assignment groups if they have a weight" 


    it "should correctly categorize assignments by date" 

  end
end

