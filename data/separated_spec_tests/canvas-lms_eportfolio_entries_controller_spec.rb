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
require File.expand_path(File.dirname(__FILE__) + '/../sharding_spec_helper')

describe EportfolioEntriesController do
  def eportfolio_category
    @category = @portfolio.eportfolio_categories.create
  end

  def eportfolio_entry(category=nil)
    @entry = @portfolio.eportfolio_entries.new
    @entry.eportfolio_category_id = category.id if category
    @entry.save!
  end

  before :once do
    eportfolio_with_user(:active_all => true)
    eportfolio_category
  end

  describe "GET 'show'" do
    before(:once) { eportfolio_entry(@category) }
    it "should require authorization" 

    
    it "should assign variables" 

    
    it "should work off of category and entry names" 

  end
  
  describe "POST 'create'" do
    it "should require authorization" 

    
    it "should create entry" 

  end
  
  describe "PUT 'update'" do
    before(:once) { eportfolio_entry(@category) }
    it "should require authorization" 

    
    it "should update entry" 

  end
  
  describe "DELETE 'destroy'" do
    before(:once) { eportfolio_entry(@category) }
    it "should require authorization" 

    
    it "should delete entry" 

  end
  
  describe "GET 'attachment'" do
    before(:once) { eportfolio_entry(@category) }
    it "should require authorization" 

    
    it "should redirect to page" 


    describe "with sharding" do
      specs_require_sharding

      it "should find attachments on all shards associated with user" 

    end
  end
end

