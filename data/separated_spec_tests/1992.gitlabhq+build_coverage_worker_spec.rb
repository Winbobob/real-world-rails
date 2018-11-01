require 'spec_helper'

describe BuildCoverageWorker do
  describe '#perform' do
    context 'when build exists' do
      let!(:build) { create(:ci_build) }

      it 'updates code coverage' 

    end

    context 'when build does not exist' do
      it 'does not raise exception' 

    end
  end
end

