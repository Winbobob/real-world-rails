#
# Copyright (C) 2012 Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../api_spec_helper')

describe "Outcomes Import API", type: :request do

  let(:guid) { "A833C528-901A-11DF-A622-0C319DFF4B22" }

  def filename_to_hash(file)
    JSON.parse(File.read(
      "#{File.dirname(File.expand_path(__FILE__))}/fixtures/#{file}"
    ))
  end

  def stub_ab_config_with(return_value)
    allow(AcademicBenchmark).to receive(:config).and_return(return_value)
  end

  def available_json(expected_status: 200)
    api_call(:get, "/api/v1/global/outcomes_import/available",
      {
        controller: 'outcomes_import_api',
        action: 'available',
        account_id: @account.id.to_s,
        format: 'json',
      },
      { },
      { },
      {
        expected_status: expected_status
      }
    )
  end

  def create_json(guid:, expected_status: 200)
    api_call(:post, "/api/v1/global/outcomes_import",
      {
        controller: 'outcomes_import_api',
        action: 'create',
        account_id: @account.id.to_s,
        format: 'json',
      },
      {
        guid: guid
      },
      { },
      {
        expected_status: expected_status
      }
    )
  end

  def create_full_json(json:, expected_status: 200)
    api_call(:post, "/api/v1/global/outcomes_import",
      {
        controller: 'outcomes_import_api',
        action: 'create',
        account_id: @account.id.to_s,
        format: 'json',
      },
      json,
      { },
      {
        expected_status: expected_status
      }
            )
  end

  def status_json(migration_id:, expected_status: 200)
    api_call(:get, "/api/v1/global/outcomes_import/migration_status/#{migration_id}",
      {
        controller: 'outcomes_import_api',
        action: 'migration_status',
        account_id: @account.id.to_s,
        format: 'json',
        migration_id: migration_id
      },
      { },
      { },
      {
        expected_status: expected_status
      }
    )
  end

  def revoke_permission(account_user, permission)
    RoleOverride.manage_role_override(
      account_user.account,
      account_user.role,
      permission.to_s,
      :override => false
    )
  end

  def create_request(json)
    {guid: "9426DCAE-734C-40D5-ABF6-FB748CD8BE65"}.merge(json)
  end

  before :once do
    user_with_pseudonym(:active_all => true)
    @account = Account.default
    @account_user = @user.account_users.create(:account => Account.site_admin)
  end

  shared_examples "academic benchmark config" do
    describe "config" do
      let(:request) do
        ->(type:, guid: nil, expected_status: 200) do
          case type
          when "available" then return available_json(expected_status: expected_status)
          when "create" then return create_json(guid: guid, expected_status: expected_status)
          else fail "unknown request type"
          end
        end
      end

      it "requires the AcademicBenchmark config to be set" 


      context "requires the AcademicBenchmark config api_key or partner_key to be set" do
        # Since :partner_key is missing below, we default to using AB API v1.
        # Once AB API v3 becomes default, switch the regex below to /needs partner_key/
        it "rejects a missing/nil key" 

        # Since :partner_key is empty below, we default to using AB API v1.
        # Once AB API v3 becomes default, switch the regex below to /needs partner_key/
        it "rejects a partner key that is the empty string" 

        it "rejects an api key that is the empty string" 

      end

      it "requires the AcademicBenchmark partner id to be set" 

    end
  end

  describe "create" do
    include_examples "academic benchmark config" do
      let(:request_type) { "create" }
    end
  end

  describe "available" do
    include_examples "academic benchmark config" do
      let(:request_type) { "available" }
    end
  end

  shared_examples "outcomes import" do
    context "Account" do
      before :each do
        stub_ab_import
        stub_ab_config
        stub_ab_api
      end

      context "available" do
        it "works" 


        it "includes the United Kingdom" 


        it "includes the common core standards" 


        it "includes the NGSS standards" 


        %w[Administrators Teachers Students].each do |group|
          it "includes the ISTE standards for #{group}" 

        end

        it "requires the user to have manage_global_outcomes permissions" 

      end

      context "create" do
        it "works" 


        it "requires the user to have manage_global_outcomes permissions" 


        it "returns error if no guid is passed" 


        it "rejects malformed guids" 


        it "accepts case-insensitive GUIDs" 


        it "accepts valid mastery_points" 


        it "rejects malformed mastery_points" 


        it "accepts valid points_possible" 


        it "rejects malformed points_possible" 


        it "accepts valid ratings" 


        it "rejects malformed ratings" 


        it "accepts valid calculation methods" 


        it "rejects malformed calculation methods" 

      end

      context "status" do
        it "requires valid migration id" 

        it "check valid migration id" 

      end
    end
  end

  describe "v1" do
    def stub_ab_import
      cm_mock = double("content_migration")
      allow(cm_mock).to receive(:id).and_return(3)
      allow(AcademicBenchmark).to receive(:import).and_return(cm_mock)
    end
    include_examples "outcomes import" do
      let(:description_key){ "title" }
      let(:json_file) { "available_return_val_v1.json" }
      def stub_ab_api
        api_mock = double("api")
        allow(api_mock).to receive(:list_available_authorities).
          and_return(filename_to_hash("api_list_authorities.json"))
        allow(api_mock).to receive(:browse_guid).
          and_return(filename_to_hash("api_browse_guid.json"))
        allow(api_mock).to receive(:browse).
          and_return(filename_to_hash("api_browse.json"))
        allow(AcademicBenchmark::Api).to receive(:new).and_return(api_mock)
      end

      def stub_ab_config
        stub_ab_config_with({
          "api_key" => "<secret-key>",
          "api_url" => "http://api.statestandards.com/services/rest/"
        })
      end
    end
  end

  describe "v3" do
    def stub_ab_import
      cm_mock = double("content_migration")
      allow(cm_mock).to receive(:id).and_return(3)
      allow(AcademicBenchmark).to receive(:import).and_return(cm_mock)
    end
    include_examples "outcomes import" do
      let(:description_key){ "description" }
      let(:json_file) { "available_return_val.json" }
      def stub_ab_api
        standards_mock = double("standards")
        allow(standards_mock).to receive(:authorities).
          and_return(filename_to_hash("available_authorities.json").
                  map{ |a| AcademicBenchmarks::Standards::Authority.from_hash(a) })
        allow(standards_mock).to receive(:authority_documents).
          with(not_eq('CC').and not_eq('NRC')).
          and_return(filename_to_hash("national_standards_authority_docs.json").
                  map{ |d| AcademicBenchmarks::Standards::Document.from_hash(d) })
        allow(standards_mock).to receive(:authority_documents).
          with('NRC').
          and_return(filename_to_hash("ngss_nrc_authority_docs.json").
                  map{ |d| AcademicBenchmarks::Standards::Document.from_hash(d) })
        allow(standards_mock).to receive(:authority_documents).
          with('CC').
          and_return(filename_to_hash("common_core_authority_docs.json").
                 map{ |d| AcademicBenchmarks::Standards::Document.from_hash(d) })
        allow(AcademicBenchmarks::Api::Standards).to receive(:new).and_return(standards_mock)
      end

      def stub_ab_config
        stub_ab_config_with({
          partner_key: "<secret-key>",
          partner_id: "instructure"
        })
      end
    end
  end

end

