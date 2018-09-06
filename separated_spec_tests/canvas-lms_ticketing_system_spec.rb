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
require_dependency "canvas/plugins/ticketing_system"

module Canvas::Plugins
  describe TicketingSystem do

    describe ".is_selected?" do
      let(:fake_settings){ double(settings_for_plugin: {type: 'some_service'}) }
      it "is true if the provided plugin id is the byots selection" 


      it "is false for plugin ids that don't match the selection" 

    end

    describe ".register_plugin" do
      it "registers the given plugin with Canvas::Plugin using the TS tag" 


      it "fires the provided call back on every error report" 

    end

    describe ".get_settings" do
      it "returns the settings from Canvas::Plugin for that plugin id" 


      it 'returns an empty hash if nothing is registered' 

    end
  end
end

