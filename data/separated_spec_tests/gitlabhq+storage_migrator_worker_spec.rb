require 'spec_helper'

describe StorageMigratorWorker do
  subject(:worker) { described_class.new }
  let(:projects) { create_list(:project, 2, :legacy_storage, :empty_repo) }
  let(:ids) { projects.map(&:id) }

  describe '#perform' do
    it 'delegates to MigratorService' 


    it 'migrates projects in the specified range' 

  end
end

