# encoding: utf-8
require_relative '../../lib/importer/psql'
require_relative '../factories/pg_connection'
require_relative '../../../../services/importer/spec/acceptance/cdb_importer_context'

describe 'SQL linter' do
  include CartoDB::Importer2
  include_context 'cdb_importer schema'

  describe '#create_table_statement' do
    it 'returns a create table statement with the passed table name' 

  end

  describe '#copy_satement' do
    it 'returns a copy statement with the passed table name' 

  end

  describe '#run' do
    it 'runs' 

  end
end


