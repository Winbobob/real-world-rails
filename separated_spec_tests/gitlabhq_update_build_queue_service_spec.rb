require 'spec_helper'

describe Ci::UpdateBuildQueueService do
  let(:project) { create(:project, :repository) }
  let(:build) { create(:ci_build, pipeline: pipeline) }
  let(:pipeline) { create(:ci_pipeline, project: project) }

  context 'when updating specific runners' do
    let(:runner) { create(:ci_runner) }

    context 'when there is a runner that can pick build' do
      before do
        build.project.runners << runner
      end

      it 'ticks runner queue value' 

    end

    context 'when there is no runner that can pick build' do
      it 'does not tick runner queue value' 

    end
  end

  context 'when updating shared runners' do
    let(:runner) { create(:ci_runner, :shared) }

    context 'when there is no runner that can pick build' do
      it 'ticks runner queue value' 

    end

    context 'when there is no runner that can pick build due to tag mismatch' do
      before do
        build.tag_list = [:docker]
      end

      it 'does not tick runner queue value' 

    end

    context 'when there is no runner that can pick build due to being disabled on project' do
      before do
        build.project.shared_runners_enabled = false
      end

      it 'does not tick runner queue value' 

    end
  end

  context 'when updating group runners' do
    let(:group) { create :group }
    let(:project) { create :project, group: group }
    let(:runner) { create :ci_runner, groups: [group] }

    context 'when there is a runner that can pick build' do
      it 'ticks runner queue value' 

    end

    context 'when there is no runner that can pick build due to tag mismatch' do
      before do
        build.tag_list = [:docker]
      end

      it 'does not tick runner queue value' 

    end

    context 'when there is no runner that can pick build due to being disabled on project' do
      before do
        build.project.group_runners_enabled = false
      end

      it 'does not tick runner queue value' 

    end
  end
end
