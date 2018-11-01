#
# Copyright (C) 2017 - present Instructure, Inc.
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

require 'spec_helper'

describe WebZipExportHelper do
  include WebZipExportHelper

  before :once do
    course_with_student(active_all: true)
    @context = @course
  end

  describe '#course_allow_web_export_download?' do
    it 'should return setting' 

  end

  describe '#allow_web_export_for_course_user?' do
    it 'should return true for admins' 


    it 'should return true for current course users' 


    it 'should return false for anonymous users' 


    it 'should return false for concluded users without access to the course' 

  end

  describe '#allow_web_export_download?' do
    it 'should return true if setting is enabled and user can export' 

  end
end

