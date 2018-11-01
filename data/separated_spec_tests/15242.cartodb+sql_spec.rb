# encoding: utf-8
require_relative '../../../../spec/rspec_configuration'
require_relative '../../lib/importer/runner'
require_relative '../../lib/importer/job'
require_relative '../../lib/importer/downloader'
require_relative '../factories/pg_connection'
require_relative 'acceptance_helpers'
require_relative '../doubles/log'
require_relative 'cdb_importer_context'

include CartoDB::Importer2

describe 'SQL regression tests' do
  include AcceptanceHelpers
  include_context "cdb_importer schema"

  it 'imports SQL files' 


end # SQL regression tests
 
