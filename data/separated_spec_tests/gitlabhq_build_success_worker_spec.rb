require 'spec_helper'

describe BuildSuccessWorker do
  describe '#perform' do
    context 'when build exists' do
      context 'when build belogs to the environment' do
        let!(:build) { create(:ci_build, environment: 'production') }

        it 'executes deployment service' 

      end

      context 'when build is not associated with project' do
        let!(:build) { create(:ci_build, project: nil) }

        it 'does not create deployment' 

      end
    end

    context 'when build does not exist' do
      it 'does not raise exception' 

    end
  end
end

