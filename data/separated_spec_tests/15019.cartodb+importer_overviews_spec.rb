# encoding: utf-8
require_relative '../spec_helper'
require_relative '../../app/connectors/importer'
require_relative '../doubles/result'
require_relative '../helpers/feature_flag_helper'
require 'csv'

describe CartoDB::Importer2::Overviews do
  before(:all) do
    @user = create_user(quota_in_bytes: 1000.megabyte, table_quota: 400)
    @feature_flag = FactoryGirl.create(:feature_flag, name: 'create_overviews', restricted: true)
  end

  before(:each) do
    bypass_named_maps
  end

  after(:all) do
    @user.destroy
    @feature_flag.destroy
  end

  include FeatureFlagHelper

  def overview_tables(user, table)
    overviews = user.in_database do |db|
      db.fetch %{
        SELECT * FROM CDB_Overviews('#{table}'::regclass)
      }
    end
    overviews.map(:overview_table)
  end

  def has_overviews?(user, table)
    !overview_tables(user, table).empty?
  end

  def remove_overviews(user, table)
    user.in_database do |db|
      db.run %{
        SELECT CDB_DropOverviews('#{table}'::regclass)
      }
    end
  end

  def public_table?(user, table)
    has_privilege = user.in_database do |db|
      db.fetch %{
        SELECT has_table_privilege('publicuser', '#{table}'::regclass, 'SELECT');
      }
    end
    has_privilege.first[:has_table_privilege]
  end

  def set_table_privacy(table, privacy)
    CartoDB::TablePrivacyManager.new(table)
                                .send(:set_from_table_privacy, privacy)
                                .update_cdb_tablemetadata
  end

  it 'should not create overviews if the feature flag is not enabled' 


  it 'should not create overviews for small datasets' 


  it 'should not create overviews for datasets with non-supported geometries' 


  it 'should create overviews for large datasets of the correct geometry kind' 


  it 'should remove overviews when the table is deleted' 


  it 'should rename overviews when the table is renamed' 


  it 'synchronize overviews privacy with that of the base table' 


  it 'should use the overviews-specific statement timeout' 


  def with_connection(options)
    connection = ::Sequel.connect(options)
    begin
      yield connection
    ensure
      connection.disconnect
    end
  end

  def with_connection_from_user(user, &block)
    options = ::SequelRails.configuration.environment_for(Rails.env).merge(
      'database' => user.database_name,
      'username' => user.database_username,
      'password' => user.database_password,
      'host' => user.database_host
    )
    with_connection options, &block
  end

  def with_connection_from_api_key(api_key, &block)
    user = api_key.user
    options = ::SequelRails.configuration.environment_for(Rails.env).merge(
      'database' => user.database_name,
      'username' => api_key.db_role,
      'password' => api_key.db_password,
      'host' => user.database_host
    )
    with_connection options, &block
  end

  it 'shares overviews when the base table is shared' 


  it 'overviews are granted api key privileges as for base table' 

end

