# encoding: utf-8

require 'rspec/mocks'
require_relative '../../../spec_helper'
require_relative '../../../../app/controllers/carto/api/database_groups_controller'
require_relative '.././../../factories/visualization_creation_helpers'

# cURL samples:
# - Rename group: curl -v -H "Content-Type: application/json" -X PUT -d '{ "display_name": "Demo Group" }' "http://central-org-b-admin.localhost.lan:3000/api/v1/organization/95c2c425-5c8c-4b20-8999-d79cd20c2f2c/groups/c662f7ee-aefb-4f49-93ea-1f671a77bb36?api_key=665646f527c3006b124c15a308bb98f4ed1f52e4"
# - Add users: curl -v -H "Content-Type: application/json" -X POST -d '{ "users" : ["78ee570a-812d-4cce-928c-e5ebeb4708e8", "7e53c96c-1598-43e0-b23e-290daf633547"] }' "http://central-org-b-admin.localhost.lan:3000/api/v1/organization/95c2c425-5c8c-4b20-8999-d79cd20c2f2c/groups/c662f7ee-aefb-4f49-93ea-1f671a77bb36/users?api_key=665646f527c3006b124c15a308bb98f4ed1f52e4"
# - Remove users: curl -v -H "Content-Type: application/json" -X DELETE -d '{ "users" : ["78ee570a-812d-4cce-928c-e5ebeb4708e8", "7e53c96c-1598-43e0-b23e-290daf633547"] }' "http://central-org-b-admin.localhost.lan:3000/api/v1/organization/95c2c425-5c8c-4b20-8999-d79cd20c2f2c/groups/c662f7ee-aefb-4f49-93ea-1f671a77bb36/users?api_key=665646f527c3006b124c15a308bb98f4ed1f52e4"

describe Carto::Api::GroupsController do
  include_context 'organization with users helper'

  shared_examples_for 'Groups editor management' do
    before(:all) do
      @org_user_1_json = {
        "id" => @org_user_1.id,
        "name" => @org_user_1.name,
        "last_name" => @org_user_1.last_name,
        "username" => @org_user_1.username,
        "avatar_url" => @org_user_1.avatar_url,
        "base_url" => @org_user_1.public_url,
        "disqus_shortname" => @org_user_1.disqus_shortname,
        "viewer" => @org_user_1.viewer,
        "org_admin" => false,
        "org_user" => true,
        "remove_logo" => @org_user_1.remove_logo?,
        "google_maps_query_string" => @org_user_1.google_maps_query_string
      }

      @group_1 = FactoryGirl.create(:random_group, display_name: 'g_1', organization: @carto_organization)
      @group_1_json = { 'id' => @group_1.id, 'organization_id' => @group_1.organization_id, 'name' => @group_1.name, 'display_name' => @group_1.display_name }
      @group_2 = FactoryGirl.create(:random_group, display_name: 'g_2', organization: @carto_organization)
      @group_2_json = { 'id' => @group_2.id, 'organization_id' => @group_2.organization_id, 'name' => @group_2.name, 'display_name' => @group_2.display_name }
      @group_3 = FactoryGirl.create(:random_group, display_name: 'g_3', organization: @carto_organization)
      @group_3_json = { 'id' => @group_3.id, 'organization_id' => @group_3.organization_id, 'name' => @group_3.name, 'display_name' => @group_3.display_name }
      @headers = {'CONTENT_TYPE'  => 'application/json', :format => "json" }
    end

    after(:all) do
      @group_1.destroy
      @group_2.destroy
      @group_3.destroy
    end

    before(:each) do
      @carto_organization.reload
    end

    describe '#index' do

      it 'returns 401 without authentication' 


      it 'returns groups with pagination metadata' 


      it 'returns paginated groups with pagination metadata' 


      it 'can search by name' 


      it 'validates order param' 


      describe "users groups" do

        before(:each) do
          @group_1.add_user(@org_user_1.username)
        end

        after(:each) do
          @group_1.remove_user(@org_user_1.username)
        end

        it 'returns user groups if user_id is requested' 


        it 'optionally fetches number of shared tables, maps and users' 


        it 'can fetch number of shared tables, maps and users when a table is shared' 


      end

    end

    it '#show returns a group' 


    it '#show support fetch_shared_maps_count, fetch_shared_tables_count and fetch_users' 


    it '#create fails if user is not owner' 


    it '#create triggers group creation' 


    it '#update triggers group renaming' 


    it '#update returns 409 and a meaningful error message if there is a group with the same name within the organization' 


    it '#add_users triggers group inclusion' 


    it '#remove_users triggers group exclusion' 


    it '#add_users allows batches and triggers group inclusion' 


    it '#remove_users allows batches and triggers group exclusion' 


    it '#drops triggers deletion of existing groups' 


  end

  describe 'with organization owner' do
    it_behaves_like 'Groups editor management' do
      before(:all) do
        @admin_user = @organization.owner
      end
    end
  end

  describe 'with organization admin' do
    it_behaves_like 'Groups editor management' do
      before(:all) do
        @org_user_2.org_admin = true
        @org_user_2.save
        @admin_user = @org_user_2
      end
    end
  end
end

