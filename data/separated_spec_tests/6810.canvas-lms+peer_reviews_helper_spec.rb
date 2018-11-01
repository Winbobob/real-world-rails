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
#

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Messages::PeerReviewsHelper do

  describe 'assessment requests' do
    before :once do
      assessment_request_model
    end

    it 'should should return reviewee name' 


    it 'should return anonymous when anonymous peer reviews enabled' 


  end

  describe 'submission comments' do

    context 'anonymous peer reviews disabled' do

      it 'should return author name' 


      it 'should return anonymous' 


    end

    context 'anonymous peer reviews enabled' do

      it 'should return submittor' 


      it 'should return anonymous' 


    end
  end

end

