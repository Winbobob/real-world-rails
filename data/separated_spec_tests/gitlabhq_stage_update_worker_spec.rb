require 'spec_helper'

describe StageUpdateWorker do
  describe '#perform' do
    context 'when stage exists' do
      let(:stage) { create(:ci_stage_entity) }

      it 'updates stage status' 

    end

    context 'when stage does not exist' do
      it 'does not raise exception' 

    end
  end
end

