require 'spec_helper'

describe MergeRequestPresenter do
  let(:resource) { create :merge_request, source_project: project }
  let(:project) { create :project }
  let(:user) { create(:user) }

  describe '#ci_status' do
    subject { described_class.new(resource).ci_status }

    context 'when no head pipeline' do
      it 'return status using CiService' 

    end

    context 'when head pipeline present' do
      let(:pipeline) { build_stubbed(:ci_pipeline) }

      before do
        allow(resource).to receive(:actual_head_pipeline).and_return(pipeline)
      end

      context 'success with warnings' do
        before do
          allow(pipeline).to receive(:success?) { true }
          allow(pipeline).to receive(:has_warnings?) { true }
        end

        it 'returns "success_with_warnings"' 

      end

      context 'pipeline HAS status AND its not success with warnings' do
        before do
          allow(pipeline).to receive(:success?) { false }
          allow(pipeline).to receive(:has_warnings?) { false }
        end

        it 'returns pipeline status' 

      end

      context 'pipeline has NO status AND its not success with warnings' do
        before do
          allow(pipeline).to receive(:status) { nil }
          allow(pipeline).to receive(:success?) { false }
          allow(pipeline).to receive(:has_warnings?) { false }
        end

        it 'returns "preparing"' 

      end
    end
  end

  describe '#conflict_resolution_path' do
    let(:project) { create :project }
    let(:user) { create :user }
    let(:presenter) { described_class.new(resource, current_user: user) }
    let(:path) { presenter.conflict_resolution_path }

    context 'when MR cannot be resolved in UI' do
      it 'does not return conflict resolution path' 

    end

    context 'when conflicts cannot be resolved by user' do
      it 'does not return conflict resolution path' 

    end

    context 'when able to access conflict resolution UI' do
      it 'does return conflict resolution path' 

    end
  end

  context 'issues links' do
    let(:project) { create(:project, :private, :repository, creator: user, namespace: user.namespace) }
    let(:issue_a) { create(:issue, project: project) }
    let(:issue_b) { create(:issue, project: project) }

    let(:resource) do
      create(:merge_request,
             source_project: project, target_project: project,
             description: "Fixes #{issue_a.to_reference} Related #{issue_b.to_reference}")
    end

    before do
      project.add_developer(user)

      allow(resource.project).to receive(:default_branch)
        .and_return(resource.target_branch)
    end

    describe '#closing_issues_links' do
      subject { described_class.new(resource, current_user: user).closing_issues_links }

      it 'presents closing issues links' 


      it 'does not present related issues links' 


      it 'appends status when closing issue is already closed' 

    end

    describe '#mentioned_issues_links' do
      subject do
        described_class.new(resource, current_user: user)
          .mentioned_issues_links
      end

      it 'presents related issues links' 


      it 'does not present closing issues links' 


      it 'appends status when mentioned issue is already closed' 

    end

    describe '#assign_to_closing_issues_link' do
      subject do
        described_class.new(resource, current_user: user)
          .assign_to_closing_issues_link
      end

      before do
        assign_issues_service = double(MergeRequests::AssignIssuesService, assignable_issues: assignable_issues)
        allow(MergeRequests::AssignIssuesService).to receive(:new)
          .and_return(assign_issues_service)
      end

      context 'single closing issue' do
        let(:issue) { create(:issue) }
        let(:assignable_issues) { [issue] }

        it 'returns correct link with correct text' 

      end

      context 'multiple closing issues' do
        let(:issues) { create_list(:issue, 2) }
        let(:assignable_issues) { issues }

        it 'returns correct link with correct text' 

      end

      context 'no closing issue' do
        let(:assignable_issues) { [] }

        it 'returns correct link with correct text' 

      end
    end
  end

  describe '#cancel_merge_when_pipeline_succeeds_path' do
    subject do
      described_class.new(resource, current_user: user)
        .cancel_merge_when_pipeline_succeeds_path
    end

    context 'when can cancel mwps' do
      it 'returns path' 

    end

    context 'when cannot cancel mwps' do
      it 'returns nil' 

    end
  end

  describe '#merge_path' do
    subject do
      described_class.new(resource, current_user: user).merge_path
    end

    context 'when can be merged by user' do
      it 'returns path' 

    end

    context 'when cannot be merged by user' do
      it 'returns nil' 

    end
  end

  describe '#create_issue_to_resolve_discussions_path' do
    subject do
      described_class.new(resource, current_user: user)
        .create_issue_to_resolve_discussions_path
    end

    context 'when can create issue and issues enabled' do
      it 'returns path' 

    end

    context 'when cannot create issue' do
      it 'returns nil' 

    end

    context 'when issues disabled' do
      it 'returns nil' 

    end
  end

  describe '#remove_wip_path' do
    subject do
      described_class.new(resource, current_user: user).remove_wip_path
    end

    before do
      allow(resource).to receive(:work_in_progress?).and_return(true)
    end

    context 'when merge request enabled and has permission' do
      it 'has remove_wip_path' 

    end

    context 'when has no permission' do
      it 'returns nil' 

    end
  end

  describe '#target_branch_commits_path' do
    subject do
      described_class.new(resource, current_user: user)
        .target_branch_commits_path
    end

    context 'when target branch exists' do
      it 'returns path' 

    end

    context 'when target branch does not exist' do
      it 'returns nil' 

    end
  end

  describe '#target_branch_tree_path' do
    subject do
      described_class.new(resource, current_user: user)
        .target_branch_tree_path
    end

    context 'when target branch exists' do
      it 'returns path' 

    end

    context 'when target branch does not exist' do
      it 'returns nil' 

    end
  end

  describe '#source_branch_path' do
    subject do
      described_class.new(resource, current_user: user).source_branch_path
    end

    context 'when source branch exists' do
      it 'returns path' 

    end

    context 'when source branch does not exist' do
      it 'returns nil' 

    end
  end

  describe '#source_branch_with_namespace_link' do
    subject do
      described_class.new(resource, current_user: user).source_branch_with_namespace_link
    end

    it 'returns link' 

  end

  describe '#rebase_path' do
    before do
      allow(resource).to receive(:rebase_in_progress?) { rebase_in_progress }
      allow(resource).to receive(:should_be_rebased?) { should_be_rebased }

      allow_any_instance_of(Gitlab::UserAccess::RequestCacheExtension)
        .to receive(:can_push_to_branch?)
        .with(resource.source_branch)
        .and_return(can_push_to_branch)
    end

    subject do
      described_class.new(resource, current_user: user).rebase_path
    end

    context 'when can rebase' do
      let(:rebase_in_progress) { false }
      let(:can_push_to_branch) { true }
      let(:should_be_rebased) { true }

      before do
        allow(resource).to receive(:source_branch_exists?) { true }
      end

      it 'returns path' 

    end

    context 'when cannot rebase' do
      context 'when rebase in progress' do
        let(:rebase_in_progress) { true }
        let(:can_push_to_branch) { true }
        let(:should_be_rebased) { true }

        it 'returns nil' 

      end

      context 'when user cannot merge' do
        let(:rebase_in_progress) { false }
        let(:can_push_to_branch) { false }
        let(:should_be_rebased) { true }

        it 'returns nil' 

      end

      context 'should not be rebased' do
        let(:rebase_in_progress) { false }
        let(:can_push_to_branch) { true }
        let(:should_be_rebased) { false }

        it 'returns nil' 

      end
    end
  end
end

