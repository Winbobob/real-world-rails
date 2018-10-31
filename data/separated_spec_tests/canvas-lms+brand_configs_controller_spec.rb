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

describe BrandConfigsController do
  before :once do
    @account = Account.default
    @bc = BrandConfig.create(variables: {"ic-brand-primary" => "#321"})
  end

  describe '#index' do
    it "should allow authorized admin to view" 


    it 'should not allow non admin access' 


    it 'requires branding enabled on the account' 

  end

  describe '#new' do
    it "should allow authorized admin to see create" 


    it "should not allow non admin access" 


    it "should create variableSchema based on parent configs" 

  end

  describe '#create' do
    let_once(:admin) { account_admin_user(account: @account) }
    let(:bcin) { { variables: { "ic-brand-primary" => "#000000" } } }

    it "should allow authorized admin to create" 


    it "should not fail when a brand_config is not passed" 


    it 'should not allow non admin access' 


    it 'should return an existing brand config' 


    it 'should upload a js file successfully' 

  end

  describe '#destroy' do
    it "should allow authorized admin to create" 


    it 'should not allow non admin access' 

  end

  describe '#save_to_account' do
    it "should allow authorized admin to create" 


    it 'should regenerate sub accounts' 


    it 'should not allow non admin access' 

  end

  describe '#save_to_user_session' do
    it "should allow authorized admin to create" 


    it "should allow authorized admin to remove" 


    it 'should not allow non admin access' 

  end
end

