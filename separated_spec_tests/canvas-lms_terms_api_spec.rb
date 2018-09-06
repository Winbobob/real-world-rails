#
# Copyright (C) 2014 Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')

describe TermsApiController, type: :request do
  describe "index" do
    before :once do
      @account = Account.create(name: 'new')
      account_admin_user(account: @account)
      @account.enrollment_terms.scope.delete_all
      @term1 = @account.enrollment_terms.create(name: "Term 1")
      @term2 = @account.enrollment_terms.create(name: "Term 2")
    end

    def get_terms(body_params={})
      json = api_call(:get, "/api/v1/accounts/#{@account.id}/terms",
               { controller: 'terms_api', action: 'index', format: 'json', account_id: @account.to_param },
               body_params)
      json['enrollment_terms']
    end

    it "should show sis_batch_id" 


    describe "filtering by state" do
      before :once do
        @term2.destroy
      end

      it "should list all active terms by default" 


      it "should list active terms with state=active" 


      it "should list deleted terms with state=deleted" 


      it "should list all terms, active and deleted, with state=all" 


      it "should not blow up for invalid state parameters" 


      it "should list all terms, active and deleted, with state=[all]" 

    end

    describe "ordering" do
      it "should order by start_at first" 


      it "should order by end_at second" 


      it "should order by id last" 

    end

    it "should paginate" 


    it "includes overrides if requested" 


    describe "authorization" do
      def expect_terms_index_401
        api_call(:get, "/api/v1/accounts/#{@account.id}/terms",
          { controller: 'terms_api', action: 'index', format: 'json', account_id: @account.to_param },
          {},
          {},
          { expected_status: 401 })
      end

      it "should require auth for the right account" 


      it "should allow sub-account admins to view" 


      it "should require context to be root_account and error nicely" 


      it "should allow account admins without manage_account_settings to view" 

    end
  end
end

describe TermsController, type: :request do
  before :once do
    @account = Account.create(name: 'new')
    account_admin_user(account: @account)
    @account.enrollment_terms.scope.delete_all
    @term1 = @account.enrollment_terms.create(name: "Term 1")
  end

  describe "create" do
    it "should allow creating a term" 


    describe "sis_term_id" do
      it "allows specifying sis_term_id with :manage_sis permission" 


      it "rejects invalid sis ids" 


      it "rejects sis_term_id without :manage_sis permission" 

    end

    describe "authorization" do
      def expect_terms_create_401
        api_call(:post, "/api/v1/accounts/#{@account.id}/terms",
          { controller: 'terms', action: 'create', format: 'json', account_id: @account.to_param },
          { enrollment_term: { name: 'Term 2' } },
          {},
          { expected_status: 401 })
      end

      it "should require auth for the right account" 


      it "should require root domain auth" 

    end
  end

  describe "update" do
    it "should allow updating a term" 


    it "requires valid dates" 


    describe "sis_term_id" do
      it "allows specifying sis_term_id with :manage_sis permission" 


      it "allows removing sis_term_id with :manage_sis permission" 


      it "rejects sis_term_id without :manage_sis permission" 

    end

    describe "overrides" do
      it "sets override dates for enrollments" 


      it "requires valid dates for overrides" 


      it "rejects override for invalid enrollment type", priority: "1", test_id: 3046399 do
        result = @term1.enrollment_dates_overrides.where(enrollment_type: 'ObserverEnrollment').to_a
        api_call(:put, "/api/v1/accounts/#{@account.id}/terms/#{@term1.id}",
          { controller: 'terms', action: 'update', format: 'json',
              account_id: @account.to_param, id: @term1.to_param },
          { enrollment_term: {overrides: { 'ObserverEnrollment': {
              'start_at': '2017-01-17T20:00:00Z', 'end_at': '2017-01-17T20:00:00Z'
              } } } },
          {},
          { expected_status: 400 })
        expect(result).to eq(@term1.enrollment_dates_overrides.where(enrollment_type: 'ObserverEnrollment').to_a)
      end
    end

    describe "authorization" do
      def expect_terms_update_401
        api_call(:put, "/api/v1/accounts/#{@account.id}/terms/#{@term1.id}",
          { controller: 'terms', action: 'update', format: 'json', account_id: @account.to_param, id: @term1.to_param},
          { enrollment_term: { name: 'Term 2' } },
          {},
          { :expected_status => 401 })
      end

      it "should require auth for the right account" 


      it "should require root domain auth" 

    end
  end

  describe "destroy" do
    it "should allow deleting a term" 


    describe "authorization" do
      def expect_terms_destroy_401
        api_call(:delete, "/api/v1/accounts/#{@account.id}/terms/#{@term1.id}",
          { controller: 'terms', action: 'destroy', format: 'json', account_id: @account.to_param, id: @term1.to_param },
          {},
          {},
          { :expected_status => 401 })
      end

      it "should require auth for the right account" 


      it "should require root domain auth" 

    end
  end
end

