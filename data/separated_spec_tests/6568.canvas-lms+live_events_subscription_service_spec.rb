#
# Copyright (C) 2017 - present Instructure, Inc.
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

require_relative "../../spec_helper"
require_dependency "services/live_events_subscription_service"

module Services
  describe LiveEventsSubscriptionService do
    include WebMock::API

    around { |example| Setting.skip_cache(&example) }

    context 'service unavailable' do
      before do
        allow(Canvas::DynamicSettings).to receive(:find).with(any_args).and_call_original
        allow(Canvas::DynamicSettings).to receive(:find)
          .with('live-events-subscription-service', default_ttl: 5.minutes)
          .and_return(nil)
      end

      describe '.available?' do
        it 'returns false if the service is not configured' 

      end
    end

    context 'service available' do
      before do
        allow(Canvas::DynamicSettings).to receive(:find)
          .with('live-events-subscription-service', default_ttl: 5.minutes)
          .and_return({
            'app-host' => 'http://example.com',
          })
        allow(Canvas::DynamicSettings).to receive(:find)
          .with('canvas')
          .and_return({
            'signing-secret' => 'astringthatisactually32byteslong',
            'encryption-secret' => 'astringthatisactually32byteslong'
          })
      end

      let(:developer_key) do
        developer_key = double
        allow(developer_key).to receive(:global_id).and_return(10000000000003)
        developer_key
      end

      let(:non_root_account_context) do
        non_root_account = double()
        allow(non_root_account).to receive(:global_root_account_id).and_return(10000000000007)
        non_root_account
      end

      let(:root_account_context) do
        root_account = double()
        allow(root_account).to receive(:global_root_account_id).and_return(nil)
        allow(root_account).to receive(:global_id).and_return(10000000000004)
        root_account
      end

      let(:root_account_object) do
        root_account_object = double()
        allow(root_account_object).to receive(:uuid).and_return('random-account-uuid')
        root_account_object
      end

      let(:product_family) do
        product_family = double()
        allow(product_family).to receive(:developer_key).and_return(developer_key)
        product_family
      end

      let(:tool_proxy) do
        tool_proxy = double()
        allow(tool_proxy).to receive(:guid).and_return('151b52cd-d670-49fb-bf65-6a327e3aaca0')
        allow(tool_proxy).to receive(:product_family).and_return(product_family)
        tool_proxy
      end

      describe '.available?' do
        it 'returns true if the service is configured' 

      end

      describe '.destroy_all_tool_proxy_subscriptions' do
        it 'makes the expected request' 

      end

      describe '.destroy_tool_proxy_subscription' do
        it 'makes the expected request' 

      end

      describe '.tool_proxy_subscription' do
        it 'makes the expected request' 

      end

      describe '.tool_proxy_subscriptions' do
        it 'makes the expected request' 

      end

      describe '.create_tool_proxy_subscription' do
        it 'makes the expected request' 

      end

      describe '.update_tool_proxy_subscription' do
        it 'makes the expected request' 

      end

      context 'timeout protection' do
        it 'throws an exception for .tool_proxy_subscriptions' 

      end
    end
  end
end

