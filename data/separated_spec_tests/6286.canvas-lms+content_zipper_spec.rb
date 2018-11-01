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

describe ContentZipper do
  before do
    local_storage!
  end

  describe "zip_assignment" do
    it "processes user names" 


    context 'anonymous assignments' do
      before(:once) do
        course = Course.create!
        student = User.create!(name: 'fred')
        @teacher = User.create!
        course.enroll_student(student, enrollment_state: :active)
        course.enroll_teacher(@teacher, enrollment_state: :active)
        @assignment = course.assignments.create!(anonymous_grading: true, muted: true)
        @assignment.submit_homework(student, body: 'homework')
        @attachment = @assignment.attachments.create!(
          display_name: 'my_download.zip',
          user: @teacher,
          workflow_state: 'to_be_zipped'
        )
      end

      it 'omits user names if the assignment is anonymous and muted' 


      it 'includes user names if the assignment is anonymous and unmuted' 

    end

    it "should ignore undownloadable submissions" 


    it "should zip up online_url submissions" 


    it "should zip up online_text_entry submissions" 


    it "should only include submissions in the correct section " 


    it "only includes one submission per group" 


    it 'only includes un-deleted attachments' 

  end

  describe "assignment_zip_filename" do
    it "should use use course and title slugs to keep filename length down" 

  end

  describe "hard concluded course submissions" do
    it "should still download the content" 

  end

  describe "zip_folder" do
    context "checking permissions" do
      before(:each) do
        course_with_student(active_all: true)
        folder = Folder.root_folders(@course).first
        attachment_model(uploaded_data: stub_png_data('hidden.png'),
                         content_type: 'image/png', hidden: true, folder: folder)
        attachment_model(uploaded_data: stub_png_data('visible.png'),
                         content_type: 'image/png', folder: folder)
        attachment_model(uploaded_data: stub_png_data('locked.png'),
                         content_type: 'image/png', folder: folder, locked: true)
        hidden_folder = folder.sub_folders.create!(context: @course, name: 'hidden', hidden: true)
        visible_folder = folder.sub_folders.create!(context: @course, name: 'visible')
        locked_folder = folder.sub_folders.create!(context: @course, name: 'locked', locked: true)
        attachment_model(uploaded_data: stub_png_data('sub-hidden.png'),
                         content_type: 'image/png', folder: hidden_folder)
        attachment_model(uploaded_data: stub_png_data('sub-vis.png'),
                         content_type: 'image/png', folder: visible_folder)
        attachment_model(uploaded_data: stub_png_data('sub-locked.png'),
                         content_type: 'image/png', folder: visible_folder, locked: true)
        attachment_model(uploaded_data: stub_png_data('sub-locked-vis.png'),
                         content_type: 'image/png', folder: locked_folder)

        @attachment = Attachment.new(display_name: 'my_download.zip')
        @attachment.workflow_state = 'to_be_zipped'
        @attachment.context = folder
      end

      def zipped_files_for_user(user=nil, check_user=true)
        @attachment.user_id = user.id if user
        @attachment.save!
        ContentZipper.process_attachment(@attachment, user, check_user: check_user)
        names = []
        @attachment.reload
        Zip::File.foreach(@attachment.full_filename) {|f| names << f.name if f.file? }
        names.sort
      end

      context "in course with files tab hidden" do
        before do
          @course.tab_configuration = [{
            id: Course::TAB_FILES,
            hidden: true
          }]
          @course.save
        end

        it "should give logged in students some files" 


        it "should give logged in teachers all files" 

      end

      context "in a private course" do
        it "should give logged in students some files" 


        it "should give logged in teachers all files" 


        it "should give logged out people no files" 


        it "should give all files if check_user=false" 

      end

      context "in a public course" do
        before(:each) do
          @course.is_public = true
          @course.save!
        end

        it "should give logged in students some files" 


        it "should give logged in teachers all files" 


        it "should give logged out people the same thing as students" 


        it "should give all files if check_user=false" 

      end
    end

    it "should not error on empty folders" 


    describe "error handling" do
      before :once do
        course_with_student(active_all: true)
        @root = Folder.root_folders(@course).first
        @bad_file = @course.attachments.create!(folder: @root, uploaded_data: StringIO.new("bad"), filename: "bad")
        @bad_file.update_attribute(:filename, "not the real filename try and open this now sucka")
        @attachment = Attachment.new(display_name: 'my_download.zip')
        @attachment.user_id = @user.id
        @attachment.workflow_state = 'to_be_zipped'
        @attachment.context = @root
        @attachment.save!
      end

      it "should error if no files could be added" 


      it "should skip files that couldn't be opened, without failing the download" 

    end

    it "should use the display name" 

  end

  describe "mark_successful!" do
    it "sets an instance variable representing a successful zipping" 

  end

  describe "zip_eportfolio" do
    it "processes page entries with no content" 


    it "processes the zip file name" 

  end

  describe "render_eportfolio_page_content" do
    it "should return the text of the file contents" 

  end

  describe "mark_attachment_as_zipping!" do

    it "marks the workflow state as zipping" 

  end

  describe "update_progress" do

    it "updates the zip attachment's state to a percentage and save!s it" 

  end

  describe "complete_attachment" do

    before { @attachment = Attachment.new display_name: "I <3 testing.png" }
    context "when attachment wasn't zipped successfully" do
      it "moves the zip attachment into an error state and save!s it" 

    end

    context "attachment was zipped successfully" do
      it "creates uploaded data for the assignment and marks it as available" 

    end
  end

  describe "zip_quiz" do
    it "delegates to a QuizSubmissionZipper" 

  end
end

