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

require 'spec_helper'

RSpec.describe Lti::Ims::LineItemsSerializer do
  let(:resource_link) { resource_link_model(overrides: {resource_link_id: assignment.lti_context_id}) }
  let(:assignment) { assignment_model }
  let(:line_item_id) do
    Rails.application.routes.url_helpers.lti_line_item_edit_path(
      course_id: 1,
      id: 1
    )
  end
  let(:line_item) do
    line_item_model(
      assignment: assignment,
      resource_link: resource_link,
      label: 'label',
      tag: 'tag',
      score_maximum: 60,
      resource_id: 'resource_id'
    )
  end

  describe '#as_json' do
    it 'properly formats the line item hash' 


    it 'does not incude values that are nil' 

  end
end

