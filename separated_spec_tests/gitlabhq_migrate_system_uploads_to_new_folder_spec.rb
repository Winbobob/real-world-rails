require 'spec_helper'

describe Gitlab::BackgroundMigration::MigrateSystemUploadsToNewFolder, :delete do
  let(:migration) { described_class.new }

  before do
    allow(migration).to receive(:logger).and_return(Logger.new(nil))
  end

  describe '#perform' do
    it 'renames the path of system-uploads' 

  end
end

