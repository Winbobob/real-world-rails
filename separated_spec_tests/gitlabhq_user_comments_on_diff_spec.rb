require 'spec_helper'

describe 'User comments on a diff', :js do
  include MergeRequestDiffHelpers
  include RepoHelpers

  let(:project) { create(:project, :repository) }
  let(:merge_request) do
    create(:merge_request_with_diffs, source_project: project, target_project: project, source_branch: 'merge-test')
  end
  let(:user) { create(:user) }

  before do
    project.add_master(user)
    sign_in(user)

    visit(diffs_project_merge_request_path(project, merge_request))
  end

  context 'when viewing comments' do
    context 'when toggling inline comments' do
      context 'in a single file' do
        it 'hides a comment' 

      end

      context 'in multiple files' do
        it 'toggles comments' 

      end
    end
  end

  context 'when adding comments' do
    include_examples 'comment on merge request file'
  end

  context 'when editing comments' do
    it 'edits a comment' 

  end

  context 'when deleting comments' do
    it 'deletes a comment' 

  end
end

