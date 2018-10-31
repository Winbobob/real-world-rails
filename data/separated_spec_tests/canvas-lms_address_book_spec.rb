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

require_relative "../../spec_helper"
require_dependency "services/address_book"

module Services
  describe AddressBook do
    before do
      @app_host = "address-book"
      @secret = "opensesame"
      allow(Canvas::DynamicSettings).to receive(:find).with(any_args).and_call_original
      allow(Canvas::DynamicSettings).to receive(:find).
        with("address-book", default_ttl: 5.minutes).
        and_return({ "app-host" => @app_host, "secret" => Canvas::Security.base64_encode(@secret) })
      @sender = user_model
      @course = course_model
      @course2 = course_model
    end

    def expect_request(url_matcher, options={})
      body = options[:body] || { records: [] }
      header_matcher = options[:headers] || anything
      expect(CanvasHttp).to receive(:get).
        with(url_matcher, header_matcher).
        and_return(double(body: body.to_json, code: 200))
    end

    def stub_response(url_matcher, body, options={})
      status = options[:status] || 200
      header_matcher = options[:headers] || anything
      allow(CanvasHttp).to receive(:get).
        with(url_matcher, header_matcher).
        and_return(double(body: body.to_json, code: status))
    end

    let(:example_response) do
      {
        records: [
          { user_id: '10000000000002', cursor: 8, contexts: [
            { 'context_type' => 'course', 'context_id' => '10000000000001', 'roles' => ['TeacherEnrollment'] }
          ]},
          { user_id: '10000000000005', cursor: 12, contexts: [
            { 'context_type' => 'course', 'context_id' => '10000000000002', 'roles' => ['StudentEnrollment'] },
            { 'context_type' => 'group', 'context_id' => '10000000000001', 'roles' => ['Member'] }
          ]}
        ]
      }
    end

    def not_match(*args)
      ::RSpec::Matchers::AliasedNegatedMatcher.new(match(*args), ->{})
    end

    matcher :with_param do |param, value|
      match do |url|
        if value.is_a?(Array)
          integers = value.first.is_a?(Integer)
          char = integers ? '\d' : '\w'
          return false unless url =~ %r{[?&]#{param}=(#{char}+(%2C#{char}+)*)(?:&|$)}
          actual = $1.split('%2C')
          actual = actual.map(&:to_i) if value.first.is_a?(Integer)
          return actual.sort == value.sort
        else
          url =~ %r{[?&]#{param}=#{value}(?:&|$)}
        end
      end
    end

    matcher :with_param_present do |param|
      match do |url|
        url =~ %r{[?&]#{param}=}
      end
    end

    describe "jwt" do
      it "signs with the base64 decoded secret from the configuration" 


      it "includes current time as ait claim" 

    end

    describe "recipients" do
      it "includes an Authorization header with JWT in request" 


      it "makes request from /recipients in service" 


      it "normalizes sender from a User to its global ID as for_sender param" 


      it "normalizes sender from an ID to a global ID as for_sender param" 


      it "includes the sender's visible accounts" 


      it "includes the sender's restricted courses" 


      it "normalizes context from e.g. a Course to its global asset string as in_context param" 


      it "normalizes context from an asset string to a global asset string as in_context param" 


      it "normalizes context from a scoped asset string to a scoped global asset string as in_context param" 


      it "normalizes user_ids from Users to a comma-separated list of their global IDs as user_ids param" 


      it "normalizes user_ids from IDs to a comma-separated list of global IDs as user_ids param" 


      it "normalizes exclude_ids from Users to a comma-separated list of their global IDs as exclude_ids param" 


      it "normalizes exclude_ids from IDs to a comma-separated list of global IDs as exclude_ids param" 


      it "normalizes weak_checks to 1 if truthy" 


      it "omits weak_checks if falsey" 


      it "normalizes ignore_result to 1 if truthy" 


      it "reshapes results returned from service endpoint" 


      it "uses timeout protection and returns sane value on timeout" 


      it "reads separate timeout setting when ignoring result (for performance tapping)" 


      it "returns empty response when ignoring result, regardless of what service returns" 


      it "reports errors in service request but then returns sane value" 

    end

    describe "count_recipients" do
      before do
        @count = 5
        @response = { 'counts' => { @course.global_asset_string => @count } }
      end

      it "makes request from /recipients/counts in service" 


      it "normalizes sender same as recipients" 


      it "normalizes contexts comma separated" 


      it "extracts counts from response from service endpoint" 

    end

    describe "common_contexts" do
      it "makes a recipient request" 


      it "passes the sender to the recipients call" 


      it "passes the user_ids to the recipients call" 

    end

    describe "roles_in_context" do
      it "makes a recipient request with no sender" 


      it "passes the user_ids to the recipients call" 


      it "passes the context to the recipients call" 


      it "uses the course as the context for a course section" 

    end

    describe "known_in_context" do
      it "makes a recipient request" 


      it "passes the sender to the recipients call" 


      it "passes the user_ids, if any, to the recipients call" 


      it "passes the context to the recipients call" 


      it "returns an ordered list of ids and a hash of contexts per id" 

    end

    describe "count_in_contexts" do
      before do
        @count = 5
        @response = { 'counts' => { @course.global_asset_string => @count } }
      end

      it "makes a recipient/counts request" 


      it "passes the sender to the count_recipients call" 


      it "passes the contexts to the count_recipients call" 


      it "returns the counts from count_recipients call mapped to arguments" 

    end

    describe "search_users" do
      it "makes a recipient request" 


      it "only has search parameter by default" 


      it "passes context to recipients call" 


      it "passes exclude_ids to recipients call" 


      it "passes weak_checks flag along to recipients" 


      it "returns ids, contexts, and cursors" 


      it "passes cursor parameter to the service" 


      it "passes per_page parameter to the service" 

    end
  end
end

