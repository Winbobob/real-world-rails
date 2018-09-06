#
# Copyright (C) 2012 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/common')

describe "links", priority: "2" do
  include_context "in-process server selenium tests"

  before (:each) do
    course_with_teacher_logged_in
  end

  describe "course links" do
    before (:each) do
      get "/courses/#{@course.id}"
    end

    def find_link(link_css)
      link_section = f('#section-tabs')
      link_element = link_section.find_element(:css, link_css)
      link_element
    end

    it "should navigate user to home page after home link is clicked" 


    it "should navigate user to announcements page after announcements link is clicked" 


    it "should navigate user to assignments page after assignments link is clicked" 


    it "should navigate user to discussions page after discussions link is clicked" 


    it "should navigate user to gradebook page after grades link is clicked" 


    it "should navigate user to users page after people link is clicked" 


    it "should navigate user to wiki page after pages link is clicked" 


    it "should navigate user to files page after files link is clicked" 


    it "should navigate user to syllabus page after syllabus link is clicked" 


    it "should navigate user to outcomes page after outcomes link is clicked" 


    it "should navigate user to quizzes page after quizzes link is clicked" 


    it "should navigate user to modules page after modules link is clicked" 


    it "should navigate user to settings page after settings link is clicked" 

  end

  describe "dashboard links" do
    before (:each) do
      get "/"
    end

    context "right side links" do

      it "should navigate user to conversations page after inbox link is clicked" 


      it "should navigate user to user settings page after settings link is clicked" 

    end

    context "global nav links" do

      it "should navigate user to main page after canvas logo link is clicked" 


      it "should navigate user to the calendar page after calender link is clicked" 

    end
  end
end

