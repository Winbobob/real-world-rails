# encoding: utf-8
require_relative '../../../../spec/spec_helper'
require_relative '../../lib/importer/runner'
require_relative '../../lib/importer/job'
require_relative '../../lib/importer/downloader'
require_relative '../factories/pg_connection'
require_relative '../doubles/log'
require_relative '../doubles/user'
require_relative 'acceptance_helpers'
require_relative '../../spec/doubles/importer_stats'
require_relative 'cdb_importer_context'
require_relative 'no_stats_context'

include CartoDB::Importer2

describe 'csv regression tests' do
  include AcceptanceHelpers
  include_context "cdb_importer schema"
  include_context "no stats"

  before(:all) do
    @user = create_user
    @user.save
  end

  after(:all) do
    @user.destroy
  end

  it 'georeferences files with lat / lon columns' 


  it 'imports XLS files' 


  it 'imports files with duplicated column names' 


  it 'raises DuplicatedColumnError with long duplicated column names' 


  it 'imports files exported from the SQL API' 


  it 'imports files from Google Fusion Tables' 


  it 'imports files with a the_geom column in GeoJSON' 


  it 'imports files with spaces as delimiters' 


  it 'imports files with & in the name' 


  it 'import files named "all"' 


  it 'imports files with invalid the_geom but previous valid geometry column (see #2108)' 


  it 'import big row files' 


  it 'imports records with cell line breaks' 


  it 'imports records with cell line breaks in tables which require normalization' 


  it 'import records in ISO-8859-1 with Windows-style breaks' 


  it 'import records with cell cp1252 reverse line breaks' 


  it 'import records with cell utf8 reverse line breaks' 


  it 'import records with escaped quotes' 


  it 'refuses to import csv with broken encoding' 



  it 'displays a specific error message for a file with too many columns' 


  it 'errors after created temporary table should clean the table' 


  it 'displays a specific error message for a file with 10000 columns' 


  it 'files with wrong dates convert the column in string instead of date' 


  def sample_for(job)
    job.db[%Q{
      SELECT *
      FROM #{job.qualified_table_name}
    }].first
  end

  def ogr2ogr2_options
    {
      ogr2ogr_csv_guessing:   'yes'
    }
  end

  def runner_with_fixture(file, job = nil, add_ogr2ogr2_options = false)
    filepath = path_to(file)
    downloader = Downloader.new(@user.id, filepath)
    runner = Runner.new({
                 pg: @user.db_service.db_configuration_for,
                 downloader: downloader,
                 log: CartoDB::Importer2::Doubles::Log.new(@user),
                 user: @user,
                 job: job
               })
    if add_ogr2ogr2_options
      runner.loader_options = ogr2ogr2_options
    end
    runner
  end

end

