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

require_relative '../../spec_helper'
require_relative '../views_helper'

describe "/shared/_flash_notices" do
  def local_options(overrides={})
    {
      with_login_text: true,
      auth_type: 'facebook',
      sr_message: nil
    }.merge(overrides)
  end

  it "puts login text with the button if flagged" 


  it "just uses the icon if flagged to not use login text" 


  it "renders a screenreader message if provided" 


  it "omits screenreader span if no message provided" 


  it "uses the button icon based on auth type" 


end

