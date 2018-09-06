require 'spec_helper'

describe PipelineHooksWorker do
  describe '#perform' do
    context 'when pipeline exists' do
      let(:pipeline) { create(:ci_pipeline) }

      it 'executes hooks for the pipeline' 

    end

    context 'when pipeline does not exist' do
      it 'does not raise exception' 

    end
  end
end

