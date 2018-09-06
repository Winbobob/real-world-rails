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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EquationImagesController do

  describe '#show' do
    it 'expects escaped latex' 


    it 'handles unescaped latex' 


    it 'encodes `+` signs properly' 


    it 'should redirect image requests to codecogs' 


    context 'when using MathMan' do
      let(:service_url) { 'http://get.mml.com' }
      before do
        allow(MathMan).to receive_messages(
          url_for: service_url,
          use_for_svg?: true
        )
      end

      it 'redirects to service_url' 

    end
  end
end

