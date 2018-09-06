require 'spec_helper'

describe PipelineSuccessWorker do
  describe '#perform' do
    context 'when pipeline exists' do
      let(:pipeline) { create(:ci_pipeline, status: 'success') }

      it 'performs "merge when pipeline succeeds"' 

    end

    context 'when pipeline does not exist' do
      it 'does not raise exception' 

    end
  end
end

