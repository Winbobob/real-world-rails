require 'spec_helper'

describe BuildTraceSectionsWorker do
  describe '#perform' do
    context 'when build exists' do
      let!(:build) { create(:ci_build) }

      it 'updates trace sections' 

    end

    context 'when build does not exist' do
      it 'does not raise exception' 

    end
  end
end

