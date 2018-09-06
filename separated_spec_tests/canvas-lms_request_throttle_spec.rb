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
#

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper.rb')

describe 'RequestThrottle' do
  let(:base_req) { { 'QUERY_STRING' => '', 'PATH_INFO' => '/' } }
  let(:request_user_1) { base_req.merge({ 'REMOTE_ADDR' => '1.2.3.4', 'rack.session' => { user_id: 1 } }) }
  let(:request_user_2) { base_req.merge({ 'REMOTE_ADDR' => '4.3.2.1', 'rack.session' => { user_id: 2 } }) }
  let(:token1) { AccessToken.create!(user: user_factory) }
  let(:token2) { AccessToken.create!(user: user_factory) }
  let(:request_query_token) { base_req.merge({ 'REMOTE_ADDR' => '1.2.3.4', 'QUERY_STRING' => "access_token=#{token1.full_token}" }) }
  let(:request_header_token) { base_req.merge({ 'REMOTE_ADDR' => '4.3.2.1', 'HTTP_AUTHORIZATION' => "Bearer #{token2.full_token}" }) }
  let(:request_logged_out) { base_req.merge({ 'REMOTE_ADDR' => '1.2.3.4', 'rack.session.options' => { id: 'sess1' } }) }
  let(:request_no_session) { base_req.merge({ 'REMOTE_ADDR' => '1.2.3.4' }) }

  # not a let so that actual and expected aren't the same object that get modified together
  def response; [200, {'Content-Type' => 'text/plain'}, ['Hello']]; end

  let(:inner_app) { lambda { |env| response } }
  let(:throttler) { RequestThrottle.new(inner_app) }
  let(:rate_limit_exceeded) { throttler.rate_limit_exceeded }

  after { RequestThrottle.reload! }

  def strip_variable_headers(response)
    response[1].delete('X-Request-Cost')
    response[1].delete('X-Rate-Limit-Remaining')
    response
  end

  describe "#client_identifier" do
    def req(hash)
      ActionDispatch::Request.new(hash).tap { |req| req.fullpath }
    end

    it "should use access token" 


    it "should use user id" 


    it "should use session id" 


    it "should fall back to nil" 

  end

  describe "#call" do
    def set_blacklist(val)
      Setting.set('request_throttle.blacklist', val)
      RequestThrottle.reload!
    end

    it "should pass on other requests" 


    it "should have headers even when disabled" 


    it "should blacklist based on ip" 


    it "should blacklist based on user id" 


    it "should blacklist based on access token" 

  end

  describe ".list_from_setting" do
    it "should split the string and create a set" 

  end

  describe "cost throttling" do
    describe "#calculate_cost" do
      let(:throttle){ RequestThrottle.new(nil) }

      it "sums cpu and db time when extra cost is nil" 


      it "doesnt care if extra cost key doesnt exist" 


      it "adds arbitrary cost if in the env" 


      it "doesn't bomb when the extra cost is something nonsensical" 


      it "sanity checks range of extra cost" 

    end

    before do
      allow(throttler).to receive(:whitelisted?).and_return(false)
      allow(throttler).to receive(:blacklisted?).and_return(false)
    end

    it "should skip without redis enabled" 


    it "should skip if no client_identifier found" 


    def throttled_request
      allow(RequestThrottle).to receive(:enabled?).and_return(true)
      allow(Canvas).to receive(:redis_enabled?).and_return(true)
      bucket = double('Bucket')
      expect(RequestThrottle::LeakyBucket).to receive(:new).with("user:1").and_return(bucket)
      expect(bucket).to receive(:reserve_capacity).and_yield.and_return(1)
      expect(bucket).to receive(:full?).and_return(true)
      expect(bucket).to receive(:to_json) # in the logger.info line
      bucket
    end

    it "should throttle if bucket is full" 


    it "should not throttle if disabled" 


    it "should not throttle, but update, if bucket is not full" 


    if Canvas.redis_enabled?
      it "should increment the bucket" 

    end
  end

  if Canvas.redis_enabled?
    describe RequestThrottle::LeakyBucket do
      before do
        @outflow = 15.5
        Setting.set('request_throttle.outflow', @outflow.to_s)
        @bucket = RequestThrottle::LeakyBucket.new("test", 150.0, 15.0)
        @current_time = 20.2
        # this magic number is @bucket.count - ((@current_time - @bucket.last_touched) * @outflow)
        @expected = 69.4
      end

      describe "#full?" do
        it "should compare to the hwm setting" 


        it "compares to a customized hwm setting if set" 

      end

      describe "redis interaction" do
        it "should use defaults if no redis data" 


        it "should load data from redis" 


        it "should update redis via the lua script" 


        it "should leak when incrementing" 


        it "doesn't leak the current request" 

      end

      describe "#reserve_capacity" do
        it "should increment at the beginning then decrement at the end" 


        it "should still decrement when an error is thrown" 


        it "clamps a negative increment to 0" 


        it "uses custom values if available" 


        it "does nothing if disabled" 


        after do
          Timecop.safe_mode = true
        end
      end
    end
  end
end

