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

require_relative '../../../spec_helper.rb'

describe "Api::V1::Pseudonym" do
  class Harness
    include Api::V1::Pseudonym
  end

  describe "#pseudonym_json" do
    let(:pseudonym){ Pseudonym.new(account: Account.default) }
    let(:session) { {} }
    let(:user) { User.new }
    let(:api) { Harness.new }

    it "includes the authentication_provider_type if there is one" 


    it "ignores the authentication_provider_type if it's absent" 

  end
end

