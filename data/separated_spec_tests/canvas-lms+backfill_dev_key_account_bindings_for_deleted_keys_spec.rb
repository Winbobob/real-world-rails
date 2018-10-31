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
#
require 'spec_helper'

describe DataFixup::BackfillDevKeyAccountBindingsForDeletedKeys do
  describe "#run" do
    let(:active_key)    { DeveloperKey.create! }
    let(:inactive_key)  { DeveloperKey.create!.tap(&:deactivate) }
    let(:deleted_key)   { DeveloperKey.create!.tap(&:destroy) }

    it "backfills when no binding is present for deleted key" 


    it "backfills when no binding is present for inactive key" 


    it "does not backfill when no binding is present for an active key" 


    it "does not backfill when a binding is present" 

  end
end

