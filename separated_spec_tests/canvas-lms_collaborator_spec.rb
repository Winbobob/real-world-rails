#
# Copyright (C) 2016 - present Instructure, Inc.
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
require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper.rb')

describe Api::V1::Collaborator do
  include Api::V1::Collaborator

  describe '.collaborator_json' do
    let(:user) { user_model }
    let(:group) { group_model }
    let(:collaboration) { collaboration_model }

    context 'group collaborator' do
      let(:collaborator) { Collaborator.create(collaboration: collaboration, group: group) }

      it 'serializes' 


      it 'includes collaborator_lti_id' 


      it 'includes avatar_image_url' 

    end

    context 'user collaborator' do
      let(:collaborator) { Collaborator.create(collaboration: collaboration, user: user) }

      it 'serializes' 


      it 'includes collaborator_lti_id' 


      it 'includes avatar_image_url' 

    end
  end
end

