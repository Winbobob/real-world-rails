#
# Copyright (C) 2014 - present Instructure, Inc.
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

require_relative '../../../spec_helper'

class CategoryHarness
  include Api::V1::GroupCategory

  def polymorphic_url(data)
    "http://www.example.com/api/#{data.join('/')}"
  end
end

describe "Api::V1::GroupCategory" do
  describe "#group_category_json" do
    let(:category){ GroupCategory.new(name: "mygroup", root_account: Account.new) }

    it "includes the auto_leader value" 


    describe 'groups_count' do
      it 'is absent without the includes' 


      it 'is present with the includes' 

    end

    describe 'progress_url' do
      it 'is absent without the includes' 


      it 'is present with the includes' 

    end

    describe 'group_category_data' do
      it 'sets protected with the category value' 


      it 'passes through "allows_multiple_memberships"' 


      it 'checks the user against the category to set "is_member"' 

    end

  end
end

