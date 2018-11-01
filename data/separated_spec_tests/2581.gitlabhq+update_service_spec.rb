# coding: utf-8
require 'spec_helper'

describe Issues::UpdateService, :mailer do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:user3) { create(:user) }
  let(:project) { create(:project) }
  let(:label) { create(:label, project: project) }
  let(:label2) { create(:label) }

  let(:issue) do
    create(:issue, title: 'Old title',
                   description: "for #{user2.to_reference}",
                   assignee_ids: [user3.id],
                   project: project,
                   author: create(:user))
  end

  before do
    project.add_maintainer(user)
    project.add_developer(user2)
    project.add_developer(user3)
  end

  describe 'execute' do
    def find_note(starting_with)
      issue.notes.find do |note|
        note && note.note.start_with?(starting_with)
      end
    end

    def find_notes(action)
      issue
        .notes
        .joins(:system_note_metadata)
        .where(system_note_metadata: { action: action })
    end

    def update_issue(opts)
      described_class.new(project, user, opts).execute(issue)
    end

    context 'valid params' do
      let(:opts) do
        {
          title: 'New title',
          description: 'Also please fix',
          assignee_ids: [user2.id],
          state_event: 'close',
          label_ids: [label.id],
          due_date: Date.tomorrow,
          discussion_locked: true
        }
      end

      it 'updates the issue with the given params' 


      it 'refreshes the number of open issues when the issue is made confidential', :use_clean_rails_memory_store_caching do
        issue # make sure the issue is created first so our counts are correct.

        expect { update_issue(confidential: true) }
          .to change { project.open_issues_count }.from(1).to(0)
      end

      it 'enqueues ConfidentialIssueWorker when an issue is made confidential' 


      it 'does not enqueue ConfidentialIssueWorker when an issue is made non confidential' 


      it 'updates open issue counter for assignees when issue is reassigned' 


      it 'sorts issues as specified by parameters' 


      context 'when moving issue between issues from different projects', :nested_groups do
        let(:group) { create(:group) }
        let(:subgroup) { create(:group, parent: group) }

        let(:project_1) { create(:project, namespace: group) }
        let(:project_2) { create(:project, namespace: group) }
        let(:project_3) { create(:project, namespace: subgroup) }

        let(:issue_1) { create(:issue, project: project_1) }
        let(:issue_2) { create(:issue, project: project_2) }
        let(:issue_3) { create(:issue, project: project_3) }

        before do
          group.add_developer(user)
        end

        it 'sorts issues as specified by parameters' 

      end

      context 'when current user cannot admin issues in the project' do
        let(:guest) { create(:user) }
        before do
          project.add_guest(guest)
        end

        it 'filters out params that cannot be set without the :admin_issue permission' 

      end

      context 'with background jobs processed' do
        before do
          perform_enqueued_jobs do
            update_issue(opts)
          end
        end

        it 'sends email to user2 about assign of new issue and email to user3 about issue unassignment' 


        it 'creates system note about issue reassign' 


        it 'creates a resource label event' 


        it 'creates system note about title change' 


        it 'creates system note about discussion lock' 

      end
    end

    context 'when description changed' do
      it 'creates system note about description change' 

    end

    context 'when issue turns confidential' do
      let(:opts) do
        {
          title: 'New title',
          description: 'Also please fix',
          assignee_ids: [user2],
          state_event: 'close',
          label_ids: [label.id],
          confidential: true
        }
      end

      it 'creates system note about confidentiality change' 


      it 'executes confidential issue hooks' 


      it 'does not update assignee_id with unauthorized users' 

    end

    context 'todos' do
      let!(:todo) { create(:todo, :assigned, user: user, project: project, target: issue, author: user2) }

      context 'when the title change' do
        before do
          update_issue(title: 'New title')
        end

        it 'marks pending todos as done' 


        it 'does not create any new todos' 

      end

      context 'when the description change' do
        before do
          update_issue(description: "Also please fix #{user2.to_reference} #{user3.to_reference}")
        end

        it 'marks todos as done' 


        it 'creates only 1 new todo' 

      end

      context 'when is reassigned' do
        before do
          update_issue(assignees: [user2])
        end

        it 'marks previous assignee todos as done' 


        it 'creates a todo for new assignee' 

      end

      context 'when a new assignee added' do
        subject { update_issue(assignees: issue.assignees + [user2]) }

        it 'creates only 1 new todo' 


        it 'creates a todo for new assignee' 

      end

      context 'when the milestone change' do
        it 'marks todos as done' 


        it_behaves_like 'system notes for milestones'
      end

      context 'when the labels change' do
        before do
          Timecop.freeze(1.minute.from_now) do
            update_issue(label_ids: [label.id])
          end
        end

        it 'marks todos as done' 


        it 'updates updated_at' 

      end
    end

    context 'when the issue is relabeled' do
      let!(:non_subscriber) { create(:user) }

      let!(:subscriber) do
        create(:user).tap do |u|
          label.toggle_subscription(u, project)
          project.add_developer(u)
        end
      end

      it 'sends notifications for subscribers of newly added labels' 


      context 'when issue has the `label` label' do
        before do
          issue.labels << label
        end

        it 'does not send notifications for existing labels' 


        it 'does not send notifications for removed labels' 

      end
    end

    context 'when issue has tasks' do
      before do
        update_issue(description: "- [ ] Task 1\n- [ ] Task 2")
      end

      it { expect(issue.tasks?).to eq(true) }

      context 'when tasks are marked as completed' do
        before do
          update_issue(description: "- [x] Task 1\n- [X] Task 2")
        end

        it 'creates system note about task status change' 

      end

      context 'when tasks are marked as incomplete' do
        before do
          update_issue(description: "- [x] Task 1\n- [X] Task 2")
          update_issue(description: "- [ ] Task 1\n- [ ] Task 2")
        end

        it 'creates system note about task status change' 

      end

      context 'when tasks position has been modified' do
        before do
          update_issue(description: "- [x] Task 1\n- [X] Task 2")
          update_issue(description: "- [x] Task 1\n- [ ] Task 3\n- [ ] Task 2")
        end

        it 'does not create a system note for the task' 

      end

      context 'when a Task list with a completed item is totally replaced' do
        before do
          update_issue(description: "- [ ] Task 1\n- [X] Task 2")
          update_issue(description: "- [ ] One\n- [ ] Two\n- [ ] Three")
        end

        it 'does not create a system note referencing the position the old item' 


        it 'does not generate a new note at all' 

      end
    end

    context 'updating labels' do
      let(:label3) { create(:label, project: project) }
      let(:result) { described_class.new(project, user, params).execute(issue).reload }

      context 'when add_label_ids and label_ids are passed' do
        let(:params) { { label_ids: [label.id], add_label_ids: [label3.id] } }

        it 'ignores the label_ids parameter' 


        it 'adds the passed labels' 

      end

      context 'when remove_label_ids and label_ids are passed' do
        let(:params) { { label_ids: [], remove_label_ids: [label.id] } }

        before do
          issue.update(labels: [label, label3])
        end

        it 'ignores the label_ids parameter' 


        it 'removes the passed labels' 

      end

      context 'when add_label_ids and remove_label_ids are passed' do
        let(:params) { { add_label_ids: [label3.id], remove_label_ids: [label.id] } }

        before do
          issue.update(labels: [label])
        end

        it 'adds the passed labels' 


        it 'removes the passed labels' 

      end
    end

    context 'updating asssignee_id' do
      it 'does not update assignee when assignee_id is invalid' 


      it 'unassigns assignee when user id is 0' 


      it 'does not update assignee_id when user cannot read issue' 


      context "when issuable feature is private" do
        levels = [Gitlab::VisibilityLevel::INTERNAL, Gitlab::VisibilityLevel::PUBLIC]

        levels.each do |level|
          it "does not update with unauthorized assignee when project is #{Gitlab::VisibilityLevel.level_name(level)}" 

        end
      end
    end

    context 'updating mentions' do
      let(:mentionable) { issue }
      include_examples 'updating mentions', described_class
    end

    context 'duplicate issue' do
      let(:canonical_issue) { create(:issue, project: project) }

      context 'invalid canonical_issue_id' do
        it 'does not call the duplicate service' 

      end

      context 'valid canonical_issue_id' do
        it 'calls the duplicate service with both issues' 

      end
    end

    context 'move issue to another project' do
      let(:target_project) { create(:project) }

      context 'valid project' do
        before do
          target_project.add_maintainer(user)
        end

        it 'calls the move service with the proper issue and project' 

      end
    end

    include_examples 'issuable update service' do
      let(:open_issuable) { issue }
      let(:closed_issuable) { create(:closed_issue, project: project) }
    end
  end
end

