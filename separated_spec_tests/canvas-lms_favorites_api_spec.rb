#
# Copyright (C) 2012 Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')

describe "Favorites API", type: :request do
  before :once do
    user_factory(active_all: true)
    @courses = create_courses(6, enroll_user: @user, enrollment_type: "StudentEnrollment", return_type: :record)
  end

  context "implicit favorites" do
    it "should list favorite courses" 


    context "observed users" do
      before :once do
        @observer_enrollment = course_with_observer(active_all: true)
        @observer = @user
        @courses << @course
        @observer_course = @course
        @observed_student = create_users(1, return_type: :record).first
        @student_enrollment =
          @observer_course.enroll_student(@observed_student,
                                          :enrollment_state => 'active')
        @assigned_observer_enrollment =
          @observer_course.enroll_user(@observer, "ObserverEnrollment",
                                       :associated_user_id => @observed_student.id)
        @assigned_observer_enrollment.accept
      end

      it "includes observed users" 

    end
  end

  context "explicit favorites" do
    before :once do
      @courses[0...3].each do |course|
        @user.favorites.build(:context => course)
      end
      @user.save
    end

    it "should list favorite courses" 


    it "should add a course to favorites" 


    it "should create favorites from implicit favorites when removing a course" 


    it "should remove a course from favorites" 


    it "should not create a duplicate by fav'ing an already faved course" 


    it "should return an empty hash when removing a non-faved course" 


    it "should reset favorites" 

  end

  context "group favorites" do
    before :each do
      @user = user_model
      @context = course_model
      @group_fave = Group.create!(:name=>"group1", :context=>@context)
      @group_not_fave = Group.create!(:name=>"group2", :context=>@context)
      @group_not_yet_fave= Group.create!(:name=>"group3", :context=>@context)
      @group_fave.add_user(@user)
      @group_not_fave.add_user(@user)
      @group_not_yet_fave.add_user(@user)
      @user.favorites.build(:context => @group_fave)
      @user.save
    end
    it "add favorite group" 

    it "lists favorite groups" 

    it "clears favorite groups" 

    it "deletes one favorite group" 

    it "lists all groups if none are favorited" 

  end

  it "should ignore master courses if requested" 

end

