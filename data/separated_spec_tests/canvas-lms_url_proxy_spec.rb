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
#

require_relative '../../../spec_helper.rb'
require_dependency "api/html/url_proxy"

module Api
  module Html
    class StubUrlHelper
      include Rails.application.routes.url_helpers
    end

    describe UrlProxy do
      let(:context) do
        c = Course.new
        c.id = 1
        c
      end
      let(:proxy){ UrlProxy.new(StubUrlHelper.new, context, "example.com", "http") }

      describe "url helpers" do
        it "passes through object thumbnails" 


        it "passes through polymorphic urls" 

      end

      describe "#api_endpoint_info" do
        it "maps good paths through to endpoints with return types" 


        it 'unescapes urls for sessionless launch endpoints' 

      end
    end
  end
end

