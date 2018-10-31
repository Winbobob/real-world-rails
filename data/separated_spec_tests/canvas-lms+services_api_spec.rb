#
# Copyright (C) 2011 Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')

describe "Services API", type: :request do
  before :once do
    user_with_pseudonym(:active_all => true)
  end

  before :each do
    @kal = double('CanvasKaltura::ClientV3')
    allow(CanvasKaltura::ClientV3).to receive(:config).and_return({
      'domain' => 'kaltura.fake.local',
      'resource_domain' => 'cdn.kaltura.fake.local',
      'rtmp_domain' => 'rtmp-kaltura.fake.local',
      'partner_id' => '420',
    })
  end
  
  it "should check for auth" 

  
  it "should return the config information for kaltura" 

  
  it "should degrade gracefully if kaltura is disabled or not configured" 


  it "should return a new kaltura session" 

end

