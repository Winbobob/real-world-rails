# encoding: utf-8
require_relative '../../../../spec/rspec_configuration'
require_relative '../../../../spec/spec_helper'
require_relative '../../lib/importer/runner'
require_relative '../../lib/importer/job'
require_relative '../../lib/importer/downloader'
require_relative '../factories/pg_connection'
require_relative '../doubles/log'
require_relative 'acceptance_helpers'
require_relative 'cdb_importer_context'
require_relative 'no_stats_context'

include CartoDB::Importer2

describe 'rar regression tests' do
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

  it 'returns empty results if no supported files in the bundle' 


  it 'ignores unsupported files in the bundle' 


  it 'imports a rar with >1 file successfully' 


  it 'imports a maximum of Runner::MAX_TABLES_PER_IMPORT files from a rar, but doesnt errors' 


  it 'imports a shapefile that includes a xxx.VERSION.txt file skipping it' 


  it 'imports all non-failing items from a rar without failing the whole import' 

end

