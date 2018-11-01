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

require_relative '../../lib/duplicating_objects'
require 'set'
describe DuplicatingObjects do
  include DuplicatingObjects

  describe 'normalize_title' do
    it 'test it' 

  end

  describe 'get_copy_title' do
    class MockEntity
      def initialize(title)
        @title = title
      end

      def get_potentially_conflicting_titles(_title_base)
        [ 'Foo', 'assignment Copy', 'Foo Copy', 'Foo Copy 1', 'Foo Copy 2', 'Foo Copy 5' ].to_set
      end

      attr_accessor :title
    end

    it 'copy treated as "Copy" but case is respected' 


    it 'no conflicts' 


    it 'conflict not ending in suffix' 


    it 'conflict ending in suffix' 


    it 'increments from given number' 

  end
end

