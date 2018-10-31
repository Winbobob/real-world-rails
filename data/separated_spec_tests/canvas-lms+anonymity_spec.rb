#
# Copyright (C) 2018 - present Instructure, Inc.
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

require_relative '../spec_helper'

describe Anonymity do
  describe '.generate_id' do
    let(:short_id) { 'aB123' }

    context 'given no existing_anonymous_ids' do
      subject(:generate_id) do
        -> { Anonymity.generate_id }
      end

      it 'creates an anonymous_id' 


      it 'creates a unique anonymous_id when collisions happen' 

    end

    context 'given a list of existing_anonymous_ids' do
      subject do
        Anonymity.generate_id(existing_ids: existing_anonymous_ids_fake)
      end

      let(:existing_anonymous_ids_fake) { double('Array') }

      it 'queries the passed in existing_anonymous_ids' 

    end
  end

  describe '.generate_short_id' do
    it 'generates a short id' 

  end
end

