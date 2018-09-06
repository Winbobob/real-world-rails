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

require File.expand_path(File.dirname(__FILE__) + '/helpers/wiki_and_tiny_common')

describe "Wiki pages and Tiny WYSIWYG editor" do
  include_context "in-process server selenium tests"
  include WikiAndTinyCommon

  context "as a teacher" do

    before(:each) do
      course_with_teacher_logged_in
    end

    it "should add a quiz to the rce" 


    it "should add an assignment to the rce" 


    ['Only teachers', 'Teachers and students', 'Anyone'].each_with_index do |permission, i|
      it "should validate correct permissions for #{permission}" 

    end

    it "should take user to page history" 


    it "should load the previous version of the page and roll-back page" 

  end
end

