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

describe RubricsController do
  describe "GET 'index'" do
    it "should require authorization" 


    describe 'variables' do
      before { course_with_teacher_logged_in(:active_all => true) }

      it "should be assigned with a course" 


      it "should be assigned with a user" 

    end
  end

  describe "POST 'create' for course" do
    it "should require authorization" 


    it "should assign variables" 


    it "should create an association if specified" 


    it "should create an association if specified without manage_rubrics permission " 


    it "should associate outcomes correctly" 

  end

  describe "PUT 'update'" do
    it "should require authorization" 

    it "should assign variables" 

    it "should update the rubric if updateable" 

    it "should update the rubric even if it doesn't belong to the context, just an association" 


    # this happens after a importing content into a new course, before a new
    # association is set up
    it "should create a new rubrice (and not update the existing rubric) if it doesn't belong to the context or to an association" 

    it "should not update the rubric if not updateable (should make a new one instead)" 

    it "should not update the rubric and not create a new one if the parameters don't change the rubric" 


    it "should update the newly-created rubric if updateable, even if the old id is specified" 

    it "should update the association if specified" 


    it "should add an outcome association if one is linked" 


    it "should remove an outcome association if one is removed" 


    it "should remove an outcome association for all associations" 

  end

  describe "DELETE 'destroy'" do
    it "should require authorization" 

    it "should delete the rubric" 

    it "should delete the rubric if the rubric is only associated with a course" 

    it "should delete the rubric association even if the rubric doesn't belong to a course" 

  end

  describe "GET 'show'" do
    before { course_with_teacher_logged_in(active_all: true) }

    it "doesn't load nonsense" 


    it "returns 404 if record doesn't exist" 



    it "works" 

  end
end

