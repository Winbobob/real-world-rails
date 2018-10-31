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

require 'spec_helper'
require_dependency "canvas/plugins/ticketing_system/email_plugin"

module Canvas::Plugins::TicketingSystem
  describe EmailPlugin do
    describe "#export_error" do
      let(:ticketing){ double() }
      let(:plugin){ EmailPlugin.new(ticketing) }
      let(:email_address){ "to-address@example.com" }
      let(:config){ {email_address: email_address} }
      let(:report){ double(
        email: "from-address@example.com",
        to_document: {},
        raw_report: double(),
        account_id: nil )
      }

      it "sends an email to the address in the configuration" 


      it "uses the email from the error_report as the from address" 


      it "uses the un-wrapped error-report for the mail context" 


      it "carries through the account if the error report has one" 


      it "sends valid json as the body, with http_env" 

    end
  end
end

