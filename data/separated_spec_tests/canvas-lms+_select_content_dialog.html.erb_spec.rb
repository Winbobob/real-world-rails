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
require File.expand_path(File.dirname(__FILE__) + '/../views_helper')

describe "/shared/_select_content_dialog" do

  it "should include unpublished wiki pages" 


  it "should not offer to create assignments or quizzes if the user doesn't have permission" 


  it "should offer to create assignments if the user has permission" 


  it "should create new topics in unpublished state if draft state is enabled" 


  describe "sorting" do
    before(:once) do
      course_with_teacher(active_all: true)
      @groupB = @course.assignment_groups.create!(name: 'group B')
      @groupA = @course.assignment_groups.create!(name: 'group A')
      view_context
    end

    it "sorts wiki pages by name" 


    it "sorts quizzes and the quiz assignment group selector by name" 


    it "sorts assignments by name within assignment groups, which are also sorted by name" 


    it "sorts discussion topics by name" 

  end

end


