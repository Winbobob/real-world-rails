require 'spec_helper'

describe ExpireJobCacheWorker do
  set(:pipeline) { create(:ci_empty_pipeline) }
  let(:project) { pipeline.project }
  subject { described_class.new }

  describe '#perform' do
    context 'with a job in the pipeline' do
      let(:job) { create(:ci_build, pipeline: pipeline) }

      it 'invalidates Etag caching for the job path' 

    end

    context 'when there is no job in the pipeline' do
      it 'does not change the etag store' 

    end
  end
end

