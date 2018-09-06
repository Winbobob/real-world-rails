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

describe RubricAssociationsController do
  describe "POST 'create'" do
    it "should require authorization" 

    it "should assign variables" 

    it "should create without manager_rubrics permission" 

  end

  describe "PUT 'update'" do
    it "should require authorization" 

    it "should assign variables" 

    it "should update the rubric if updateable" 

    it "should not update the rubric if not updateable (should make a new one instead)" 

    it "should update the association" 

  end

  describe "DELETE 'destroy'" do
    it "should require authorization" 

    it "should delete the rubric if deletable" 

    it "should_not delete the rubric if still created at the context level instead of the assignment level" 

    it "should delete only the association if the rubric is not deletable" 


    it "should remove aligments links" 

  end
end

