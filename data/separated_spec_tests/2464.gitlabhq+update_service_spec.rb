require 'spec_helper'

describe MergeRequests::UpdateService, :mailer do
  include ProjectForksHelper

  let(:project) { create(:project, :repository) }
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:user3) { create(:user) }
  let(:label) { create(:label, project: project) }
  let(:label2) { create(:label) }

  let(:merge_request) do
    create(:merge_request, :simple, title: 'Old title',
                                    description: "FYI #{user2.to_reference}",
                                    assignee_id: user3.id,
                                    source_project: project,
                                    author: create(:user))
  end

  before do
    project.add_maintainer(user)
    project.add_developer(user2)
    project.add_developer(user3)
  end

  describe 'execute' do
    def find_note(starting_with)
      @merge_request.notes.find do |note|
        note && note.note.start_with?(starting_with)
      end
    end

    def find_notes(action)
      @merge_request
        .notes
        .joins(:system_note_metadata)
        .where(system_note_metadata: { action: action })
    end

    def update_merge_request(opts)
      @merge_request = MergeRequests::UpdateService.new(project, user, opts).execute(merge_request)
      @merge_request.reload
    end

    context 'valid params' do
      let(:opts) do
        {
          title: 'New title',
          description: 'Also please fix',
          assignee_id: user2.id,
          state_event: 'close',
          label_ids: [label.id],
          target_branch: 'target',
          force_remove_source_branch: '1',
          discussion_locked: true
        }
      end

      let(:service) { described_class.new(project, user, opts) }

      before do
        allow(service).to receive(:execute_hooks)

        perform_enqueued_jobs do
          @merge_request = service.execute(merge_request)
          @merge_request.reload
        end
      end

      it 'matches base expectations' 


      it 'executes hooks with update action' 


      it 'sends email to user2 about assign of new merge request and email to user3 about merge request unassignment' 


      it 'creates system note about merge_request reassign' 


      it 'creates a resource label event' 


      it 'creates system note about title change' 


      it 'creates system note about description change' 


      it 'creates system note about branch change' 


      it 'creates system note about discussion lock' 


      context 'when not including source branch removal options' do
        before do
          opts.delete(:force_remove_source_branch)
        end

        it 'maintains the original options' 

      end
    end

    context 'merge' do
      let(:opts) do
        {
          merge: merge_request.diff_head_sha
        }
      end

      let(:service) { described_class.new(project, user, opts) }

      context 'without pipeline' do
        before do
          merge_request.merge_error = 'Error'

          perform_enqueued_jobs do
            service.execute(merge_request)
            @merge_request = MergeRequest.find(merge_request.id)
          end
        end

        it 'merges the MR' 

      end

      context 'with finished pipeline' do
        before do
          create(:ci_pipeline_with_one_job,
            project: project,
            ref:     merge_request.source_branch,
            sha:     merge_request.diff_head_sha,
            status:  :success)

          perform_enqueued_jobs do
            @merge_request = service.execute(merge_request)
            @merge_request = MergeRequest.find(merge_request.id)
          end
        end

        it 'merges the MR' 

      end

      context 'with active pipeline' do
        before do
          service_mock = double
          create(
            :ci_pipeline_with_one_job,
            project: project,
            ref: merge_request.source_branch,
            sha: merge_request.diff_head_sha,
            head_pipeline_of: merge_request
          )

          expect(MergeRequests::MergeWhenPipelineSucceedsService).to receive(:new).with(project, user)
            .and_return(service_mock)
          expect(service_mock).to receive(:execute).with(merge_request)
        end

        it { service.execute(merge_request) }
      end

      context 'with a non-authorised user' do
        let(:visitor) { create(:user) }
        let(:service) { described_class.new(project, visitor, opts) }

        before do
          merge_request.update_attribute(:merge_error, 'Error')

          perform_enqueued_jobs do
            @merge_request = service.execute(merge_request)
            @merge_request = MergeRequest.find(merge_request.id)
          end
        end

        it 'does not merge the MR' 

      end

      context 'MR can not be merged when note sha != MR sha' do
        let(:opts) do
          {
            merge: 'other_commit'
          }
        end

        before do
          perform_enqueued_jobs do
            @merge_request = service.execute(merge_request)
            @merge_request = MergeRequest.find(merge_request.id)
          end
        end

        it { expect(@merge_request.state).to eq('opened') }
      end
    end

    context 'todos' do
      let!(:pending_todo) { create(:todo, :assigned, user: user, project: project, target: merge_request, author: user2) }

      context 'when the title change' do
        before do
          update_merge_request({ title: 'New title' })
        end

        it 'marks pending todos as done' 


        it 'does not create any new todos' 

      end

      context 'when the description change' do
        before do
          update_merge_request({ description: "Also please fix #{user2.to_reference} #{user3.to_reference}" })
        end

        it 'marks pending todos as done' 


        it 'creates only 1 new todo' 

      end

      context 'when is reassigned' do
        before do
          update_merge_request({ assignee: user2 })
        end

        it 'marks previous assignee pending todos as done' 


        it 'creates a pending todo for new assignee' 

      end

      context 'when the milestone change' do
        it 'marks pending todos as done' 


        it_behaves_like 'system notes for milestones'
      end

      context 'when the labels change' do
        before do
          Timecop.freeze(1.minute.from_now) do
            update_merge_request({ label_ids: [label.id] })
          end
        end

        it 'marks pending todos as done' 


        it 'updates updated_at' 

      end

      context 'when the assignee changes' do
        it 'updates open merge request counter for assignees when merge request is reassigned' 

      end

      context 'when the target branch change' do
        before do
          update_merge_request({ target_branch: 'target' })
        end

        it 'marks pending todos as done' 

      end
    end

    context 'when the issue is relabeled' do
      let!(:non_subscriber) { create(:user) }
      let!(:subscriber) { create(:user) { |u| label.toggle_subscription(u, project) } }

      before do
        project.add_developer(non_subscriber)
        project.add_developer(subscriber)
      end

      it 'sends notifications for subscribers of newly added labels' 


      context 'when issue has the `label` label' do
        before do
          merge_request.labels << label
        end

        it 'does not send notifications for existing labels' 


        it 'does not send notifications for removed labels' 

      end
    end

    context 'updating mentions' do
      let(:mentionable) { merge_request }
      include_examples 'updating mentions', described_class
    end

    context 'when MergeRequest has tasks' do
      before do
        update_merge_request({ description: "- [ ] Task 1\n- [ ] Task 2" })
      end

      it { expect(@merge_request.tasks?).to eq(true) }

      context 'when tasks are marked as completed' do
        before do
          update_merge_request({ description: "- [x] Task 1\n- [X] Task 2" })
        end

        it 'creates system note about task status change' 

      end

      context 'when tasks are marked as incomplete' do
        before do
          update_merge_request({ description: "- [x] Task 1\n- [X] Task 2" })
          update_merge_request({ description: "- [ ] Task 1\n- [ ] Task 2" })
        end

        it 'creates system note about task status change' 

      end
    end

    context 'while saving references to issues that the updated merge request closes' do
      let(:first_issue) { create(:issue, project: project) }
      let(:second_issue) { create(:issue, project: project) }

      it 'creates a `MergeRequestsClosingIssues` record for each issue' 


      it 'removes `MergeRequestsClosingIssues` records when issues are not closed anymore' 

    end

    context 'updating asssignee_id' do
      it 'does not update assignee when assignee_id is invalid' 


      it 'unassigns assignee when user id is 0' 


      it 'saves assignee when user id is valid' 


      it 'does not update assignee_id when user cannot read issue' 


      context "when issuable feature is private" do
        levels = [Gitlab::VisibilityLevel::INTERNAL, Gitlab::VisibilityLevel::PUBLIC]

        levels.each do |level|
          it "does not update with unauthorized assignee when project is #{Gitlab::VisibilityLevel.level_name(level)}" 

        end
      end
    end

    include_examples 'issuable update service' do
      let(:open_issuable) { merge_request }
      let(:closed_issuable) { create(:closed_merge_request, source_project: project) }
    end

    context 'setting `allow_collaboration`' do
      let(:target_project) { create(:project, :public) }
      let(:source_project) { fork_project(target_project) }
      let(:user) { create(:user) }
      let(:merge_request) do
        create(:merge_request,
               source_project: source_project,
               source_branch: 'fixes',
               target_project: target_project)
      end

      before do
        allow(ProtectedBranch).to receive(:protected?).with(source_project, 'fixes') { false }
      end

      it 'does not allow a maintainer of the target project to set `allow_collaboration`' 


      it 'is allowed by a user that can push to the source and can update the merge request' 

    end
  end
end

