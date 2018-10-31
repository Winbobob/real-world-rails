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

require File.expand_path(File.dirname(__FILE__) + '/../sharding_spec_helper')

class TestApiInstance
  include Api
  def initialize(root_account, current_user)
    @domain_root_account = root_account
    @current_user = current_user
  end

  def account_url(account)
    URI.encode("http://www.example.com/accounts/#{account}")
  end

  def course_assignment_url(course, assignment)
    URI.encode("http://www.example.com/courses/#{course}/assignments/#{assignment}")
  end
end

describe Api do
  context 'api_find' do
    before do
      @user = user_factory
      @api = TestApiInstance.new Account.default, nil
    end

    it 'should find a simple record' 


    it 'should not find a missing record' 


    it 'should find an existing sis_id record' 


    it 'looks for login ids case insensitively' 


    it 'properly quotes login ids' 


    it 'should not find record from other account' 


    it 'should find record from other root account explicitly' 


    it 'should allow passing account param and find record' 


    it 'should not find a missing sis_id record' 


    it 'should find user id "self" when a current user is provided' 


    it 'should not find user id "self" when a current user is not provided' 


    it 'should find account id "self"' 


    it 'should find account id "default"' 


    it 'should find account id "site_admin"' 


    it 'should find group_category with sis_id' 


    it 'should find term id "default"' 


    it 'should find term id "current"' 


    it 'should not find a "current" term if there is more than one candidate' 


    it 'should find an open ended "current" term' 



    it 'should not find a user with an invalid AR id' 


    it "should not find sis ids in other accounts" 


    it "should find user by lti_context_id" 


    it "should find course by lti_context_id" 


    it "should find account by lti_context_id" 


    it "should find user by uuid" 

  end

  context 'api_find_all' do
    before do
      @user = user_factory
      @api = TestApiInstance.new Account.default, nil
    end

    it 'should find no records' 


    it 'should find a simple record' 


    it 'should find a simple record with uuid' 


    it 'should not find a missing record' 


    it 'should find an existing sis_id record' 


    it 'should find existing records with different lookup strategies' 


    it 'should filter out duplicates' 


    it "should find user id 'self' when a current user is provided" 


    it 'should not find user id "self" when a current user is not provided' 


    it "should not find sis ids in other accounts" 


    it "should not hit the database if no valid conditions were found" 


    context "sharding" do
      specs_require_sharding

      it "should find users from other shards" 


      it 'find users from other shards via SIS ID' 

    end
  end

  context 'map_ids' do
    it 'should map an empty list' 


    it 'should map a list of AR ids' 


    it "should bail on ids it can't figure out" 


    it "should filter out sis ids that don't exist, but not filter out AR ids" 


    it "should find sis ids that exist" 


    it 'should work when only provided sis_ids' 


    it "should not find sis ids in other accounts" 


    it 'should try and make params when non-ar_id columns have returned with ar_id columns' 


    it 'should try and make params when non-ar_id columns have returned without ar_id columns' 


    it 'should not try and make params when no non-ar_id columns have returned with ar_id columns' 


    it 'should not try and make params when no non-ar_id columns have returned without ar_id columns' 


  end

  context 'sis_parse_id' do
    before do
      @lookups = Api::SIS_MAPPINGS['users'][:lookups]
    end

    it 'should handle numeric ids' 


    it 'should handle numeric ids as strings' 


    it 'should handle hex_encoded sis_fields' 


    it 'should not handle invalid hex fields' 


    it 'should not handle hex_encoded non-sis fields' 


    it 'should handle plain sis_fields' 


    it "should not handle plain sis_fields that don't exist" 


    it 'should not handle other things' 


    it 'should handle surrounding whitespace' 


    it 'should handle user uuid' 

  end

  context 'sis_parse_ids' do
    before do
      @lookups = Api::SIS_MAPPINGS['users'][:lookups]
    end

    it 'should handle a list of ar_ids' 


    it 'should handle a list of sis ids' 


    it 'should remove duplicates' 


    it 'should work with mixed sis id types' 


    it 'should skip invalid things' 

  end

  context 'sis_find_sis_mapping_for_collection' do
    it 'should find the appropriate sis mapping' 


    it 'should raise an error otherwise' 

  end

  context 'sis_relation_for_collection' do
    it 'should pass along the sis_mapping to sis_find_params_for_sis_mapping' 

  end

  context 'relation_for_sis_mapping' do
    it 'should pass along the parsed ids to sis_make_params_for_sis_mapping_and_columns' 

  end

  context 'relation_for_sis_mapping_and_columns' do
    it 'should fail when not given a root account' 


    it 'should properly generate an escaped arg string' 


    it 'should work with no columns' 


    it 'should add in joins if the sis_mapping has some with columns' 


    it 'should work with a few different column types and account scopings' 


    it "should scope to accounts by default if :is_not_scoped_to_account doesn't exist" 


    it "should fail if we're scoping to an account and the scope isn't provided" 

  end

  context 'sis_mappings' do
    it 'should correctly capture course lookups' 


    it 'should correctly capture enrollment_term lookups' 


    it 'should correctly capture user lookups' 


    it 'should correctly capture account lookups' 


    it 'should correctly capture course_section lookups' 


    it 'should correctly capture group_categories lookups' 


    it 'should correctly query the course table' 


    it 'should correctly query the enrollment_term table' 


    it 'should correctly query the user table' 


    it 'should correctly query the account table' 


    it 'should correctly query the course_section table' 


  end

  context "map_non_sis_ids" do
    it 'should return an array of numeric ids' 


    it 'should convert string ids to numeric' 


    it "should exclude things that don't look like ids" 


    it "should strip whitespace" 

  end

  context 'ISO8601 regex' do
    it 'should not allow invalid dates' 


    it 'should not allow non ISO8601 dates' 


    it 'should not allow garbage dates' 


    it 'should allow valid dates' 


    it 'should not allow valid dates BC' 

  end

  context ".api_user_content" do
    let(:klass) do
      Class.new do
        include Api
      end
    end

    it "should ignore non-kaltura instructure_inline_media_comment links" 


    context "mobile css/js" do
      before(:each) do
        student_in_course
        account = @course.root_account
        bc = BrandConfig.create(mobile_css_overrides: 'somewhere.css')
        account.brand_config_md5 = bc.md5
        account.save!

        @html = "<p>a</p><p>b</p>"

        @k = klass.new
      end

      it 'prepends mobile css when not coming from a web browser' 


      it 'does not prepend mobile css when coming from a web browser' 


      it 'does not prepend mobile css when coming from a web browser, even if it is a mobile browser' 

    end

    context "sharding" do
      specs_require_sharding

      it 'transposes ids in urls' 

    end
  end

  context ".process_incoming_html_content" do
    class T
      extend Api
      def self.request
        OpenStruct.new({host: 'some-host.com', port: 80})
      end
    end

    it "should add context to files and remove verifier parameters" 


    it 'passes host and port to Content.process_incoming' 

  end

  context ".paginate" do
    let(:request) { double('request', query_parameters: {}) }
    let(:response) { double('response', headers: {}) }
    let(:controller) { double('controller', request: request, response: response, params: {}) }

    describe "ordinal collection" do
      let(:collection) { [1, 2, 3] }

      it "should not raise Folio::InvalidPage for pages past the end" 


      it "should not raise Folio::InvalidPage for integer-equivalent non-Integer pages" 


      it "should raise Folio::InvalidPage for pages <= 0" 


      it "should raise Folio::InvalidPage for non-integer pages" 

    end

    describe "page size limits" do
      let(:collection) { (1..101).to_a }

      context "with no max_per_page argument" do
        it "should limit to the default max_per_page" 

      end

      context "with no per_page parameter" do
        it "should limit to the default per_page" 

      end

      context "with per_page parameter > max_per_page argument" do
        let(:controller) { double('controller', request: request, response: response, params: {per_page: 100}) }
        it "should take the smaller of the max_per_page arugment and the per_page param" 

      end

      context "with per_page parameter < max_per_page argument" do
        let(:controller) { double('controller', request: request, response: response, params: {per_page: 75}) }
        it "should take the smaller of the max_per_page arugment and the per_page param" 

      end
    end
  end

  context ".jsonapi_paginate" do
    let(:request) { double('request', query_parameters: {}) }
    let(:response) { double('response', headers: {}) }
    let(:controller) { double('controller', request: request, response: response, params: {}) }
    let(:collection) { [1, 2, 3] }

    it "should return the links in the headers" 


    it "should return the links in the meta" 

  end

  context ".build_links" do
    it "should not build links if not pagination is provided" 


    it "should not build links for empty pages" 


    it "should build current, next, prev, first, and last links if provided" 


    it "should maintain query parameters" 


    it "should maintain array query parameters" 


    it "should not include certain sensitive params in the link headers" 

  end

  describe "#accepts_jsonapi?" do
    class TestApiController
      include Api
    end

    it "returns true when application/vnd.api+json in the Accept header" 


    it "returns false when application/vnd.api+json not in the Accept header" 

  end

  describe ".value_to_array" do
    it "splits comma delimited strings" 


    it "does nothing to arrays" 


    it "returns an empty array for nil" 

  end

  describe "#templated_url" do
    before do
      @api = TestApiInstance.new Account.default, nil
    end

    it "should return url with a single item" 


    it "should return url with multiple items" 


    it "should return url with no template items" 


    it "should return url with a combination of items" 

  end
end

