# encoding: utf-8
require_relative '../spec_helper'
require_relative '../../app/connectors/importer'
require_relative '../doubles/result'
require 'csv'

describe CartoDB::Connector::Importer do

  before(:all) do
    @user = create_user(quota_in_bytes: 1000.megabyte, table_quota: 400, max_layers: 4)
  end

  before(:each) do
    bypass_named_maps
  end

  after(:each) do
    if @data_import
      @data_import.table.destroy if @data_import.table.id.present?
      @data_import.destroy
    end
    @visualization.destroy if @visualization
    ::UserTable[@existing_table.id].destroy if @existing_table
  end

  after(:all) do
    bypass_named_maps
    @user.destroy
  end

  let(:skip) { DataImport::COLLISION_STRATEGY_SKIP }

  it 'should not fail to return a new_name when ALTERing the INDEX fails' 


  # This test checks that the importer detects files with names that are
  # psql reserved words and knows how to rename them (appending '_t')
  it 'should allow importing tables with reserved names' 


  it 'should import tables as public if privacy param is set to public' 


  it 'importing the same file twice should import the table twice renaming the second import' 


  it 'handles import with almost identical long file names properly' 


  it 'importing the same file twice with collision strategy skip should import the table once' 


  it 'should import tables as private if privacy param is set to private' 


  it 'should import table and vis as private if privacy param is set to private' 


  it 'should import vis as public if privacy param is set to private and user doesn\' have private maps' 


  it 'should import tables as private by default if user has private tables enabled' 


  it 'should import tables as public by default if user doesnt have private tables enabled' 


  it 'should import as public with private_tables enabled' 


  it 'should import table and vis as public with private_tables enabled' 


  it 'imported visualization should have registered table dependencies' 


  it 'imports files for Builder users' 


  it 'should not import as private if private_tables_enabled is disabled' 


  it 'should be able to handle wrong type guessing' 


  it 'should be able to import a multi file zip as a multilayer map' 


  it 'should be able to handle a zip with more files max_layers' 


  describe 'visualization importing' do
    it 'imports a visualization export' 


    it 'imports a visualization export when the table already exists' 


    it 'imports a visualization export and table is not duplicated if collision strategy is skip' 


    it 'imports a visualization export but not existing tables if collision strategy is skip' 


    it 'imports a visualization export with two data layers' 


    it 'imports a visualization export without data' 


    it 'registers table dependencies for .carto import' 

  end
end

