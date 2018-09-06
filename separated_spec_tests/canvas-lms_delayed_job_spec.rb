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

require File.expand_path('../sharding_spec_helper', File.dirname( __FILE__ ))

describe 'Delayed::Job' do
  it "should define job.account" 


  shared_examples_for "delayed_jobs_shards" do
    it "should keep track of the current shard on child jobs" 

  end

  describe "current_shard" do
    include_examples "delayed_jobs_shards"

    context "sharding" do
      specs_require_sharding
      include_examples "delayed_jobs_shards"
    end
  end
end

