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

describe UnzipAttachment do
  def fixture_filename(filename)
    File.expand_path(File.join(File.dirname(__FILE__), %W(.. fixtures #{filename})))
  end

  def add_folder_to_course(name)
    folder_model :name => name
    @course.folders << @folder
    @course.save!
    @course.reload
  end

  before do
    course_model
    add_folder_to_course 'course files'
  end

  context "unzipping" do
    let(:filename) { fixture_filename('attachments.zip') }
    let(:unzipper) { UnzipAttachment.new( :course => @course, :filename => filename) }

    it "should store a course, course_files_folder, and filename" 


    it "should be able to take a root_directory argument" 


    describe 'after processing' do
      before { unzipper.process; @course.reload }

      let(:first_attachment) { @course.attachments.where(display_name: 'first_entry.txt').first }
      let(:second_attachment) { @course.attachments.where(display_name: 'second_entry.txt').first }

      it "should unzip the file, create folders, and stick the contents of the zipped file as attachments in the folders" 


      it "should be able to overwrite files in a folder on the database (if their md5 differs)" 


      it "should update attachment items in modules when overwriting their files via zip upload" 

    end

    it "should update progress as it goes" 


    it "should import files alphabetically" 


    it "should not fall over when facing a filename starting with ~" 


    describe 'validations' do

      let(:filename) { fixture_filename('huge_zip.zip') }

      it 'errors when the number of files in the zip exceed the configured limit' 


      it 'errors when the file quotas push the context over its quota' 


      it 'should be able to rescue the file quota error' 

    end

    describe 'zip bomb mitigation' do
      # unzip -l output for this file:
      #  Length     Date   Time    Name
      # --------    ----   ----    ----
      #       12  02-05-14 16:03   a
      #       18  02-05-14 16:03   b
      #       70  02-05-14 16:05   c   <-- this is a lie.  the file is really 10K
      #       19  02-05-14 16:03   d
      let(:filename) { fixture_filename('zipbomb.zip') }

      it 'double-checks the extracted file sizes in case the central directory lies' 


      it "doesn't interfere when the quota is 0 (unlimited)" 


      it "lets incorrect central directory size slide if the quota isn't exceeded" 

    end

  end
end

