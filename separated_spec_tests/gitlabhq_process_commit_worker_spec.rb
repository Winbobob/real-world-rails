require 'spec_helper'

describe ProcessCommitWorker do
  let(:worker) { described_class.new }
  let(:user) { create(:user) }
  let(:project) { create(:project, :public, :repository) }
  let(:issue) { create(:issue, project: project, author: user) }
  let(:commit) { project.commit }

  describe '#perform' do
    it 'does not process the commit when the project does not exist' 


    it 'does not process the commit when the user does not exist' 


    it 'processes the commit message' 


    it 'updates the issue metrics' 


    context 'when commit already exists in upstream project' do
      let(:forked) { create(:project, :public, :repository) }

      it 'does not process commit message' 

    end
  end

  describe '#process_commit_message' do
    context 'when pushing to the default branch' do
      before do
        allow(commit).to receive(:safe_message).and_return("Closes #{issue.to_reference}")
      end

      it 'closes issues that should be closed per the commit message' 


      it 'creates cross references' 

    end

    context 'when pushing to a non-default branch' do
      it 'does not close any issues' 


      it 'does not create cross references' 

    end

    context 'when commit is a merge request merge commit to the default branch' do
      let(:merge_request) do
        create(:merge_request,
               description: "Closes #{issue.to_reference}",
               source_branch: 'feature-merged',
               target_branch: 'master',
               source_project: project)
      end

      let(:commit) do
        project.repository.create_branch('feature-merged', 'feature')

        MergeRequests::MergeService
          .new(project, merge_request.author)
          .execute(merge_request)

        merge_request.reload.merge_commit
      end

      it 'does not close any issues from the commit message' 


      it 'still creates cross references' 

    end
  end

  describe '#close_issues' do
    context 'when the user can update the issues' do
      it 'closes the issues' 

    end

    context 'when the user can not update the issues' do
      it 'does not close the issues' 

    end
  end

  describe '#update_issue_metrics' do
    it 'updates any existing issue metrics' 


    it "doesn't execute any queries with false conditions" 

  end

  describe '#build_commit' do
    it 'returns a Commit' 


    it 'parses date strings into Time instances' 

  end
end

