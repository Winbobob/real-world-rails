#
# Copyright (C) 2011 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../sharding_spec_helper')

describe ConferencesController, type: :request do
  before do
    allow(WebConference).to receive(:plugins).and_return([web_conference_plugin_mock("wimba", {:domain => "wimba.test"})])
  end

  it "should notify participants" 


  it "should find the correct conferences for group news feed" 


  it "shouldn't show concluded users" 


  context 'sharding' do
    specs_require_sharding

    it "should work with cross-shard invitees" 

  end
end

