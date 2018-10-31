require 'spec_helper'

describe PipelineUpdateWorker do
  describe '#perform' do
    context 'when pipeline exists' do
      let(:pipeline) { create(:ci_pipeline) }

      it 'updates pipeline status' 

    end

    context 'when pipeline does not exist' do
      it 'does not raise exception' 

    end
  end
end

