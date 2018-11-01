#
# Copyright (C) 2013 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper.rb')
require_dependency "sis/group_membership_importer"

module SIS

  describe GroupMembershipImporter do

    def create_group(opts = {})
      group = Group.new(opts)
      group.sis_source_id = "54321"
      group.context = Account.default
      group.save!
      group
    end

    def create_user
      user = user_with_pseudonym
      @pseudonym.sis_user_id = "12345"
      @pseudonym.save!
      [user, @pseudonym]
    end

    it 'does not blow up if you hand it integers' 


    describe 'validation' do
      before do
        course_model
      end

      it "handles validation errors due to lack of section homogeneity" 

    end
  end
end

