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
#

require_relative '../api_spec_helper'

describe SharedBrandConfigsController, type: :request do

  let(:brand_config) { BrandConfig.create!(variables: {"ic-brand-primary" => "#321"}) }
  let(:shared_config) { Account.default.shared_brand_configs.create!(
    name: "name before update",
    brand_config_md5: brand_config.md5)
  }

  describe '#create' do
    let(:url) { "/api/v1/accounts/#{Account.default.id}/shared_brand_configs" }
    let(:api_args_for_create) {
      {
        controller: 'shared_brand_configs',
        action: 'create',
        format: 'json',
        account_id: Account.default.id.to_s
      }
    }
    let(:params) {
      {shared_brand_config: {'name' => 'New Theme', 'brand_config_md5' => brand_config.md5}}
    }

    it "doesn't allow unauthorized access" 


    it "shares within the correct account" 


    it "errors if invalid" 

  end

  describe "#update" do
    let(:params) { {shared_brand_config: {'name' => 'Updated Name'}} }
    let(:api_args_for_update) {
      {
        controller: 'shared_brand_configs',
        action: 'update',
        format: 'json',
        account_id: Account.default.id.to_s,
        id: shared_config.id
      }
    }
    let(:url) { "/api/v1/accounts/#{Account.default.id}/shared_brand_configs/#{shared_config.id}"}

    it "doesn't allow unauthorized access" 


    it "can rename a shared brand config" 


    it "returns invalid for a bad md5" 

  end

  describe  "#destroy" do
    let(:api_args_for_destroy) {
      {
        controller: 'shared_brand_configs',
        action: 'destroy',
        format: 'json',
        id: shared_config.id
      }
    }
    let(:url) { "/api/v1/shared_brand_configs/#{shared_config.id}"}

    it "doesn't allow unauthorized access" 


    it "deletes the given shared_brand_config" 

  end
end

