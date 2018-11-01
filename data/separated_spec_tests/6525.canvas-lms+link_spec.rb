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
require_dependency "api/html/link"

module Api
  module Html
    describe Link do
      describe '#to_corrected_s' do

        it 'returns the raw string if it isnt a link' 


        context "for user context attachment links" do
          before do
            allow(Attachment).to receive(:where).with(id: "1").and_return(double(first: double(context_type: "User")))
          end

          it 'returns the raw string for a user content link' 


          it 'returns the raw string for a user content link even with a host' 

        end

        it 'strips out verifiers for Course links and scopes them to the course' 


        it 'scopes to the context if url includes the host' 


        it 'strips the current host from absolute urls' 


        it 'does not scope to the context if url includes a differnt host' 


        it 'does not strip the current host if the ports do not match' 

      end
    end
  end
end

