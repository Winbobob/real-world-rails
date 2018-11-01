require 'spec_helper'

describe Gitlab::Badge::Coverage::Report do
  let(:project) { create(:project, :repository) }
  let(:job_name) { nil }

  let(:badge) do
    described_class.new(project, 'master', job_name)
  end

  describe '#entity' do
    it 'describes a coverage' 

  end

  describe '#metadata' do
    it 'returns correct metadata' 

  end

  describe '#template' do
    it 'returns correct template' 

  end

  shared_examples 'unknown coverage report' do
    context 'particular job specified' do
      let(:job_name) { '' }

      it 'returns nil' 

    end

    context 'particular job not specified' do
      let(:job_name) { nil }

      it 'returns nil' 

    end
  end

  context 'when latest successful pipeline exists' do
    before do
      create_pipeline do |pipeline|
        create(:ci_build, :success, pipeline: pipeline, name: 'first', coverage: 40)
        create(:ci_build, :success, pipeline: pipeline, coverage: 60)
      end

      create_pipeline do |pipeline|
        create(:ci_build, :failed, pipeline: pipeline, coverage: 10)
      end
    end

    context 'when particular job specified' do
      let(:job_name) { 'first' }

      it 'returns coverage for the particular job' 

    end

    context 'when particular job not specified' do
      let(:job_name) { '' }

      it 'returns arithemetic mean for the pipeline' 

    end
  end

  context 'when only failed pipeline exists' do
    before do
      create_pipeline do |pipeline|
        create(:ci_build, :failed, pipeline: pipeline, coverage: 10)
      end
    end

    it_behaves_like 'unknown coverage report'

    context 'particular job specified' do
      let(:job_name) { 'nonexistent' }

      it 'retruns nil' 

    end
  end

  context 'pipeline does not exist' do
    it_behaves_like 'unknown coverage report'
  end

  def create_pipeline
    opts = { project: project, sha: project.commit.id, ref: 'master' }

    create(:ci_pipeline, opts).tap do |pipeline|
      yield pipeline
      pipeline.update_status
    end
  end
end

