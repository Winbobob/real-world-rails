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
require_dependency "lti/variable_expansion"

module Lti
  describe VariableExpansion do

    class TestExpander
      attr_accessor :one, :two, :three

      def initialize
        @one = 1
        @two = 2
        @three = 3
      end
    end

    it 'must accept multiple guards and combine their results with a logical AND' 


    it 'accepts and sets default_name' 


    it 'expands variables' 


    it 'does not expand if the guard evals false' 

  end
end

