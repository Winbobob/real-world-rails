require_relative '../../../lib/carto/table_utils'

describe Carto::TableUtils do
  class TableUtilsTest
    include Carto::TableUtils
  end

  table_utils = TableUtilsTest.new

  shared_examples 'safe quoting' do
    # https://www.postgresql.org/docs/9.3/static/sql-syntax-lexical.html#SQL-SYNTAX-IDENTIFIERS
    it 'does not quotes table names if not needed' 


    it 'quotes table names if needed' 


    it 'does not quote already quoted strings' 


    it 'does not quote names with schema, even if they are wrong (quoting should be fixed upstream)' 

  end

  describe '#safe_table_name_quoting' do
    include_examples 'safe quoting'
  end

  describe '#safe_schema_name_quoting' do
    include_examples 'safe quoting'
  end

  describe '#safe_schema_and_table_quoting' do
    it 'quotes table names only if needed' 


    it 'quotes table names starting with numbers' 


    it 'does not quote already quoted strings' 

  end
end

