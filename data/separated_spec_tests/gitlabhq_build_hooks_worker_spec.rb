require 'spec_helper'

describe BuildHooksWorker do
  describe '#perform' do
    context 'when build exists' do
      let!(:build) { create(:ci_build) }

      it 'calls build hooks' 

    end

    context 'when build does not exist' do
      it 'does not raise exception' 

    end
  end
end

