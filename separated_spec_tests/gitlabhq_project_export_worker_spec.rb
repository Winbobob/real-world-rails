require 'spec_helper'

describe ProjectExportWorker do
  let!(:user) { create(:user) }
  let!(:project) { create(:project) }

  subject { described_class.new }

  describe '#perform' do
    context 'when it succeeds' do
      it 'calls the ExportService' 

    end

    context 'when it fails' do
      it 'raises an exception when params are invalid' 

    end
  end
end

