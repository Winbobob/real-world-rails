# encoding: utf-8
require_relative '../../lib/importer/georeferencer'
require_relative '../factories/pg_connection'
require_relative '../../../../services/importer/spec/doubles/log'
require_relative '../../../../spec/rspec_configuration'
require_relative '../../../../spec/spec_helper'

include CartoDB

include CartoDB::Importer2

describe Importer2::Georeferencer do

  before(:all) do
    @db = Importer2::Factories::PGConnection.new(
      :create_db => 'georeferencer_spec'
    ).connection

    create_schema(@db, 'cdb_importer')

    @db.execute('SET search_path TO cdb_importer,public')

    @table_name = create_table(@db)

    @user = create_user
    @user.save
  end

  after(:all) do
    puts "Dropping table..."
    @db.drop_table? @table_name

    #TODO Drop schema

    @db.disconnect

    @user.destroy
  end

  before(:each) do
    CartoDB::Stats::Aggregator.stubs(:read_config).returns({})
  end

  describe '#initialize' do
    it 'requires a db connection and a table name' 

  end #initialize

  describe '#run' do
    it 'returns self if no lat / lon columns in the table' 

  end #run

  describe '#create_the_geom_in' do
    before do
      @table_name = create_table(@db)
    end

    it 'adds a the_geom column to a table' 


    it 'returns false if the_geom column already exists' 

  end #create_the_geom_in

  describe '#column_exists_in?' do
    it 'return true if the column exists in the table' 

  end #column_exists_in?

  describe '#columns_in' do
    it 'returns the names of columns in a table' 

  end #columns_in

  describe '#find_column_in' do
    it 'returns the name of a column in a set of possible names if one of them
    actually exists in the table' do
      georeferencer = georeferencer_instance
      georeferencer.find_column_in(@table_name, "'name','bogus'")
        .should eq 'name'

      georeferencer.find_column_in(@table_name, "'bogus'").should eq false
    end
  end #find_column_in

  def georeferencer_instance(db = @db, table_name = @table_name)
    options = { guessing: {enabled: false} }
    Importer2::Georeferencer.new(@db, table_name, options, Importer2::Georeferencer::DEFAULT_SCHEMA, job=nil, geometry_columns=nil, logger=CartoDB::Importer2::Doubles::Log.new(@user))
  end

  # Attempts to create a new database schema
  # Does not raise exception if the schema already exists
  def create_schema(db, schema)
    db.run(%Q{CREATE SCHEMA IF NOT EXISTS #{schema}})
  end #create_schema

  def create_table(db, options={})
    table_name        = options.fetch(:table_name, "importer_#{rand(999)}")
    latitude_column   = options.fetch(:latitude_column, :lat)
    longitude_column  = options.fetch(:longitude_column, :lon)

    db.drop_table?(table_name)
    db.create_table?(table_name) do
      String    :name
      String    :description
      String    latitude_column.to_sym
      String    longitude_column.to_sym
      String    :ogc_fid
    end

    table_name
  end

  def random_record
    {
      name:         'bogus',
      description:  'bogus',
      lat:          rand(90),
      lon:          rand(180),
      ogc_fid:      rand(100)
    }
  end #random_record
end # Importer2::Georeferencer

