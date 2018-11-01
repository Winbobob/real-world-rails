#
# Copyright (C) 2016 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')
require 'delayed/testing'

describe BrandConfigRegenerator do
  let(:new_brand_config) { BrandConfig.for(variables: {"ic-brand-primary" => "green"}) }
  def setup_account_family_with_configs
    @parent_account = Account.default
    @parent_account.brand_config = @parent_config = BrandConfig.for(variables: {"ic-brand-primary" => "red"})
    @parent_config.save!
    @parent_account.save!
    @parent_shared_config = @parent_account.shared_brand_configs.create!(
      name: 'parent theme',
      brand_config_md5: @parent_config.md5
    )

    @child_account = Account.create!(parent_account: @parent_account, name: 'child')
    @child_account.brand_config = @child_config = BrandConfig.for(variables: {"ic-brand-global-nav-bgd" => "white"}, parent_md5: @parent_config.md5)
    @child_config.save!
    @child_account.save!
    @child_shared_config = @child_account.shared_brand_configs.create!(
      name: 'child theme',
      brand_config_md5: @child_config.md5
    )

    @grand_child_account = Account.create!(parent_account: @child_account, name: 'grand_child')
    @grand_child_account.brand_config = @grand_child_config = BrandConfig.for(variables: {"ic-brand-global-nav-avatar-border" => "blue"}, parent_md5: @child_config.md5)
    @grand_child_config.save!
    @grand_child_account.save!
    @grand_child_shared_config = @grand_child_account.shared_brand_configs.create!(
      name: 'grandchild theme',
      brand_config_md5: @grand_child_config.md5
    )
  end

  it "generates the right child brand configs and SharedBrandConfigs within subaccounts" 


  it "handles orphan themes that were not decendant of @parent_account" 


  it "handles reverting to default (nil) theme correctly" 


  it "handles site_admin correctly" 

end

