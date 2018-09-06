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
#

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper.rb')

if Canvas.redis_enabled?
describe "Canvas::Redis" do
  it "doesn't marshall" 


  describe "locking" do
    it "should succeed if the lock isn't taken" 


    it "should fail if the lock is taken" 


    it "should live forever if no expire time is given" 


    it "should set the expire time if given" 

  end

  describe "exceptions" do
    before do
      Canvas::Redis.patch
    end

    after do
      Canvas::Redis.reset_redis_failure
    end

    it "should protect against errnos" 


    it "should protect against max # of client errors" 


    it "should pass through other command errors" 


    describe "redis failure" do
      let(:cache) { ActiveSupport::Cache::RedisStore.new(['redis://localhost:1234']) }

      before do
        allow(cache.data._client).to receive(:ensure_connected).and_raise(Redis::TimeoutError)
      end

      it "should fail if not ignore_redis_failures" 


      it "should not fail cache.read" 


      it "should not call redis again after an error" 


      it "should not fail cache.write" 


      it "should not fail cache.delete" 


      it "should not fail cache.delete for a ring" 


      it "should not fail cache.exist?" 


      it "should not fail cache.delete_matched" 


      it "should fail separate servers separately" 


      it "should not fail raw redis commands" 


      it "distinguishes between failure and not exists for set nx" 


    end
  end

  describe "json logging" do
    let(:key) { 'mykey' }
    let(:key2) { 'mykey2' }
    let(:val) { 'myvalue' }
    before(:once) { Setting.set('redis_log_style', 'json') }
    # cache to avoid capturing a log line for db lookup
    before(:each) { Canvas::Redis.log_style }

    def json_logline(get = :shift)
      # drop the non-json logging at the start of the line
      JSON.parse(Rails.logger.captured_messages.send(get).match(/\{.*/)[0])
    end

    it "should log information on the redis request" 


    it "should not log the lua eval code" 


    it "should log error on redis error response" 


    context "rails caching" do
      let(:cache) do
        ActiveSupport::Cache::RedisStore.new([]).tap do |cache|
          cache.instance_variable_set(:@data, Canvas.redis.__getobj__)
        end
      end

      it "should log the cache fetch block generation time" 


      it "should log zero response size on cache miss" 

    end
  end

  it "should log compactly by default on the redis request" 


  it "should allow disabling redis logging" 


  describe "Canvas::RedisWrapper" do
    it "should wrap redis connections" 


    it "should raise on unsupported commands" 

  end
end
end

