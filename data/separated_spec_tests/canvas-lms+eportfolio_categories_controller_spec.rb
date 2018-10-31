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

describe EportfolioCategoriesController do
  before :once do
    eportfolio_with_user(:active_all => true)
  end

  def eportfolio_category
    @category = @portfolio.eportfolio_categories.create(:name => "some name")
  end

  describe "GET 'index'" do
    it "should redirect" 

  end

  describe "GET 'show'" do
    before(:once) { eportfolio_category }
    it "should require authorization" 


    it "should assign variables" 


    it "should responsd to named category request" 

  end

  describe "POST 'create'" do
    it "should require authorization" 


    it "should create eportfolio category" 

  end

  describe "PUT 'update'" do
    before(:once) { eportfolio_category }
    it "should require authorization" 


    it "should update eportfolio category" 

  end

  describe "DELETE 'destroy'" do
    before(:once) { eportfolio_category }
    it "should require authorization" 


    it "should delete eportfolio category" 

  end
end

