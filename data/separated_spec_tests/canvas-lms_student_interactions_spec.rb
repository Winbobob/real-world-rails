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

describe "student interactions links" do
  before(:each) do
    username = "nobody@example.com"
    password = "asdfasdf"
    u = user_with_pseudonym :active_user => true,
                            :username => username,
                            :password => password
    u.save!
    @e = course_with_teacher :active_course => true,
                            :user => u,
                            :active_enrollment => true
    @e.save!
    @teacher = u
    user_session(@user, @pseudonym)

    user_model
    @student = @user
    @course.enroll_student(@student).accept

    user_model
    @student2 = @user
    @course.enroll_student(@student2).accept
  end

  it "should show the student link on the student's page" 


  it "should show the teacher link on the teacher's page" 


  it "should show mail link for teachers" 


  it "should recalculate grades on the first page load" 


  it "should not show mail link for admins" 

end



