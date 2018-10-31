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
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe FileInContext do
  before do
    course_model
    folder_model(:name => 'course files')
    @course.folders << @folder
    @course.save!
    @course.reload
  end

  context "#attach" do
    it "should create files with the supplied filename escaped for s3" 


    describe "usage rights required" do
      before do
        @course.enable_feature! :usage_rights_required
        @filename = File.expand_path(File.join(File.dirname(__FILE__), %w(.. fixtures files a_file.txt)))
      end

      it "should create files in unpublished state" 


      it "should create files as published in non-course context" 

    end
  end
end

