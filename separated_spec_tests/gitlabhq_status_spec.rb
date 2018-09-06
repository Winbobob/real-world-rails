require 'spec_helper'

describe Gitlab::Badge::Pipeline::Status do
  let(:project) { create(:project, :repository) }
  let(:sha) { project.commit.sha }
  let(:branch) { 'master' }
  let(:badge) { described_class.new(project, branch) }

  describe '#entity' do
    it 'always says pipeline' 

  end

  describe '#template' do
    it 'returns badge template' 

  end

  describe '#metadata' do
    it 'returns badge metadata' 

  end

  context 'pipeline exists' do
    let!(:pipeline) { create_pipeline(project, sha, branch) }

    context 'pipeline success' do
      before do
        pipeline.success!
      end

      describe '#status' do
        it 'is successful' 

      end
    end

    context 'pipeline failed' do
      before do
        pipeline.drop!
      end

      describe '#status' do
        it 'failed' 

      end
    end

    context 'when outdated pipeline for given ref exists' do
      before do
        pipeline.success!

        old_pipeline = create_pipeline(project, '11eeffdd', branch)
        old_pipeline.drop!
      end

      it 'does not take outdated pipeline into account' 

    end

    context 'when multiple pipelines exist for given sha' do
      before do
        pipeline.drop!

        new_pipeline = create_pipeline(project, sha, branch)
        new_pipeline.success!
      end

      it 'does not take outdated pipeline into account' 

    end
  end

  context 'build does not exist' do
    describe '#status' do
      it 'is unknown' 

    end
  end

  def create_pipeline(project, sha, branch)
    pipeline = create(:ci_empty_pipeline,
                      project: project,
                      sha: sha,
                      ref: branch)

    create(:ci_build, pipeline: pipeline, stage: 'notify')
  end
end

