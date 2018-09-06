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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../helpers/graphql_type_tester')

describe Types::UserType do
  let_once(:user) { student_in_course(active_all: true); @student }
  let(:user_type) { GraphQLTypeTester.new(Types::UserType, user) }

  it "works" 


  context "avatarUrl" do
    it "is nil when avatars are not enabled" 


    it "returns an avatar url when avatars are enabled" 

  end

  context "enrollments" do
    before(:once) do
      @course1 = @course
      @course2 = course_factory
      student_in_course(user: @student, course: @course2, active_all: true)
    end

    it "returns enrollments for a given course" 


    it "returns all enrollments for a user (that can be read)" 


    it "doesn't return enrollments for courses the user doesn't have permission for" 

  end

  context "email" do
    before(:once) do
      user.email = "cooldude@example.com"
      user.save!
    end

    it "returns email for teachers/admins" 


    it "doesn't return email for others" 

  end
end

