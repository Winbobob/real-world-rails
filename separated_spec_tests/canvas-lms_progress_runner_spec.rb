#
# Copyright (C) 2013 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProgressRunner do
  before do
    @progress = double("progress").as_null_object
  end

  module ProgressMessages
    def message=(m)
      @message = m
    end

    def message
      @message
    end
  end

  it "should perform normal processing and update progress" 


  it "should rescue exceptions and record messages as errors" 


  it "should have default completion and error messages" 

  # These are also tested above
  #it "should accumulate like errors into a single mesage line"
  #it "should complete progress if only some records fail"

  it "should fail progress if all records fail" 


  it "updates progress frequency relative to size of input" 


end

