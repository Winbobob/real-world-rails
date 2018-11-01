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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../views_helper')

describe "/eportfolios/show" do
  before do
    eportfolio_with_user
    view_portfolio
    category = assign(:category, @portfolio.eportfolio_categories.create!(:name => "some category"))
    assign(:categories, [category])
    assign(:recent_submissions, [])
    assign(:folders, [])
    assign(:files, [])
    assign(:page, @portfolio.eportfolio_entries.create!(:name => "some entry", :eportfolio_category => category))
  end

  it "should render" 


  it "should not link the user name if @owner_url is not set" 


  it "should link the user name if @owner_url is set" 


  it "should show the share link explicitly" 


  it "shows submitted submissions and the right submission preview link" 


  it "shows graded submissions" 


  it "does not show submissions for unpublished assignments" 


  it "does not show submissions for unpublished courses" 


  it "does not show submissions unless submission is submitted" 


  it "does not show submissions that are pending review" 

end

