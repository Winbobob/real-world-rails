require 'rails_helper'

describe 'Merge request > User merges only if pipeline succeeds', :js do
  let(:merge_request) { create(:merge_request_with_diffs) }
  let(:project)       { merge_request.target_project }

  before do
    project.add_master(merge_request.author)
    sign_in(merge_request.author)
  end

  context 'project does not have CI enabled' do
    it 'allows MR to be merged' 

  end

  context 'when project has CI enabled' do
    let!(:pipeline) do
      create(:ci_empty_pipeline,
      project: project,
      sha: merge_request.diff_head_sha,
      ref: merge_request.source_branch,
      status: status, head_pipeline_of: merge_request)
    end

    context 'when merge requests can only be merged if the pipeline succeeds' do
      before do
        project.update_attribute(:only_allow_merge_if_pipeline_succeeds, true)
      end

      context 'when CI is running' do
        let(:status) { :running }

        it 'does not allow to merge immediately' 

      end

      context 'when CI failed' do
        let(:status) { :failed }

        it 'does not allow MR to be merged' 

      end

      context 'when CI canceled' do
        let(:status) { :canceled }

        it 'does not allow MR to be merged' 

      end

      context 'when CI succeeded' do
        let(:status) { :success }

        it 'allows MR to be merged' 

      end

      context 'when CI skipped' do
        let(:status) { :skipped }

        it 'allows MR to be merged' 

      end
    end

    context 'when merge requests can be merged when the build failed' do
      before do
        project.update_attribute(:only_allow_merge_if_pipeline_succeeds, false)
      end

      context 'when CI is running' do
        let(:status) { :running }

        it 'allows MR to be merged immediately' 

      end

      context 'when CI failed' do
        let(:status) { :failed }

        it 'allows MR to be merged' 

      end

      context 'when CI succeeded' do
        let(:status) { :success }

        it 'allows MR to be merged' 

      end
    end
  end
end

