require 'spec_helper'

describe MergeRequestWidgetEntity do
  let(:project)  { create :project, :repository }
  let(:resource) { create(:merge_request, source_project: project, target_project: project) }
  let(:user)     { create(:user) }

  let(:request) { double('request', current_user: user, project: project) }

  subject do
    described_class.new(resource, request: request).as_json
  end

  describe 'pipeline' do
    let(:pipeline) { create(:ci_empty_pipeline, project: project, ref: resource.source_branch, sha: resource.source_branch_sha, head_pipeline_of: resource) }

    context 'when is up to date' do
      let(:req) { double('request', current_user: user, project: project) }

      it 'returns pipeline' 

    end

    context 'when is not up to date' do
      it 'returns nil' 

    end
  end

  describe 'metrics' do
    context 'when metrics record exists with merged data' do
      before do
        resource.mark_as_merged!
        resource.metrics.update!(merged_by: user)
      end

      it 'matches merge request metrics schema' 


      it 'returns values from metrics record' 

    end

    context 'when metrics record exists with closed data' do
      before do
        resource.close!
        resource.metrics.update!(latest_closed_by: user)
      end

      it 'matches merge request metrics schema' 


      it 'returns values from metrics record' 

    end

    context 'when metrics does not exists' do
      before do
        resource.mark_as_merged!
        resource.metrics.destroy!
        resource.reload
      end

      context 'when events exists' do
        let!(:closed_event) { create(:event, :closed, project: project, target: resource) }
        let!(:merge_event) { create(:event, :merged, project: project, target: resource) }

        it 'matches merge request metrics schema' 


        it 'returns values from events record' 

      end

      context 'when events does not exists' do
        it 'matches merge request metrics schema' 

      end
    end
  end

  it 'has email_patches_path' 


  it 'has plain_diff_path' 


  it 'has merge_commit_message_with_description' 


  describe 'new_blob_path' do
    context 'when user can push to project' do
      it 'returns path' 

    end

    context 'when user cannot push to project' do
      it 'returns nil' 

    end
  end

  describe 'diff_head_sha' do
    before do
      allow(resource).to receive(:diff_head_sha) { 'sha' }
    end

    context 'when diff head commit is empty' do
      it 'returns nil' 

    end

    context 'when diff head commit present' do
      it 'returns diff head commit short id' 

    end
  end

  describe 'diverged_commits_count' do
    context 'when MR open and its diverging' do
      it 'returns diverged commits count' 

    end

    context 'when MR is not open' do
      it 'returns 0' 

    end

    context 'when MR is not diverging' do
      it 'returns 0' 

    end
  end

  describe 'when source project is deleted' do
    let(:project) { create(:project, :repository) }
    let(:fork_project) { create(:project, :repository, forked_from_project: project) }
    let(:merge_request) { create(:merge_request, source_project: fork_project, target_project: project) }

    it 'returns a blank rebase_path' 

  end
end

