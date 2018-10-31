# encoding: utf-8

require_relative '../../../spec_helper'
require_relative '.././../../factories/organizations_contexts'
require_relative '.././../../factories/visualization_creation_helpers'
require_relative '../../../../app/controllers/carto/api/database_groups_controller'

# cURL samples:
# - Create group: curl -v --user extension:elephant -H "Content-Type: application/json" -X POST -d '{ "name": "Group 2", "database_role": "DELETEME_FAKE_ROLE" }' http://localhost.lan:3000/api/v1/databases/cartodb_dev_user_3a03e626-c26c-4469-afea-a800fd813e1c_db/groups
# - Delete group: curl -v --user extension:elephant -H "Content-Type: application/json" -X DELETE http://localhost.lan:3000/api/v1/databases/cartodb_dev_user_3a03e626-c26c-4469-afea-a800fd813e1c_db/groups/Group%202
#
# Examples for staging: curl -v --user USER:PASS -H "Content-Type: application/json" -H "X-Forwarded-Proto: https" -X POST -d '{ "name": "MyGroup", "database_role": "DELETEME_FAKE_ROLE" }' http://haproxy.service.consul:8888/api/v1/databases/cartodb_staging_user_21a66689-0d8a-4512-b8e9-1fb8a93f2785_db/groups
# Delete: curl -v --user USER:PASS -H "Content-Type: application/json" -H "X-Forwarded-Proto: https" -X DELETE http://haproxy.service.consul:8888/api/v1/databases/cartodb_staging_user_21a66689-0d8a-4512-b8e9-1fb8a93f2785_db/groups/MyGroup

describe Carto::Api::DatabaseGroupsController do
  include_context 'organization with users helper'

  describe 'Groups management', :order => :defined do

    it "Throws 401 error without http auth" 


    it '#creates a new group from name and role, and initializes display_name as name' 


    it '#creates return 409 if a group with that data has already been created' 


    it '#rename a new group from name and role' 


    it '#rename triggers 409 if it looks like renaming already occurred: existing new name, nonexisting old name' 


    it '#rename triggers 500 if renaming can\'t be done and there is no previous match' 


    it '#add_users from username' 


    it '#add_users returns 409 if username is already added' 


    it '#update_permission returns 404 for visualizations' 


    it '#update_permission granting read to a table' 


    it '#update_permission granting write to a table' 


    it '#destroy_permission to a table' 


    it '#update_permission granting read on a table to organization, group and user do not duplicate count' 


    it '#remove_users from username' 


    it '#remove_users from username throws 404 if user is not found' 


    it '#add_users from username accepts batches' 


    it '#remove_users from username accepts batches' 


    it '#destroy an existing group' 


    it '#destroy a nonexisting group returns 404' 


  end
end

