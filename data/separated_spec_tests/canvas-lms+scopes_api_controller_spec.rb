#
# Copyright (C) 2018 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')

describe ScopesApiController, type: :request do

  before { enable_default_developer_key! }

  # We want to force the usage of the fallback scope mapper here, not the generated version
  Object.const_set("ApiScopeMapper", ApiScopeMapperLoader.api_scope_mapper_fallback)

  describe "index" do
    before do
      allow_any_instance_of(Account).to receive(:feature_enabled?).and_return(false)
    end

    let(:account) { account_model }
    let(:api_url) { "/api/v1/accounts/#{account.id}/scopes" }

    let(:scope_params) do
      {
        controller: 'scopes_api',
        action: 'index',
        format: 'json',
        account_id: account.id.to_s
      }
    end

    context "with admin" do
      before do
        account_admin_user(:account => account)
        user_with_pseudonym(:user => @admin)
      end

      it "returns expected scopes" 


      it "groups scopes when group_by is passed in" 


      it "returns expected scopes when flag is disabled and Setting is set" 

    end

    context "with nonadmin" do
      before do
        user_with_pseudonym(account: account)
      end

      it "returns a 401" 

    end
  end
end

