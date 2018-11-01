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
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

require 'nokogiri'

describe AccountsController do

  context "SAML meta data" do
    before(:each) do
      skip("requires SAML extension") unless AuthenticationProvider::SAML.enabled?
      @account = Account.create!(:name => "test")
    end

    it 'should render for non SAML configured accounts' 


    it "should use the correct entity_id" 


    it "renders valid schema" 

  end

  context "section tabs" do
    it "should change in response to role override changes" 

  end
end

