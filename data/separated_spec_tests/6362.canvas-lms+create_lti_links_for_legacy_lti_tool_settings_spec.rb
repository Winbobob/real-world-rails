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

require "spec_helper"
require File.expand_path(File.dirname(__FILE__) + '../../../lti2_course_spec_helper')

describe DataFixup::CreateLtiLinksForLegacyLtiToolSettings do
  include_context 'lti2_course_spec_helper'

  let(:link_tool_setting) do
    Lti::ToolSetting.create!(
      tool_proxy: tool_proxy,
      context: course,
      resource_link_id: SecureRandom.uuid,
      vendor_code: product_family.vendor_code,
      product_code: product_family.product_code,
      resource_type_code: resource_handler.resource_type_code,
      resource_url: 'http://example.com/resource',
      custom_parameters: { foo: 'bar' }
    )
  end

  let(:proxy_tool_setting) do
    Lti::ToolSetting.create!(
      tool_proxy: tool_proxy,
      custom: { param: 42 }
    )
  end

  before(:each) do
    link_tool_setting
    proxy_tool_setting
  end

  it 'creates lti links from link tool settings' 

end
