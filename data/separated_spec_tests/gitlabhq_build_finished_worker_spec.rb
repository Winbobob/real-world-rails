require 'spec_helper'

describe BuildFinishedWorker do
  describe '#perform' do
    context 'when build exists' do
      let!(:build) { create(:ci_build) }

      it 'calculates coverage and calls hooks' 

    end

    context 'when build does not exist' do
      it 'does not raise exception' 

    end
  end
end

