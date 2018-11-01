require 'spec_helper'

describe Ci::CompareTestReportsService do
  let(:service) { described_class.new(project) }
  let(:project) { create(:project, :repository) }

  describe '#execute' do
    subject { service.execute(base_pipeline, head_pipeline) }

    context 'when head pipeline has test reports' do
      let!(:base_pipeline) { nil }
      let!(:head_pipeline) { create(:ci_pipeline, :with_test_reports, project: project) }

      it 'returns status and data' 

    end

    context 'when base and head pipelines have test reports' do
      let!(:base_pipeline) { create(:ci_pipeline, :with_test_reports, project: project) }
      let!(:head_pipeline) { create(:ci_pipeline, :with_test_reports, project: project) }

      it 'returns status and data' 

    end

    context 'when head pipeline has corrupted test reports' do
      let!(:base_pipeline) { nil }
      let!(:head_pipeline) { create(:ci_pipeline, project: project) }

      before do
        build = create(:ci_build, pipeline: head_pipeline, project: head_pipeline.project)
        create(:ci_job_artifact, :junit_with_corrupted_data, job: build, project: project)
      end

      it 'returns status and error message' 

    end
  end

  describe '#latest?' do
    subject { service.latest?(base_pipeline, head_pipeline, data) }

    let!(:base_pipeline) { nil }
    let!(:head_pipeline) { create(:ci_pipeline, :with_test_reports, project: project) }
    let!(:key) { service.send(:key, base_pipeline, head_pipeline) }

    context 'when cache key is latest' do
      let(:data) { { key: key } }

      it { is_expected.to be_truthy }
    end

    context 'when cache key is outdated' do
      before do
        head_pipeline.update_column(:updated_at, 10.minutes.ago)
      end

      let(:data) { { key: key } }

      it { is_expected.to be_falsy }
    end

    context 'when cache key is empty' do
      let(:data) { { key: nil } }

      it { is_expected.to be_falsy }
    end
  end
end

