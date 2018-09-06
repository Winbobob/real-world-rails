require 'spec_helper'

describe PipelineSchedulesFinder do
  let(:project) { create(:project) }

  let!(:active_schedule) { create(:ci_pipeline_schedule, project: project) }
  let!(:inactive_schedule) { create(:ci_pipeline_schedule, :inactive, project: project) }

  subject { described_class.new(project).execute(params) }

  describe "#execute" do
    context 'when the scope is nil' do
      let(:params) { { scope: nil } }

      it 'selects all pipeline pipeline schedules' 

    end

    context 'when the scope is active' do
      let(:params) { { scope: 'active' } }

      it 'selects only active pipelines' 

    end

    context 'when the scope is inactve' do
      let(:params) { { scope: 'inactive' } }

      it 'selects only inactive pipelines' 

    end
  end
end

