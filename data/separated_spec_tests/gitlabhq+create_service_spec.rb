require 'spec_helper'

describe Issues::CreateService do
  let(:project) { create(:project) }
  let(:user) { create(:user) }

  describe '#execute' do
    let(:issue) { described_class.new(project, user, opts).execute }
    let(:assignee) { create(:user) }
    let(:milestone) { create(:milestone, project: project) }

    context 'when params are valid' do
      let(:labels) { create_pair(:label, project: project) }

      before do
        project.add_maintainer(user)
        project.add_maintainer(assignee)
      end

      let(:opts) do
        { title: 'Awesome issue',
          description: 'please fix',
          assignee_ids: [assignee.id],
          label_ids: labels.map(&:id),
          milestone_id: milestone.id,
          due_date: Date.tomorrow }
      end

      it 'creates the issue with the given params' 


      it 'refreshes the number of open issues', :use_clean_rails_memory_store_caching do
        expect { issue }.to change { project.open_issues_count }.from(0).to(1)
      end

      context 'when current user cannot admin issues in the project' do
        let(:guest) { create(:user) }

        before do
          project.add_guest(guest)
        end

        it 'filters out params that cannot be set without the :admin_issue permission' 

      end

      it 'creates a pending todo for new assignee' 


      context 'when label belongs to project group' do
        let(:group) { create(:group) }
        let(:group_labels) { create_pair(:group_label, group: group) }

        let(:opts) do
          {
            title: 'Title',
            description: 'Description',
            label_ids: group_labels.map(&:id)
          }
        end

        before do
          project.update(group: group)
        end

        it 'assigns group labels' 

      end

      context 'when label belongs to different project' do
        let(:label) { create(:label) }

        let(:opts) do
          { title: 'Title',
            description: 'Description',
            label_ids: [label.id] }
        end

        it 'does not assign label' 

      end

      context 'when milestone belongs to different project' do
        let(:milestone) { create(:milestone) }

        let(:opts) do
          { title: 'Title',
            description: 'Description',
            milestone_id: milestone.id }
        end

        it 'does not assign milestone' 

      end

      context 'when assignee is set' do
        let(:opts) do
          { title: 'Title',
            description: 'Description',
            assignees: [assignee] }
        end

        it 'invalidates open issues counter for assignees when issue is assigned' 

      end

      it 'executes issue hooks when issue is not confidential' 


      it 'executes confidential issue hooks when issue is confidential' 

    end

    context 'issue create service' do
      context 'assignees' do
        before do
          project.add_maintainer(user)
        end

        it 'removes assignee when user id is invalid' 


        it 'removes assignee when user id is 0' 


        it 'saves assignee when user id is valid' 


        context "when issuable feature is private" do
          before do
            project.project_feature.update(issues_access_level: ProjectFeature::PRIVATE,
                                           merge_requests_access_level: ProjectFeature::PRIVATE)
          end

          levels = [Gitlab::VisibilityLevel::INTERNAL, Gitlab::VisibilityLevel::PUBLIC]

          levels.each do |level|
            it "removes not authorized assignee when project is #{Gitlab::VisibilityLevel.level_name(level)}" 

          end
        end
      end
    end

    it_behaves_like 'new issuable record that supports quick actions'

    context 'Quick actions' do
      context 'with assignee and milestone in params and command' do
        let(:opts) do
          {
            assignee_ids: [create(:user).id],
            milestone_id: 1,
            title: 'Title',
            description: %(/assign @#{assignee.username}\n/milestone %"#{milestone.name}")
          }
        end

        before do
          project.add_maintainer(user)
          project.add_maintainer(assignee)
        end

        it 'assigns and sets milestone to issuable from command' 

      end
    end

    context 'resolving discussions' do
      let(:discussion) { create(:diff_note_on_merge_request).to_discussion }
      let(:merge_request) { discussion.noteable }
      let(:project) { merge_request.source_project }

      before do
        project.add_maintainer(user)
      end

      describe 'for a single discussion' do
        let(:opts) { { discussion_to_resolve: discussion.id, merge_request_to_resolve_discussions_of: merge_request.iid } }

        it 'resolves the discussion' 


        it 'added a system note to the discussion' 


        it 'assigns the title and description for the issue' 


        it 'can set nil explicitly to the title and description' 

      end

      describe 'for a merge request' do
        let(:opts) { { merge_request_to_resolve_discussions_of: merge_request.iid } }

        it 'resolves the discussion' 


        it 'added a system note to the discussion' 


        it 'assigns the title and description for the issue' 


        it 'can set nil explicitly to the title and description' 

      end
    end

    context 'checking spam' do
      let(:opts) do
        {
          title: 'Awesome issue',
          description: 'please fix',
          request: double(:request, env: {})
        }
      end

      before do
        allow_any_instance_of(SpamService).to receive(:check_for_spam?).and_return(true)
      end

      context 'when recaptcha was verified' do
        let(:log_user)  { user }
        let(:spam_logs) { create_list(:spam_log, 2, user: log_user, title: 'Awesome issue') }

        before do
          opts[:recaptcha_verified] = true
          opts[:spam_log_id]        = spam_logs.last.id

          expect(AkismetService).not_to receive(:new)
        end

        it 'does no mark an issue as a spam ' 


        it 'an issue is valid ' 


        it 'does not assign a spam_log to an issue' 


        it 'marks related spam_log as recaptcha_verified' 


        context 'when spam log does not belong to a user' do
          let(:log_user) { create(:user) }

          it 'does not mark spam_log as recaptcha_verified' 

        end
      end

      context 'when recaptcha was not verified' do
        context 'when akismet detects spam' do
          before do
            allow_any_instance_of(AkismetService).to receive(:spam?).and_return(true)
          end

          it 'marks an issue as a spam ' 


          it 'an issue is not valid ' 


          it 'creates a new spam_log' 


          it 'assigns a spam_log to an issue' 

        end

        context 'when akismet does not detect spam' do
          before do
            allow_any_instance_of(AkismetService).to receive(:spam?).and_return(false)
          end

          it 'does not mark an issue as a spam ' 


          it 'an issue is valid ' 


          it 'does not assign a spam_log to an issue' 

        end
      end
    end
  end
end

