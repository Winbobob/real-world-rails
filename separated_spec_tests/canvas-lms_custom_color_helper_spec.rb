#
# Copyright (C) 2015 - present Instructure, Inc.
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

describe CustomColorHelper do
  include CustomColorHelper

  describe '#valid_hexcode?' do
    it 'accepts hexcodes with a #' 


    it 'accepts hexcodes without the #' 


    it 'accepts hexcodes consisting of 3 characters' 


    it 'accepts hexcodes consisting of 3 characters with the #' 


    it 'rejects hexcodes consisting of non hex characters' 


    it 'rejects hexcodes of less than 3 characters' 


    it 'rejects hexcodes consisting of 4 characters' 


    it 'rejects hexcodes consisting of 5 characters' 


    it 'rejects hexcodes consisting of more than 6 characters' 


    it 'rejects hexcodes consisting of more than 6 characters without the #' 

  end

  describe '#normalize_hexcode' do
    it 'returns the passed in hexcode if it already has a #' 


    it 'returns the hexcode with the # if it was not provided' 

  end
end

