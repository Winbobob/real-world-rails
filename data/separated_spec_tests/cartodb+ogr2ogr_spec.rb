# encoding: utf-8
require 'pg'
require 'sequel'
require_relative '../../../../spec/spec_helper'
require_relative '../../lib/importer/ogr2ogr'
require_relative '../doubles/job'
require_relative '../factories/csv'
require_relative '../factories/pg_connection'

include CartoDB::Importer2

describe Ogr2ogr do
  before(:all) do
    @user             = create_user
    @user.save
    @pg_options       = @user.db_service.db_configuration_for.with_indifferent_access
    @db               = @user.in_database
    @db.execute('CREATE SCHEMA IF NOT EXISTS cdb_importer')
    @db.execute('SET search_path TO cdb_importer,public')
  end

  before(:each) do
    @csv              = Factories::CSV.new.write
    @filepath         = @csv.filepath
    @table_name       = "importer_#{rand(99999)}"
    @full_table_name  = "cdb_importer.#{@table_name}"
    @dataset          = @db[@table_name.to_sym]
    @wrapper          = CartoDB::Importer2::Ogr2ogr.new(@table_name, @filepath, @pg_options)
  end

  after(:each) do
    @csv.delete
    @db.drop_table? @full_table_name
  end

  after(:all) do
    @db.execute('DROP SCHEMA cdb_importer cascade')
    @db.disconnect
    @user.destroy
  end

  describe '#initialize' do
    it 'requires a filepath and postgres options' 

  end

  describe '#command' do
    it 'includes an encoding' 


    it 'includes the postgres options passed at initialization time' 


    it 'includes the desired output table name' 


    it 'includes the filepath to process' 

  end

  describe '#executable_path' do
    it 'returns the path to the ogr2ogr binary' 

  end

  describe '#run' do
    it 'imports a CSV to a Postgres table' 


    it 'keeps an existing cartodb_id column in imported records' 


    it 'Does not create header if one column is numerical' 


  end

  describe '#command_output' do
    it 'returns stdout and stderr from ogr2ogr binary' 

  end

  describe '#exit_code' do
    it 'returns the exit code from the ogr2ogr binary' 

  end

  describe '#append_mode' do
    it "tests that ogr2ogr's append mode works as expected" 

  end

end

