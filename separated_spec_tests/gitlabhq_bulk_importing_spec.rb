require 'spec_helper'

describe Gitlab::GithubImport::BulkImporting do
  let(:importer) do
    Class.new { include(Gitlab::GithubImport::BulkImporting) }.new
  end

  describe '#build_database_rows' do
    it 'returns an Array containing the rows to insert' 


    it 'does not import objects that have already been imported' 

  end

  describe '#bulk_insert' do
    it 'bulk inserts rows into the database' 

  end
end

