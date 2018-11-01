require 'spec_helper_min'
require 'carto/oauth_provider/scopes'
require_relative '../../../factories/organizations_contexts'

describe Carto::OauthProvider::Scopes do
  include_context 'organization with users helper'

  describe '#invalid_scopes' do
    include Carto::OauthProvider::Scopes
    before :all do
      @user = Carto::User.find(create_user.id)
      @user_table = FactoryGirl.create(:carto_user_table, :with_db_table, user_id: @user.id)
    end

    after :all do
      @user_table.destroy
      @user.destroy
    end

    it 'validates supported scopes' 


    it 'returns non existent datasets scopes' 


    it 'validates non existent datasets scopes' 


    it 'validates existing datasets scopes' 


    it 'validates existing datasets with schema scopes' 


    it 'returns datasets non existent datasets schema scopes' 


    it 'returns datasets with 2 schemas scopes' 


    it 'returns datasets scopes with non existent permissions' 


    it 'returns invalid datasets scopes' 


    describe 'views' do
      before :all do
        @view_name = "#{@user_table.name}_view"
        @materialized_view_name = "#{@user_table.name}_matview"
        @user.in_database do |db|
          query = %{
            CREATE VIEW #{@view_name} AS SELECT * FROM #{@user_table.name};
            CREATE MATERIALIZED VIEW #{@materialized_view_name} AS SELECT * FROM #{@user_table.name};
          }
          db.execute(query)
        end
      end

      after :all do
        @user.in_database do |db|
          query = %{
            DROP VIEW #{@view_name};
            DROP MATERIALIZED VIEW #{@materialized_view_name};
          }
          db.execute(query)
        end
      end

      it 'validates view scope' 


      it 'validates materialized view scope' 

    end

    describe 'shared datasets' do
      before :each do
        @shared_table = create_table(user_id: @carto_org_user_1.id)
        not_shared_table = create_table(user_id: @carto_org_user_1.id)

        perm = @shared_table.table_visualization.permission
        perm.acl = [{ type: 'user', entity: { id: @org_user_2.id }, access: 'r' }]
        perm.save!

        @shared_dataset_scope = "datasets:r:#{@carto_org_user_1.database_schema}.#{@shared_table.name}"
        @non_shared_dataset_scope = "datasets:r:#{@carto_org_user_1.database_schema}.#{not_shared_table.name}"
      end

      it 'validates shared dataset' 


      it 'returns non shared dataset' 


      it 'returns only non shared dataset' 


      it 'should fail write scope in shared dataset with only read perms' 


      describe 'organization shared datasets' do
        before :each do
          @org_shared_table = create_table(user_id: @carto_org_user_1.id)
          non_org_shared_table = create_table(user_id: @carto_org_user_1.id)

          perm = @org_shared_table.table_visualization.permission
          perm.acl = [
            {
              type: Permission::TYPE_ORGANIZATION,
              entity: { id: @carto_organization.id },
              access: Permission::ACCESS_READONLY
            }
          ]
          perm.save!

          @org_shared_dataset_scope = "datasets:r:#{@carto_org_user_1.database_schema}.#{@org_shared_table.name}"
          @non_org_shared_dataset_scope = "datasets:r:#{@carto_org_user_1.database_schema}.#{non_org_shared_table.name}"
        end

        it 'validates org shared dataset' 


        it 'returns non org shared dataset' 


        it 'returns only non org shared dataset' 


        it 'should fail write scope in org shared dataset with only read perms' 

      end
    end
  end

  describe Carto::OauthProvider::Scopes::DataservicesScope do
    describe '#add_to_api_key_grants' do
      let(:scope) { Carto::OauthProvider::Scopes::DataservicesScope.new('geocoding', 'GC') }

      it 'adds SQL api and dataservice' 


      it 'does not add duplicate SQL api' 

    end
  end

  describe Carto::OauthProvider::Scopes::UserScope do
    describe '#add_to_api_key_grants' do
      let(:scope) { Carto::OauthProvider::Scopes::UserScope.new('profile', 'User public profile') }

      it 'adds user scope with profile subset' 

    end
  end

  describe Carto::OauthProvider::Scopes::DatasetsScope do
    describe '#add_to_api_key_grants' do
      let(:full_scope) { Carto::OauthProvider::Scopes::DatasetsScope.new('datasets:rw:untitled_table') }
      let(:read_scope) { Carto::OauthProvider::Scopes::DatasetsScope.new('datasets:r:untitled_table') }
      let(:full_table_grants) do
        [
          {
            apis: [
              'maps',
              'sql'
            ],
            type: 'apis'
          },
          {
            tables: [
              {
                name: 'untitled_table',
                permissions: [
                  'select',
                  'insert',
                  'update',
                  'delete'
                ],
                schema: 'wadus'
              }
            ],
            type: 'database'
          }
        ]
      end
      let(:read_table_grants) do
        [
          {
            apis: [
              'maps',
              'sql'
            ],
            type: 'apis'
          },
          {
            tables: [
              {
                name: 'untitled_table',
                permissions: [
                  'select'
                ],
                schema: 'wadus'
              }
            ],
            type: 'database'
          }
        ]
      end

      before(:all) do
        @user = mock
        @user.stubs(:database_schema).returns('wadus')
      end

      it 'adds full access permissions' 


      it 'does not add write permissions' 

    end
  end
end

