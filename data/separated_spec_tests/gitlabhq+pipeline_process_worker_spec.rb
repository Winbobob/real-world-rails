require 'spec_helper'

describe PipelineProcessWorker do
  describe '#perform' do
    context 'when pipeline exists' do
      let(:pipeline) { create(:ci_pipeline) }

      it 'processes pipeline' 

    end

    context 'when pipeline does not exist' do
      it 'does not raise exception' 

    end
  end
end

