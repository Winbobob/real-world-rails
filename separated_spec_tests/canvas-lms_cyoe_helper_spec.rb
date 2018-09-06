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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CyoeHelper do
  include CyoeHelper

  FakeItem = Struct.new(:id, :content_type, :graded?, :content).freeze
  FakeContent = Struct.new(:assignment?, :graded?).freeze
  FakeTag = Struct.new(:id, :assignment).freeze

  describe 'cyoeable item' do

    it 'should return false if an item is not a quiz or assignment' 


    context 'graded' do
      it 'should return true for quizzes and assignments' 

    end

    context 'ungraded' do
      it 'should not return true for quizzes or assignments' 

    end
  end

  describe 'cyoe rules' do
    before do
      allow(ConditionalRelease::Service).to receive(:rules_for).and_return([
        {
          trigger_assignment: 1,
          locked: false,
          selected_set_id: 99,
          assignment_sets: [{assignments: [{assignment_id: 2}]}],
        }
      ])
    end

    it 'should return rules for the mastery path for a matched assignment' 


    describe 'path data for student' do
      before do
        @context = course_factory(active_all: true)
        @current_user = user_factory
      end

      it 'should return url data for the mastery path if assignments in set are visible' 


      it 'should list as processing if all requirements are met but assignment is not yet visible' 


      it 'should set awaiting_choice to true if sets exist but none are selected' 

    end

  end
end

