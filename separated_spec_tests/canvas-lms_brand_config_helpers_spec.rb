# coding: utf-8
#
# Copyright (C) 2015 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')
require 'delayed/testing'

describe BrandConfigHelpers do
  def setup_account_family_with_configs
    @parent_account = Account.default
    @parent_config = BrandConfig.for(
      variables: {"ic-brand-primary" => "red"},
      js_overrides: nil,
      css_overrides: nil,
      mobile_js_overrides: nil,
      mobile_css_overrides: nil,
      parent_md5: nil
    )
    @parent_config.save!
    @parent_account.brand_config_md5 = @parent_config.md5
    @parent_account.save!

    @child_account = Account.create!(:parent_account => @parent_account)
    @child_config = BrandConfig.for(
      variables: {"ic-brand-global-nav-bgd" => "white"},
      parent_md5: @parent_config.md5,
      js_overrides: nil,
      css_overrides: nil,
      mobile_js_overrides: nil,
      mobile_css_overrides: nil
    )
    @child_config.save!
    @child_account.brand_config_md5 = @child_config.md5
    @child_account.save!

    @grand_child_account = Account.create!(:parent_account => @child_account)
    @grand_child_config = BrandConfig.for(
      variables: {"ic-brand-global-nav-avatar-border" => "blue"},
      parent_md5: @child_config.md5,
      js_overrides: nil,
      css_overrides: nil,
      mobile_js_overrides: nil,
      mobile_css_overrides: nil
    )
    @grand_child_config.save!
    @grand_child_account.brand_config_md5 = @grand_child_config.md5
    @grand_child_account.save!
  end

  describe "first_parent_brand_config" do
    before :once do
      setup_account_family_with_configs
    end

    it "should return nill without a parent" 


    it "should work when parent is a root account" 


    it "should work when parent is a not root account" 


    it "should work with site_admin" 

  end
end

