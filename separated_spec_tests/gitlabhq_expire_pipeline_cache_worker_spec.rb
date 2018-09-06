require 'spec_helper'

describe ExpirePipelineCacheWorker do
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let(:pipeline) { create(:ci_pipeline, project: project) }
  subject { described_class.new }

  describe '#perform' do
    it 'invalidates Etag caching for project pipelines path' 


    it 'invalidates Etag caching for merge request pipelines if pipeline runs on any commit of that source branch' 


    it "doesn't do anything if the pipeline not exist" 


    it 'updates the cached status for a project' 

  end
end

