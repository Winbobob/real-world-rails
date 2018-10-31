#
# Copyright (C) 2011 Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')

describe CustomGradebookColumnsApiController, type: :request do
  include Api
  include Api::V1::CustomGradebookColumn

  before :once do
    course_with_teacher active_all: true
    student_in_course active_all: true
    @user = @teacher
  end

  describe 'index' do
    before :once do
      @cols = 2.times.map { |i|
        @course.custom_gradebook_columns.create! title: "Col #{i+1}",
                                                 position: i
      }
      c = @course.custom_gradebook_columns.create! title: "deleted col",
                                                   position: 1
      @hidden = @course.custom_gradebook_columns.create! title: "hidden col",
                                                         position: 5,
                                                         hidden: true
      c.destroy
      @user = @teacher
    end

    it 'checks permissions' 


    it 'should return the custom columns' 


    it 'should paginate' 


    it 'returns hidden columns if requested' 

  end

  describe 'create' do
    it 'checks permissions' 


    it 'creates a column' 

  end

  describe 'update' do
    before(:once) { @col = @course.custom_gradebook_columns.create! title: "Foo" }

    it 'checks permissions' 


    it 'works' 

  end

  describe 'delete' do
    before :once do
      @col = @course.custom_gradebook_columns.create! title: "Foo"
    end

    it 'checks permissions' 


    it 'works' 


    it 'lets you toggle the hidden state' 

  end

  describe 'reorder' do
    it 'works' 

  end
end

