require 'spec_helper'

describe SystemNoteService do
  include Gitlab::Routing
  include RepoHelpers
  include AssetsHelpers

  set(:group)    { create(:group) }
  set(:project)  { create(:project, :repository, group: group) }
  set(:author)   { create(:user) }
  let(:noteable) { create(:issue, project: project) }
  let(:issue)    { noteable }

  shared_examples_for 'a system note' do
    let(:expected_noteable) { noteable }
    let(:commit_count)      { nil }

    it 'has the correct attributes', :aggregate_failures do
      expect(subject).to be_valid
      expect(subject).to be_system

      expect(subject.noteable).to eq expected_noteable
      expect(subject.project).to eq project
      expect(subject.author).to eq author

      expect(subject.system_note_metadata.action).to eq(action)
      expect(subject.system_note_metadata.commit_count).to eq(commit_count)
    end
  end

  describe '.add_commits' do
    subject { described_class.add_commits(noteable, project, author, new_commits, old_commits, oldrev) }

    let(:noteable)    { create(:merge_request, source_project: project, target_project: project) }
    let(:new_commits) { noteable.commits }
    let(:old_commits) { [] }
    let(:oldrev)      { nil }

    it_behaves_like 'a system note' do
      let(:commit_count) { new_commits.size }
      let(:action)       { 'commit' }
    end

    describe 'note body' do
      let(:note_lines) { subject.note.split("\n").reject(&:blank?) }

      describe 'comparison diff link line' do
        it 'adds the comparison text' 

      end

      context 'without existing commits' do
        it 'adds a message header' 


        it 'adds a message for each commit' 

      end

      describe 'summary line for existing commits' do
        let(:summary_line) { note_lines[1] }

        context 'with one existing commit' do
          let(:old_commits) { [noteable.commits.last] }

          it 'includes the existing commit' 

        end

        context 'with multiple existing commits' do
          let(:old_commits) { noteable.commits[3..-1] }

          context 'with oldrev' do
            let(:oldrev) { noteable.commits[2].id }

            it 'includes a commit range and count' 

          end

          context 'without oldrev' do
            it 'includes a commit range and count' 

          end

          context 'on a fork' do
            before do
              expect(noteable).to receive(:for_fork?).and_return(true)
            end

            it 'includes the project namespace' 

          end
        end
      end
    end
  end

  describe '.tag_commit' do
    let(:noteable) do
      project.commit
    end
    let(:tag_name) { 'v1.2.3' }

    subject { described_class.tag_commit(noteable, project, author, tag_name) }

    it_behaves_like 'a system note' do
      let(:action) { 'tag' }
    end

    it 'sets the note text' 

  end

  describe '.change_assignee' do
    subject { described_class.change_assignee(noteable, project, author, assignee) }

    let(:assignee) { create(:user) }

    it_behaves_like 'a system note' do
      let(:action) { 'assignee' }
    end

    context 'when assignee added' do
      it 'sets the note text' 

    end

    context 'when assignee removed' do
      let(:assignee) { nil }

      it 'sets the note text' 

    end
  end

  describe '.change_issue_assignees' do
    subject { described_class.change_issue_assignees(noteable, project, author, [assignee]) }

    let(:assignee) { create(:user) }
    let(:assignee1) { create(:user) }
    let(:assignee2) { create(:user) }
    let(:assignee3) { create(:user) }

    it_behaves_like 'a system note' do
      let(:action) { 'assignee' }
    end

    def build_note(old_assignees, new_assignees)
      issue.assignees = new_assignees
      described_class.change_issue_assignees(issue, project, author, old_assignees).note
    end

    it 'builds a correct phrase when an assignee is added to a non-assigned issue' 


    it 'builds a correct phrase when assignee removed' 


    it 'builds a correct phrase when assignees changed' 


    it 'builds a correct phrase when three assignees removed and one added' 


    it 'builds a correct phrase when one assignee changed from a set' 


    it 'builds a correct phrase when one assignee removed from a set' 

  end

  describe '.change_milestone' do
    context 'for a project milestone' do
      subject { described_class.change_milestone(noteable, project, author, milestone) }

      let(:milestone) { create(:milestone, project: project) }

      it_behaves_like 'a system note' do
        let(:action) { 'milestone' }
      end

      context 'when milestone added' do
        it 'sets the note text' 

      end

      context 'when milestone removed' do
        let(:milestone) { nil }

        it 'sets the note text' 

      end
    end

    context 'for a group milestone' do
      subject { described_class.change_milestone(noteable, project, author, milestone) }

      let(:milestone) { create(:milestone, group: group) }

      it_behaves_like 'a system note' do
        let(:action) { 'milestone' }
      end

      context 'when milestone added' do
        it 'sets the note text to use the milestone name' 

      end

      context 'when milestone removed' do
        let(:milestone) { nil }

        it 'sets the note text' 

      end
    end
  end

  describe '.change_due_date' do
    subject { described_class.change_due_date(noteable, project, author, due_date) }

    let(:due_date) { Date.today }

    it_behaves_like 'a system note' do
      let(:action) { 'due_date' }
    end

    context 'when due date added' do
      it 'sets the note text' 

    end

    context 'when due date removed' do
      let(:due_date) { nil }

      it 'sets the note text' 

    end
  end

  describe '.change_status' do
    subject { described_class.change_status(noteable, project, author, status, source) }

    context 'with status reopened' do
      let(:status) { 'reopened' }
      let(:source) { nil }

      it_behaves_like 'a system note' do
        let(:action) { 'opened' }
      end
    end

    context 'with a source' do
      let(:status) { 'opened' }
      let(:source) { double('commit', gfm_reference: 'commit 123456') }

      it 'sets the note text' 

    end
  end

  describe '.merge_when_pipeline_succeeds' do
    let(:pipeline) { build(:ci_pipeline_without_jobs )}
    let(:noteable) do
      create(:merge_request, source_project: project, target_project: project)
    end

    subject { described_class.merge_when_pipeline_succeeds(noteable, project, author, noteable.diff_head_commit) }

    it_behaves_like 'a system note' do
      let(:action) { 'merge' }
    end

    it "posts the 'merge when pipeline succeeds' system note" 

  end

  describe '.cancel_merge_when_pipeline_succeeds' do
    let(:noteable) do
      create(:merge_request, source_project: project, target_project: project)
    end

    subject { described_class.cancel_merge_when_pipeline_succeeds(noteable, project, author) }

    it_behaves_like 'a system note' do
      let(:action) { 'merge' }
    end

    it "posts the 'merge when pipeline succeeds' system note" 

  end

  describe '.change_title' do
    let(:noteable) { create(:issue, project: project, title: 'Lorem ipsum') }

    subject { described_class.change_title(noteable, project, author, 'Old title') }

    context 'when noteable responds to `title`' do
      it_behaves_like 'a system note' do
        let(:action) { 'title' }
      end

      it 'sets the note text' 

    end
  end

  describe '.change_description' do
    subject { described_class.change_description(noteable, project, author) }

    context 'when noteable responds to `description`' do
      it_behaves_like 'a system note' do
        let(:action) { 'description' }
      end

      it 'sets the note text' 

    end
  end

  describe '.change_issue_confidentiality' do
    subject { described_class.change_issue_confidentiality(noteable, project, author) }

    context 'issue has been made confidential' do
      before do
        noteable.update_attribute(:confidential, true)
      end

      it_behaves_like 'a system note' do
        let(:action) { 'confidential' }
      end

      it 'sets the note text' 

    end

    context 'issue has been made visible' do
      it_behaves_like 'a system note' do
        let(:action) { 'visible' }
      end

      it 'sets the note text' 

    end
  end

  describe '.change_branch' do
    subject { described_class.change_branch(noteable, project, author, 'target', old_branch, new_branch) }

    let(:old_branch) { 'old_branch'}
    let(:new_branch) { 'new_branch'}

    it_behaves_like 'a system note' do
      let(:action) { 'branch' }
    end

    context 'when target branch name changed' do
      it 'sets the note text' 

    end
  end

  describe '.change_branch_presence' do
    subject { described_class.change_branch_presence(noteable, project, author, :source, 'feature', :delete) }

    it_behaves_like 'a system note' do
      let(:action) { 'branch' }
    end

    context 'when source branch deleted' do
      it 'sets the note text' 

    end
  end

  describe '.new_issue_branch' do
    subject { described_class.new_issue_branch(noteable, project, author, "1-mepmep") }

    it_behaves_like 'a system note' do
      let(:action) { 'branch' }
    end

    context 'when a branch is created from the new branch button' do
      it 'sets the note text' 

    end
  end

  describe '.cross_reference' do
    subject { described_class.cross_reference(noteable, mentioner, author) }

    let(:mentioner) { create(:issue, project: project) }

    it_behaves_like 'a system note' do
      let(:action) { 'cross_reference' }
    end

    context 'when cross-reference disallowed' do
      before do
        expect(described_class).to receive(:cross_reference_disallowed?).and_return(true)
      end

      it 'returns nil' 


      it 'does not create a system note metadata record' 

    end

    context 'when cross-reference allowed' do
      before do
        expect(described_class).to receive(:cross_reference_disallowed?).and_return(false)
      end

      it_behaves_like 'a system note' do
        let(:action) { 'cross_reference' }
      end

      describe 'note_body' do
        context 'cross-project' do
          let(:project2) { create(:project, :repository) }
          let(:mentioner) { create(:issue, project: project2) }

          context 'from Commit' do
            let(:mentioner) { project2.repository.commit }

            it 'references the mentioning commit' 

          end

          context 'from non-Commit' do
            it 'references the mentioning object' 

          end
        end

        context 'within the same project' do
          context 'from Commit' do
            let(:mentioner) { project.repository.commit }

            it 'references the mentioning commit' 

          end

          context 'from non-Commit' do
            it 'references the mentioning object' 

          end
        end
      end
    end
  end

  describe '.cross_reference_disallowed?' do
    context 'when mentioner is not a MergeRequest' do
      it 'is falsey' 

    end

    context 'when mentioner is a MergeRequest' do
      let(:mentioner) { create(:merge_request, :simple, source_project: project) }
      let(:noteable)  { project.commit }

      it 'is truthy when noteable is in commits' 


      it 'is falsey when noteable is not in commits' 

    end

    context 'when notable is an ExternalIssue' do
      let(:noteable) { ExternalIssue.new('EXT-1234', project) }
      it 'is truthy' 

    end
  end

  describe '.cross_reference_exists?' do
    let(:commit0) { project.commit }
    let(:commit1) { project.commit('HEAD~2') }

    context 'issue from commit' do
      before do
        # Mention issue (noteable) from commit0
        described_class.cross_reference(noteable, commit0, author)
      end

      it 'is truthy when already mentioned' 


      it 'is falsey when not already mentioned' 


      context 'legacy capitalized cross reference' do
        before do
          # Mention issue (noteable) from commit0
          system_note = described_class.cross_reference(noteable, commit0, author)
          system_note.update(note: system_note.note.capitalize)
        end

        it 'is truthy when already mentioned' 

      end
    end

    context 'commit from commit' do
      before do
        # Mention commit1 from commit0
        described_class.cross_reference(commit0, commit1, author)
      end

      it 'is truthy when already mentioned' 


      it 'is falsey when not already mentioned' 


      context 'legacy capitalized cross reference' do
        before do
          # Mention commit1 from commit0
          system_note = described_class.cross_reference(commit0, commit1, author)
          system_note.update(note: system_note.note.capitalize)
        end

        it 'is truthy when already mentioned' 

      end
    end

    context 'commit with cross-reference from fork' do
      let(:author2) { create(:project_member, :reporter, user: create(:user), project: project).user }
      let(:forked_project) { Projects::ForkService.new(project, author2).execute }
      let(:commit2) { forked_project.commit }

      before do
        described_class.cross_reference(noteable, commit0, author2)
      end

      it 'is true when a fork mentions an external issue' 


      context 'legacy capitalized cross reference' do
        before do
          system_note = described_class.cross_reference(noteable, commit0, author2)
          system_note.update(note: system_note.note.capitalize)
        end

        it 'is true when a fork mentions an external issue' 

      end
    end
  end

  describe '.noteable_moved' do
    let(:new_project) { create(:project) }
    let(:new_noteable) { create(:issue, project: new_project) }

    subject do
      described_class.noteable_moved(noteable, project, new_noteable, author, direction: direction)
    end

    shared_examples 'cross project mentionable' do
      include MarkupHelper

      it 'contains cross reference to new noteable' 


      it 'mentions referenced noteable' 


      it 'mentions referenced project' 

    end

    context 'moved to' do
      let(:direction) { :to }

      it_behaves_like 'cross project mentionable'
      it_behaves_like 'a system note' do
        let(:action) { 'moved' }
      end

      it 'notifies about noteable being moved to' 

    end

    context 'moved from' do
      let(:direction) { :from }

      it_behaves_like 'cross project mentionable'
      it_behaves_like 'a system note' do
        let(:action) { 'moved' }
      end

      it 'notifies about noteable being moved from' 

    end

    context 'invalid direction' do
      let(:direction) { :invalid }

      it 'raises error' 

    end
  end

  describe '.new_commit_summary' do
    it 'escapes HTML titles' 

  end

  describe 'JIRA integration' do
    include JiraServiceHelper

    let(:project)         { create(:jira_project, :repository) }
    let(:author)          { create(:user) }
    let(:issue)           { create(:issue, project: project) }
    let(:merge_request)   { create(:merge_request, :simple, target_project: project, source_project: project) }
    let(:jira_issue)      { ExternalIssue.new("JIRA-1", project)}
    let(:jira_tracker)    { project.jira_service }
    let(:commit)          { project.commit }
    let(:comment_url)     { jira_api_comment_url(jira_issue.id) }
    let(:success_message) { "SUCCESS: Successfully posted to http://jira.example.net." }

    before do
      stub_jira_urls(jira_issue.id)
      jira_service_settings
    end

    def cross_reference(type, link_exists = false)
      noteable = type == 'commit' ? commit : merge_request

      links = []
      if link_exists
        url = if type == 'commit'
                "#{Settings.gitlab.base_url}/#{project.namespace.path}/#{project.path}/commit/#{commit.id}"
              else
                "#{Settings.gitlab.base_url}/#{project.namespace.path}/#{project.path}/merge_requests/#{merge_request.iid}"
              end

        link = double(object: { 'url' => url })
        links << link
        expect(link).to receive(:save!)
      end

      allow(JIRA::Resource::Remotelink).to receive(:all).and_return(links)

      described_class.cross_reference(jira_issue, noteable, author)
    end

    noteable_types = %w(merge_requests commit)

    noteable_types.each do |type|
      context "when noteable is a #{type}" do
        it "blocks cross reference when #{type.underscore}_events is false" 


        it "creates cross reference when #{type.underscore}_events is true" 

      end

      context 'when a new cross reference is created' do
        it 'creates a new comment and remote link' 

      end

      context 'when a link exists' do
        it 'updates a link but does not create a new comment' 

      end
    end

    describe "new reference" do
      let(:favicon_path) { "http://localhost/assets/#{find_asset('favicon.png').digest_path}" }

      before do
        allow(JIRA::Resource::Remotelink).to receive(:all).and_return([])
      end

      context 'for commits' do
        it "creates comment" 


        it "creates remote link" 

      end

      context 'for issues' do
        let(:issue)           { create(:issue, project: project) }

        it "creates comment" 


        it "creates remote link" 

      end

      context 'for snippets' do
        let(:snippet) { create(:snippet, project: project) }

        it "creates comment" 


        it "creates remote link" 

      end
    end

    describe "existing reference" do
      before do
        allow(JIRA::Resource::Remotelink).to receive(:all).and_return([])
        message = "[#{author.name}|http://localhost/#{author.username}] mentioned this issue in [a commit of #{project.full_path}|http://localhost/#{project.full_path}/commit/#{commit.id}]:\n'#{commit.title.chomp}'"
        allow_any_instance_of(JIRA::Resource::Issue).to receive(:comments).and_return([OpenStruct.new(body: message)])
      end

      it "does not return success message" 


      it 'does not try to create comment and remote link' 

    end
  end

  describe '.discussion_continued_in_issue' do
    let(:discussion) { create(:diff_note_on_merge_request, project: project).to_discussion }
    let(:merge_request) { discussion.noteable }
    let(:issue) { create(:issue, project: project) }

    def reloaded_merge_request
      MergeRequest.find(merge_request.id)
    end

    subject { described_class.discussion_continued_in_issue(discussion, project, author, issue) }

    it_behaves_like 'a system note' do
      let(:expected_noteable) { discussion.first_note.noteable }
      let(:action)              { 'discussion' }
    end

    it 'creates a new note in the discussion' 


    it 'mentions the created issue in the system note' 

  end

  describe '.change_time_estimate' do
    subject { described_class.change_time_estimate(noteable, project, author) }

    it_behaves_like 'a system note' do
      let(:action) { 'time_tracking' }
    end

    context 'with a time estimate' do
      it 'sets the note text' 

    end

    context 'without a time estimate' do
      it 'sets the note text' 

    end
  end

  describe '.change_time_spent' do
    # We need a custom noteable in order to the shared examples to be green.
    let(:noteable) do
      mr = create(:merge_request, source_project: project)
      mr.spend_time(duration: 360000, user_id: author.id)
      mr.save!
      mr
    end

    subject do
      described_class.change_time_spent(noteable, project, author)
    end

    it_behaves_like 'a system note' do
      let(:action) { 'time_tracking' }
    end

    context 'when time was added' do
      it 'sets the note text' 

    end

    context 'when time was subtracted' do
      it 'sets the note text' 

    end

    context 'when time was removed' do
      it 'sets the note text' 

    end

    def spend_time!(seconds)
      noteable.spend_time(duration: seconds, user_id: author.id)
      noteable.save!
    end
  end

  describe '.handle_merge_request_wip' do
    context 'adding wip note' do
      let(:noteable) { create(:merge_request, source_project: project, title: 'WIP Lorem ipsum') }

      subject { described_class.handle_merge_request_wip(noteable, project, author) }

      it_behaves_like 'a system note' do
        let(:action) { 'title' }
      end

      it 'sets the note text' 

    end

    context 'removing wip note' do
      let(:noteable) { create(:merge_request, source_project: project, title: 'Lorem ipsum') }

      subject { described_class.handle_merge_request_wip(noteable, project, author) }

      it_behaves_like 'a system note' do
        let(:action) { 'title' }
      end

      it 'sets the note text' 

    end
  end

  describe '.add_merge_request_wip_from_commit' do
    let(:noteable) do
      create(:merge_request, source_project: project, target_project: project)
    end

    subject do
      described_class.add_merge_request_wip_from_commit(
        noteable,
        project,
        author,
        noteable.diff_head_commit
      )
    end

    it_behaves_like 'a system note' do
      let(:action) { 'title' }
    end

    it "posts the 'marked as a Work In Progress from commit' system note" 

  end

  describe '.change_task_status' do
    let(:noteable) { create(:issue, project: project) }
    let(:task)     { double(:task, complete?: true, source: 'task') }

    subject { described_class.change_task_status(noteable, project, author, task) }

    it_behaves_like 'a system note' do
      let(:action) { 'task' }
    end

    it "posts the 'marked the task as complete' system note" 

  end

  describe '.resolve_all_discussions' do
    let(:noteable) { create(:merge_request, source_project: project, target_project: project) }

    subject { described_class.resolve_all_discussions(noteable, project, author) }

    it_behaves_like 'a system note' do
      let(:action) { 'discussion' }
    end

    it 'sets the note text' 

  end

  describe '.diff_discussion_outdated' do
    let(:discussion) { create(:diff_note_on_merge_request, project: project).to_discussion }
    let(:merge_request) { discussion.noteable }
    let(:change_position) { discussion.position }

    def reloaded_merge_request
      MergeRequest.find(merge_request.id)
    end

    subject { described_class.diff_discussion_outdated(discussion, project, author, change_position) }

    it_behaves_like 'a system note' do
      let(:expected_noteable) { discussion.first_note.noteable }
      let(:action)            { 'outdated' }
    end

    context 'when the change_position is valid for the discussion' do
      it 'creates a new note in the discussion' 


      it 'links to the diff in the system note' 

    end

    context 'when the change_position is invalid for the discussion' do
      let(:change_position) { project.commit(sample_commit.id) }

      it 'creates a new note in the discussion' 


      it 'does not create a link' 

    end
  end

  describe '.mark_duplicate_issue' do
    subject { described_class.mark_duplicate_issue(noteable, project, author, canonical_issue) }

    context 'within the same project' do
      let(:canonical_issue) { create(:issue, project: project) }

      it_behaves_like 'a system note' do
        let(:action) { 'duplicate' }
      end

      it { expect(subject.note).to eq "marked this issue as a duplicate of #{canonical_issue.to_reference}" }
    end

    context 'across different projects' do
      let(:other_project)  { create(:project) }
      let(:canonical_issue) { create(:issue, project: other_project) }

      it_behaves_like 'a system note' do
        let(:action) { 'duplicate' }
      end

      it { expect(subject.note).to eq "marked this issue as a duplicate of #{canonical_issue.to_reference(project)}" }
    end
  end

  describe '.mark_canonical_issue_of_duplicate' do
    subject { described_class.mark_canonical_issue_of_duplicate(noteable, project, author, duplicate_issue) }

    context 'within the same project' do
      let(:duplicate_issue) { create(:issue, project: project) }

      it_behaves_like 'a system note' do
        let(:action) { 'duplicate' }
      end

      it { expect(subject.note).to eq "marked #{duplicate_issue.to_reference} as a duplicate of this issue" }
    end

    context 'across different projects' do
      let(:other_project)  { create(:project) }
      let(:duplicate_issue) { create(:issue, project: other_project) }

      it_behaves_like 'a system note' do
        let(:action) { 'duplicate' }
      end

      it { expect(subject.note).to eq "marked #{duplicate_issue.to_reference(project)} as a duplicate of this issue" }
    end
  end

  describe '.discussion_lock' do
    subject { described_class.discussion_lock(noteable, author)  }

    context 'discussion unlocked' do
      it_behaves_like 'a system note' do
        let(:action) { 'unlocked' }
      end

      it 'creates the note text correctly' 

    end

    context 'discussion locked' do
      before do
        noteable.update_attribute(:discussion_locked, true)
      end

      it_behaves_like 'a system note' do
        let(:action) { 'locked' }
      end

      it 'creates the note text correctly' 

    end
  end
end
