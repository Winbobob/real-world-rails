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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

require 'nokogiri'

describe ProfileController do
  def enter_student_view(opts={})
    course = opts[:course] || @course || course(opts)
    @fake_student = course.student_view_student
    post "/users/#{@fake_student.id}/masquerade"
    expect(session[:become_user_id]).to eq @fake_student.id.to_s
  end

  it "should respect account setting for editing names" 


  it "should not show student view student edit profile or other services options" 

end

