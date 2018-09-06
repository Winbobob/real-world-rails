require 'rails_helper'

describe 'Merge request > User resolves conflicts', :js do
  let(:project) { create(:project, :repository) }
  let(:user) { project.creator }

  before do
    # In order to have the diffs collapsed, we need to disable the increase feature
    stub_feature_flags(gitlab_git_diff_size_limit_increase: false)
  end

  def create_merge_request(source_branch)
    create(:merge_request, source_branch: source_branch, target_branch: 'conflict-start', source_project: project) do |mr|
      mr.mark_as_unmergeable
    end
  end

  shared_examples "conflicts are resolved in Interactive mode" do
    it 'conflicts are resolved in Interactive mode' 

  end

  shared_examples "conflicts are resolved in Edit inline mode" do
    it 'conflicts are resolved in Edit inline mode' 

  end

  context 'can be resolved in the UI' do
    before do
      project.add_developer(user)
      sign_in(user)
    end

    context 'the conflicts are resolvable' do
      let(:merge_request) { create_merge_request('conflict-resolvable') }

      before do
        visit project_merge_request_path(project, merge_request)
      end

      it 'shows a link to the conflict resolution page' 


      context 'in Inline view mode' do
        before do
          click_link('conflicts', href: %r{/conflicts\Z})
        end

        include_examples "conflicts are resolved in Interactive mode"
        include_examples "conflicts are resolved in Edit inline mode"
      end

      context 'in Parallel view mode' do
        before do
          click_link('conflicts', href: %r{/conflicts\Z})
          click_button 'Side-by-side'
        end

        include_examples "conflicts are resolved in Interactive mode"
        include_examples "conflicts are resolved in Edit inline mode"
      end
    end

    context 'the conflict contain markers' do
      let(:merge_request) { create_merge_request('conflict-contains-conflict-markers') }

      before do
        visit project_merge_request_path(project, merge_request)
        click_link('conflicts', href: %r{/conflicts\Z})
      end

      it 'conflicts can not be resolved in Interactive mode' 


      it 'conflicts are resolved in Edit inline mode' 

    end
  end

  UNRESOLVABLE_CONFLICTS = {
    'conflict-too-large' => 'when the conflicts contain a large file',
    'conflict-binary-file' => 'when the conflicts contain a binary file',
    'conflict-missing-side' => 'when the conflicts contain a file edited in one branch and deleted in another',
    'conflict-non-utf8' => 'when the conflicts contain a non-UTF-8 file'
  }.freeze

  UNRESOLVABLE_CONFLICTS.each do |source_branch, description|
    context description do
      let(:merge_request) { create_merge_request(source_branch) }

      before do
        project.add_developer(user)
        sign_in(user)
        visit project_merge_request_path(project, merge_request)
      end

      it 'does not show a link to the conflict resolution page' 


      it 'shows an error if the conflicts page is visited directly' 

    end
  end
end

