#
# Copyright (C) 2014 - present Instructure, Inc.
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

describe FilePreviewsController do
  before(:once) do
    @account = Account.default
    @account.enable_service(:google_docs_previews)
    course_with_student(account: @account, active_all: true)
  end

  before(:each) do
    user_session(@student)
  end

  it "should require authorization to view the file" 


  it "should render lock information for the file" 


  it "should 404 (w/o canvas chrome) if the file doesn't exist" 


  it "should redirect to crododoc_url if available and params[:annotate] is given" 


  it "should redirect to canvadocs_url if available" 


  it "should redirect to a google doc preview if available" 


  it "should redirect to file if it's html" 


  it "should render a download link if no previews are available" 


  it "should render an img element for image types" 


  it "should render a media tag for media types" 


  it "should fulfill module completion requirements" 


  it "should log asset accesses when previewable" 


  it "should not log asset accesses when not previewable" 


  it "should work with hidden files" 

end

