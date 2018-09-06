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
require_dependency "api/html/content"

module Api
  module Html
    describe Content do
      describe "#might_need_modification?" do
        it 'is true for a link with a verifier param' 


        it 'is true with an inline media comment' 


        it 'is true for a link to files' 


        it 'is true for a link that includes the host' 


        it 'is false for a link to files in a context' 


        it 'is false for garden-variety content' 

      end

      describe "#modified_html" do
        it "scrubs links" 


        it "changes media tags into anchors" 

      end

      describe "#rewritten_html" do

        it "stuffs mathml into a data attribute on equation images" 


        it "inserts css/js if it is supposed to" 


        it "re-writes root-relative urls to be absolute" 

      end

      describe "#add_css_and_js_overrides" do

        it "does nothing if :include_mobile is false" 


        it "does nothing if there is no account" 


        it "includes brand_config css & js overrides correctly & in proper order" 


        it "includes brand_config css & js from site admin even if no account in chain have a brand_config" 



      end
    end
  end
end

