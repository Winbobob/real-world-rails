#
# Copyright (C) 2017 - present Instructure, Inc.
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

require_relative "../spec_helper.rb"

describe ActiveSupport::Cache::HaStore do
  before do
    skip unless Canvas.redis_enabled?
  end

  let(:store) { ActiveSupport::Cache::HaStore.new(Canvas.redis.id, expires_in: 5.minutes, race_condition_ttl: 7.days, consul_event: 'invalidate') }

  describe "#fetch" do
    it "locks for a new key" 


    it "doesn't lock for an existing key" 


    it "doesn't populate for a stale key that someone else is populating" 


    it "waits to get a lock for a non-existent key" 


    it "waits and then reads fresh data for a non-existent key" 


    it "returns stale data if there is an exception calculating new data" 


    it "calculates anyway if we couldn't contact the cache" 

  end

  describe "#delete" do
    it "triggers a consul event when configured" 

  end
end

