require 'spec_helper'

describe Gitlab::DataBuilder::Pipeline do
  let(:user) { create(:user) }
  let(:project) { create(:project, :repository) }

  let(:pipeline) do
    create(:ci_pipeline,
          project: project,
          status: 'success',
          sha: project.commit.sha,
          ref: project.default_branch)
  end

  let!(:build) { create(:ci_build, pipeline: pipeline) }

  describe '.build' do
    let(:data) { described_class.build(pipeline) }
    let(:attributes) { data[:object_attributes] }
    let(:build_data) { data[:builds].first }
    let(:project_data) { data[:project] }

    it 'has correct attributes' 


    context 'pipeline without variables' do
      it 'has empty variables hash' 

    end

    context 'pipeline with variables' do
      let(:build) { create(:ci_build, pipeline: pipeline) }
      let(:data) { described_class.build(pipeline) }
      let(:attributes) { data[:object_attributes] }
      let!(:pipeline_variable) { create(:ci_pipeline_variable, pipeline: pipeline, key: 'TRIGGER_KEY_1', value: 'TRIGGER_VALUE_1') }

      it { expect(attributes[:variables]).to be_a(Array) }
      it { expect(attributes[:variables]).to contain_exactly({ key: 'TRIGGER_KEY_1', value: 'TRIGGER_VALUE_1' }) }
    end
  end
end

