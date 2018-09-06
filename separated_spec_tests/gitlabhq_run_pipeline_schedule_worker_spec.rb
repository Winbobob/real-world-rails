require 'spec_helper'

describe RunPipelineScheduleWorker do
  describe '#perform' do
    set(:project) { create(:project) }
    set(:user) { create(:user) }
    set(:pipeline_schedule) { create(:ci_pipeline_schedule, :nightly, project: project ) }
    let(:worker) { described_class.new }

    context 'when a project not found' do
      it 'does not call the Service' 

    end

    context 'when a user not found' do
      it 'does not call the Service' 

    end

    context 'when everything is ok' do
      let(:create_pipeline_service) { instance_double(Ci::CreatePipelineService) }

      it 'calls the Service' 

    end
  end
end

