require 'spec_helper'

describe StorageMigratorWorker do
  subject(:worker) { described_class.new }
  let(:projects) { create_list(:project, 2, :legacy_storage) }

  describe '#perform' do
    let(:ids) { projects.map(&:id) }

    it 'enqueue jobs to ProjectMigrateHashedStorageWorker' 


    it 'sets projects as read only' 


    it 'rescues and log exceptions' 

  end
end

