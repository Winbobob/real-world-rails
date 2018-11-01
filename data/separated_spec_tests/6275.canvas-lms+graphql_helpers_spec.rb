#
# Copyright (C) 2017 Instructure, Inc.
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

describe GraphQLHelpers do
  context "relay_or_legacy_id_prepare_func" do
    let(:relay_user_id) { "VXNlci0xMjM0" }

    it "passes legacy ids straight through" 


    it "converts relay ids to legacy ids" 


    it "returns an error for garbage" 


    it "returns an error if the relay id doesn't match the expected type" 

  end

  context "relay_or_legacy_ids_prepare_func" do
    let(:user1234) { "VXNlci0xMjM0" }
    let(:user5678) { "VXNlci01Njc4" }
    let(:ctx) { nil }

    it "works for valid ids" 


    it "returns an error for bad ids" 

  end
end

