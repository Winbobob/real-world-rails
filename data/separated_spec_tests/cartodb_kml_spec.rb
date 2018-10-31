# encoding: utf-8
require_relative '../../../../spec/rspec_configuration'
require_relative '../../../../spec/spec_helper'
require_relative '../../lib/importer/runner'
require_relative '../../lib/importer/job'
require_relative '../../lib/importer/downloader'
require_relative '../factories/pg_connection'
require_relative '../doubles/log'
require_relative '../doubles/user'
require_relative 'acceptance_helpers'
require_relative 'cdb_importer_context'
require_relative 'no_stats_context'

describe 'KML regression tests' do
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

  it 'imports KML files' 


  it 'imports KML files from url' 


  it 'imports KMZ in a 3D projection' 


  it 'imports multi-layer KMLs' 


  it 'raises if KML just contains a link to the actual KML url' 


  it 'imports a maximum of Runner::MAX_TABLES_PER_IMPORT KMLs from a zip ok' 


  it 'raises exception if KML style tag dont have and ID' 


end

