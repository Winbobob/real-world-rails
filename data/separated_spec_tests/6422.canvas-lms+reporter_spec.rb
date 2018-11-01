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

require 'spec_helper'

class MyTestError < StandardError
  def response_status
    401
  end
end

describe Canvas::Errors::Reporter do

  it "Should be able to catch a composed exception" 


  it "Should have extra info" 


  it "Should have correct backtrace" 


  it "Shouldn't mess with existing classes" 


  it "Should inherrit from existing class" 


  it "Typical usecase" 


  def extra_error_info
    {
      princess_mode: false,
      unicorn_spotted: true,
      garbage: "%%jksdh38912398732987lkhjsadfkjhdfslk"
    }
  end

  def error_instance
    begin
      typical_usage
    rescue MyTestError => err
      return err
    end
  end

  def typical_usage
    Canvas::Errors::Reporter.raise_canvas_error(MyTestError, "I am an error message", extra_error_info)
  end
end

