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
require_dependency "canvas/plugins/ticketing_system/custom_error"

module Canvas::Plugins::TicketingSystem
  describe CustomError do
    let(:report){ ErrorReport.new }
    let(:delegate) { CustomError.new(report) }

    describe "#to_document" do
      it "translates an error_report to a json-able hash" 

    end

    describe "#sub_account_tag" do
      let(:asset_manager) { double() }

      it "prefixes the account_id with subaccount" 


      # since Course is the expected type, we just need to NOT send
      # a type override
      it "returns nil if the context isnt the expected type" 


      it "returns nil with no asset string" 

    end

    describe "#report_type" do
      it "extracts the type from the backtrace" 


      it "defaults to ERROR if there is no backtrace" 


      it "defaults to ERROR if the backtrace isnt regular" 

    end

    describe "#user_severity" do
      it "passes through the data value" 


      it "defaults to a blank string" 

    end

    describe "#user_roles" do
      it "passes through the data value" 


      it "defaults to a blank string" 

    end

    describe "#account_domain_value" do
      it "uses the domain off the account attribute" 


      it "is nil if no account" 

    end

    describe "#user_name" do
      it "uses the name off the user attribute" 


      it "is nil if no account" 

    end

    describe "#become_user_id_uri" do
      it "is nil if there's no url or user" 


      it "transforms the url into one that targets the user for reproduction" 


      it "gives a resonable message when it cant parse the url" 

    end

    describe "#pretty_http_env" do
      it "is nil if theres no http_env" 


      it "maps an env hash to a json string" 

    end

  end


end

