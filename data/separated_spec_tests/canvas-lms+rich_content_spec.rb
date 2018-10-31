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

require_relative "../../spec_helper"
require_dependency "services/rich_content"

module Services
  describe RichContent do
    before do
      allow(Services::RichContent).to receive(:contextually_on).and_call_original
      allow(Canvas::DynamicSettings).to receive(:find).with(any_args).and_call_original
      allow(Canvas::DynamicSettings).to receive(:find).
        with('rich-content-service', default_ttl: 5.minutes).
        and_return({
          "app-host" => "rce-app",
          "cdn-host" => "rce-cdn"
        })
      allow(Setting).to receive(:get)
      allow(Setting).to receive(:get).
        with('rich_content_service_enabled', 'false').
        and_return('true')
    end

    describe ".env_for" do
      it "just returns disabled value if no root_account" 


      it "fills out host values when enabled" 


      it "populates hosts with an error signal when consul is down" 


      it "logs errors for later consideration" 


      it "includes a generated JWT for the domain, user, context, and workflwos" 


      it "includes a masquerading user if provided" 


      it "does not allow file uploading without context" 


      it "lets context decide if uploading is ok" 


      it "does not raise when encyption/signing secrets are nil" 


      context "with all flags on" do
        let(:root_account){double("root_account") }

        before(:each) do
          allow(root_account).to receive(:feature_enabled?).with(:rich_content_service_high_risk).and_return(true)
        end

        it "is contextually on for low risk areas" 


        it "is contextually on for medium risk areas" 


        it "is contextually on for high risk areas" 

      end

      context "with flag off" do
        let(:root_account){double("root_account") }

        before(:each) do
          allow(root_account).to receive(:feature_enabled?).and_return(false)
        end

        it "is contextually on when no risk specified" 


        it "is contextually on for high risk areas" 


        it "is contextually on for low risk areas" 


        it "is contextually on for lower risk areas with sidebar" 

      end

      it "treats nil feature values as false" 


      context "integrating with a real account and feature flags" do
        it "sets all levels to true when all flags set" 


        it "on for basic if flag is disabled" 


        it "on for sidebar if flag is disabled" 


        it "on for high risk if flag is disabled" 

      end

      context "without rich_content_service_enabled setting true" do
        before(:each) do
          allow(Setting).to receive(:get).
            with('rich_content_service_enabled', 'false').
            and_return(false)
        end

        it "on for all risk levels if feature flag is enabled" 


        it "off for all risk levels if feature flag is not enabled" 

      end
    end
  end
end

