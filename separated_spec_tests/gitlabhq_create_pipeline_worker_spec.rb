require 'spec_helper'

describe CreatePipelineWorker do
  describe '#perform' do
    let(:worker) { described_class.new }

    context 'when a project not found' do
      it 'does not call the Service' 

    end

    context 'when a user not found' do
      let(:project) { create(:project) }

      it 'does not call the Service' 

    end

    context 'when everything is ok' do
      let(:project) { create(:project) }
      let(:user) { create(:user) }
      let(:create_pipeline_service) { instance_double(Ci::CreatePipelineService) }

      it 'calls the Service' 

    end
  end
end

