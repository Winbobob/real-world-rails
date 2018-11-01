require 'spec_helper'

shared_examples 'renames child namespaces' do |type|
  it 'renames namespaces' 

end

describe Gitlab::Database::RenameReservedPathsMigration::V1, :delete do
  let(:subject) { FakeRenameReservedPathMigrationV1.new }

  before do
    allow(subject).to receive(:say)
  end

  describe '#rename_child_paths' do
    it_behaves_like 'renames child namespaces'
  end

  describe '#rename_wildcard_paths' do
    it_behaves_like 'renames child namespaces'

    it 'should rename projects' 

  end

  describe '#rename_root_paths' do
    it 'should rename namespaces' 

  end

  describe '#revert_renames' do
    it 'renames namespaces' 


    it 'renames projects' 

  end
end

