require 'spec_helper'
require 'email_spec'

describe Notify do
  include EmailSpec::Helpers
  include EmailSpec::Matchers
  include RepoHelpers

  include_context 'gitlab email notification'

  set(:user) { create(:user) }
  set(:current_user) { create(:user, email: "current@email.com") }
  set(:assignee) { create(:user, email: 'assignee@example.com', name: 'John Doe') }

  set(:merge_request) do
    create(:merge_request, source_project: project,
                           target_project: project,
                           author: current_user,
                           assignee: assignee,
                           description: 'Awesome description')
  end

  set(:issue) do
    create(:issue, author: current_user,
                   assignees: [assignee],
                   project: project,
                   description: 'My awesome description!')
  end

  def have_referable_subject(referable, reply: false)
    prefix = referable.project ? "#{referable.project.name} | " : ''
    prefix.prepend('Re: ') if reply

    suffix = "#{referable.title} (#{referable.to_reference})"

    have_subject [prefix, suffix].compact.join
  end

  context 'for a project' do
    shared_examples 'an assignee email' do
      it 'is sent to the assignee as the author' 

    end

    context 'for issues' do
      describe 'that are new' do
        subject { described_class.new_issue_email(issue.assignees.first.id, issue.id) }

        it_behaves_like 'an assignee email'
        it_behaves_like 'an email starting a new thread with reply-by-email enabled' do
          let(:model) { issue }
        end
        it_behaves_like 'it should show Gmail Actions View Issue link'
        it_behaves_like 'an unsubscribeable thread'

        it 'has the correct subject and body' 


        it 'contains the description' 


        it 'does not add a reason header' 


        context 'when sent with a reason' do
          subject { described_class.new_issue_email(issue.assignees.first.id, issue.id, NotificationReason::ASSIGNED) }

          it 'includes the reason in a header' 

        end

        context 'when enabled email_author_in_body' do
          before do
            stub_application_setting(email_author_in_body: true)
          end

          it 'contains a link to note author' 

        end
      end

      describe 'that are reassigned' do
        let(:previous_assignee) { create(:user, name: 'Previous Assignee') }
        subject { described_class.reassigned_issue_email(recipient.id, issue.id, [previous_assignee.id], current_user.id) }

        it_behaves_like 'a multiple recipients email'
        it_behaves_like 'an answer to an existing thread with reply-by-email enabled' do
          let(:model) { issue }
        end
        it_behaves_like 'it should show Gmail Actions View Issue link'
        it_behaves_like 'an unsubscribeable thread'

        it 'is sent as the author' 


        it 'has the correct subject and body' 


        context 'when sent with a reason' do
          subject { described_class.reassigned_issue_email(recipient.id, issue.id, [previous_assignee.id], current_user.id, NotificationReason::ASSIGNED) }

          it 'includes the reason in a header' 

        end
      end

      describe 'that have been relabeled' do
        subject { described_class.relabeled_issue_email(recipient.id, issue.id, %w[foo bar baz], current_user.id) }

        it_behaves_like 'a multiple recipients email'
        it_behaves_like 'an answer to an existing thread with reply-by-email enabled' do
          let(:model) { issue }
        end
        it_behaves_like 'it should show Gmail Actions View Issue link'
        it_behaves_like 'a user cannot unsubscribe through footer link'
        it_behaves_like 'an email with a labels subscriptions link in its footer'

        it 'is sent as the author' 


        it 'has the correct subject and body' 


        context 'with a preferred language' do
          before do
            Gitlab::I18n.locale = :es
          end

          after do
            Gitlab::I18n.use_default_locale
          end

          it 'always generates the email using the default language' 

        end
      end

      describe 'status changed' do
        let(:status) { 'closed' }
        subject { described_class.issue_status_changed_email(recipient.id, issue.id, status, current_user.id) }

        it_behaves_like 'an answer to an existing thread with reply-by-email enabled' do
          let(:model) { issue }
        end
        it_behaves_like 'it should show Gmail Actions View Issue link'
        it_behaves_like 'an unsubscribeable thread'

        it 'is sent as the author' 


        it 'has the correct subject and body' 

      end

      describe 'moved to another project' do
        let(:new_issue) { create(:issue) }
        subject { described_class.issue_moved_email(recipient, issue, new_issue, current_user) }

        it_behaves_like 'an answer to an existing thread with reply-by-email enabled' do
          let(:model) { issue }
        end
        it_behaves_like 'it should show Gmail Actions View Issue link'
        it_behaves_like 'an unsubscribeable thread'

        it 'contains description about action taken' 


        it 'has the correct subject and body' 

      end
    end

    context 'for merge requests' do
      describe 'that are new' do
        subject { described_class.new_merge_request_email(merge_request.assignee_id, merge_request.id) }

        it_behaves_like 'an assignee email'
        it_behaves_like 'an email starting a new thread with reply-by-email enabled' do
          let(:model) { merge_request }
        end
        it_behaves_like 'it should show Gmail Actions View Merge request link'
        it_behaves_like 'an unsubscribeable thread'

        it 'has the correct subject and body' 


        it 'contains the description' 


        context 'when sent with a reason' do
          subject { described_class.new_merge_request_email(merge_request.assignee_id, merge_request.id, NotificationReason::ASSIGNED) }

          it 'includes the reason in a header' 

        end

        context 'when enabled email_author_in_body' do
          before do
            stub_application_setting(email_author_in_body: true)
          end

          it 'contains a link to note author' 

        end
      end

      describe 'that are reassigned' do
        let(:previous_assignee) { create(:user, name: 'Previous Assignee') }
        subject { described_class.reassigned_merge_request_email(recipient.id, merge_request.id, previous_assignee.id, current_user.id) }

        it_behaves_like 'a multiple recipients email'
        it_behaves_like 'an answer to an existing thread with reply-by-email enabled' do
          let(:model) { merge_request }
        end
        it_behaves_like 'it should show Gmail Actions View Merge request link'
        it_behaves_like "an unsubscribeable thread"

        it 'is sent as the author' 


        it 'has the correct subject and body' 


        context 'when sent with a reason' do
          subject { described_class.reassigned_merge_request_email(recipient.id, merge_request.id, previous_assignee.id, current_user.id, NotificationReason::ASSIGNED) }

          it 'includes the reason in a header' 


          it 'includes the reason in the footer' 

        end
      end

      describe 'that are new with a description' do
        subject { described_class.new_merge_request_email(merge_request.assignee_id, merge_request.id) }

        it_behaves_like 'it should show Gmail Actions View Merge request link'
        it_behaves_like "an unsubscribeable thread"

        it 'contains the description' 

      end

      describe 'that have been relabeled' do
        subject { described_class.relabeled_merge_request_email(recipient.id, merge_request.id, %w[foo bar baz], current_user.id) }

        it_behaves_like 'a multiple recipients email'
        it_behaves_like 'an answer to an existing thread with reply-by-email enabled' do
          let(:model) { merge_request }
        end
        it_behaves_like 'it should show Gmail Actions View Merge request link'
        it_behaves_like 'a user cannot unsubscribe through footer link'
        it_behaves_like 'an email with a labels subscriptions link in its footer'

        it 'is sent as the author' 


        it 'has the correct subject and body' 

      end

      describe 'status changed' do
        let(:status) { 'reopened' }
        subject { described_class.merge_request_status_email(recipient.id, merge_request.id, status, current_user.id) }

        it_behaves_like 'an answer to an existing thread with reply-by-email enabled' do
          let(:model) { merge_request }
        end
        it_behaves_like 'it should show Gmail Actions View Merge request link'
        it_behaves_like 'an unsubscribeable thread'

        it 'is sent as the author' 


        it 'has the correct subject and body' 

      end

      describe 'that are merged' do
        let(:merge_author) { create(:user) }
        subject { described_class.merged_merge_request_email(recipient.id, merge_request.id, merge_author.id) }

        it_behaves_like 'a multiple recipients email'
        it_behaves_like 'an answer to an existing thread with reply-by-email enabled' do
          let(:model) { merge_request }
        end
        it_behaves_like 'it should show Gmail Actions View Merge request link'
        it_behaves_like 'an unsubscribeable thread'

        it 'is sent as the merge author' 


        it 'has the correct subject and body' 

      end

      describe 'that are unmergeable' do
        set(:merge_request) do
          create(:merge_request, :conflict,
                 source_project: project,
                 target_project: project,
                 author: current_user,
                 assignee: assignee,
                 description: 'Awesome description')
        end

        subject { described_class.merge_request_unmergeable_email(recipient.id, merge_request.id) }

        it_behaves_like 'a multiple recipients email'
        it_behaves_like 'an answer to an existing thread with reply-by-email enabled' do
          let(:model) { merge_request }
        end
        it_behaves_like 'it should show Gmail Actions View Merge request link'
        it_behaves_like 'an unsubscribeable thread'

        it 'is sent as the merge request author' 


        it 'has the correct subject and body' 

      end

      shared_examples 'a push to an existing merge request' do
        let(:push_user) { create(:user) }

        subject do
          described_class.push_to_merge_request_email(recipient.id, merge_request.id, push_user.id, new_commits: merge_request.commits, existing_commits: existing_commits)
        end

        it_behaves_like 'a multiple recipients email'
        it_behaves_like 'an answer to an existing thread with reply-by-email enabled' do
          let(:model) { merge_request }
        end
        it_behaves_like 'it should show Gmail Actions View Merge request link'
        it_behaves_like 'an unsubscribeable thread'

        it 'is sent as the push user' 


        it 'has the correct subject and body' 

      end

      describe 'that have new commits' do
        let(:existing_commits) { [] }

        it_behaves_like 'a push to an existing merge request'
      end

      describe 'that have new commits on top of an existing one' do
        let(:existing_commits) { [merge_request.commits.first] }

        it_behaves_like 'a push to an existing merge request'
      end
    end

    context 'for issue notes' do
      let(:host) { Gitlab.config.gitlab.host }

      context 'in discussion' do
        set(:first_note) { create(:discussion_note_on_issue) }
        set(:second_note) { create(:discussion_note_on_issue, in_reply_to: first_note) }
        set(:third_note) { create(:discussion_note_on_issue, in_reply_to: second_note) }

        subject { described_class.note_issue_email(recipient.id, third_note.id) }

        it 'has In-Reply-To header pointing to previous note in discussion' 


        it 'has References header including the notes and issue of the discussion' 


        it 'has X-GitLab-Discussion-ID header' 

      end

      context 'individual issue comments' do
        set(:note) { create(:note_on_issue) }

        subject { described_class.note_issue_email(recipient.id, note.id) }

        it 'has In-Reply-To header pointing to the issue' 


        it 'has References header including the notes and issue of the discussion' 

      end
    end

    context 'for snippet notes' do
      let(:project_snippet) { create(:project_snippet, project: project) }
      let(:project_snippet_note) { create(:note_on_project_snippet, project: project, noteable: project_snippet) }

      subject { described_class.note_snippet_email(project_snippet_note.author_id, project_snippet_note.id) }

      it_behaves_like 'an answer to an existing thread with reply-by-email enabled' do
        let(:model) { project_snippet }
      end
      it_behaves_like 'a user cannot unsubscribe through footer link'

      it 'has the correct subject and body' 

    end

    describe 'project was moved' do
      subject { described_class.project_was_moved_email(project.id, user.id, "gitlab/gitlab") }

      it_behaves_like 'an email sent from GitLab'
      it_behaves_like 'it should not have Gmail Actions links'
      it_behaves_like "a user cannot unsubscribe through footer link"

      it 'has the correct subject and body' 

    end

    describe 'project access requested' do
      let(:project) do
        create(:project, :public, :access_requestable) do |project|
          project.add_maintainer(project.owner)
        end
      end

      let(:project_member) do
        project.request_access(user)
        project.requesters.find_by(user_id: user.id)
      end
      subject { described_class.member_access_requested_email('project', project_member.id, recipient.notification_email) }

      it_behaves_like 'an email sent from GitLab'
      it_behaves_like 'it should not have Gmail Actions links'
      it_behaves_like "a user cannot unsubscribe through footer link"

      it 'contains all the useful information' 

    end

    describe 'project access denied' do
      let(:project) { create(:project, :public, :access_requestable) }
      let(:project_member) do
        project.request_access(user)
        project.requesters.find_by(user_id: user.id)
      end
      subject { described_class.member_access_denied_email('project', project.id, user.id) }

      it_behaves_like 'an email sent from GitLab'
      it_behaves_like 'it should not have Gmail Actions links'
      it_behaves_like "a user cannot unsubscribe through footer link"

      it 'contains all the useful information' 

    end

    describe 'project access changed' do
      let(:owner) { create(:user, name: "Chang O'Keefe") }
      let(:project) { create(:project, :public, :access_requestable, namespace: owner.namespace) }
      let(:project_member) { create(:project_member, project: project, user: user) }
      subject { described_class.member_access_granted_email('project', project_member.id) }

      it_behaves_like 'an email sent from GitLab'
      it_behaves_like 'it should not have Gmail Actions links'
      it_behaves_like "a user cannot unsubscribe through footer link"

      it 'contains all the useful information' 

    end

    def invite_to_project(project, inviter:)
      create(
        :project_member,
        :developer,
        project: project,
        invite_token: '1234',
        invite_email: 'toto@example.com',
        user: nil,
        created_by: inviter
      )
    end

    describe 'project invitation' do
      let(:maintainer) { create(:user).tap { |u| project.add_maintainer(u) } }
      let(:project_member) { invite_to_project(project, inviter: maintainer) }

      subject { described_class.member_invited_email('project', project_member.id, project_member.invite_token) }

      it_behaves_like 'an email sent from GitLab'
      it_behaves_like 'it should not have Gmail Actions links'
      it_behaves_like "a user cannot unsubscribe through footer link"

      it 'contains all the useful information' 

    end

    describe 'project invitation accepted' do
      let(:invited_user) { create(:user, name: 'invited user') }
      let(:maintainer) { create(:user).tap { |u| project.add_maintainer(u) } }
      let(:project_member) do
        invitee = invite_to_project(project, inviter: maintainer)
        invitee.accept_invite!(invited_user)
        invitee
      end

      subject { described_class.member_invite_accepted_email('project', project_member.id) }

      it_behaves_like 'an email sent from GitLab'
      it_behaves_like 'it should not have Gmail Actions links'
      it_behaves_like "a user cannot unsubscribe through footer link"

      it 'contains all the useful information' 

    end

    describe 'project invitation declined' do
      let(:maintainer) { create(:user).tap { |u| project.add_maintainer(u) } }
      let(:project_member) do
        invitee = invite_to_project(project, inviter: maintainer)
        invitee.decline_invite!
        invitee
      end

      subject { described_class.member_invite_declined_email('project', project.id, project_member.invite_email, maintainer.id) }

      it_behaves_like 'an email sent from GitLab'
      it_behaves_like 'it should not have Gmail Actions links'
      it_behaves_like "a user cannot unsubscribe through footer link"

      it 'contains all the useful information' 

    end

    context 'items that are noteable, the email for a note' do
      let(:note_author) { create(:user, name: 'author_name') }
      let(:note) { create(:note, project: project, author: note_author) }

      before do
        allow(Note).to receive(:find).with(note.id).and_return(note)
      end

      describe 'on a commit' do
        let(:commit) { project.commit }

        before do
          allow(note).to receive(:noteable).and_return(commit)
        end

        subject { described_class.note_commit_email(recipient.id, note.id) }

        it_behaves_like 'a note email'
        it_behaves_like 'an answer to an existing thread with reply-by-email enabled' do
          let(:model) { commit }
        end
        it_behaves_like 'it should show Gmail Actions View Commit link'
        it_behaves_like 'a user cannot unsubscribe through footer link'

        it 'has the correct subject and body' 

      end

      describe 'on a merge request' do
        let(:note_on_merge_request_path) { project_merge_request_path(project, merge_request, anchor: "note_#{note.id}") }

        before do
          allow(note).to receive(:noteable).and_return(merge_request)
        end

        subject { described_class.note_merge_request_email(recipient.id, note.id) }

        it_behaves_like 'a note email'
        it_behaves_like 'an answer to an existing thread with reply-by-email enabled' do
          let(:model) { merge_request }
        end
        it_behaves_like 'it should show Gmail Actions View Merge request link'
        it_behaves_like 'an unsubscribeable thread'

        it 'has the correct subject and body' 

      end

      describe 'on an issue' do
        let(:note_on_issue_path) { project_issue_path(project, issue, anchor: "note_#{note.id}") }

        before do
          allow(note).to receive(:noteable).and_return(issue)
        end

        subject { described_class.note_issue_email(recipient.id, note.id) }

        it_behaves_like 'a note email'
        it_behaves_like 'an answer to an existing thread with reply-by-email enabled' do
          let(:model) { issue }
        end
        it_behaves_like 'it should show Gmail Actions View Issue link'
        it_behaves_like 'an unsubscribeable thread'

        it 'has the correct subject and body' 

      end
    end

    context 'items that are noteable, the email for a discussion note' do
      let(:note_author) { create(:user, name: 'author_name') }

      before do
        allow(Note).to receive(:find).with(note.id).and_return(note)
      end

      shared_examples 'a discussion note email' do |model|
        it_behaves_like 'it should have Gmail Actions links'

        it 'is sent to the given recipient as the author' 


        it 'contains the message from the note' 


        it 'contains an introduction' 


        context 'when a comment on an existing discussion' do
          let!(:second_note) { create(model, author: note_author, noteable: nil, in_reply_to: note) }

          it 'contains an introduction' 

        end
      end

      describe 'on a commit' do
        let(:commit) { project.commit }
        let(:note) { create(:discussion_note_on_commit, commit_id: commit.id, project: project, author: note_author) }

        before do
          allow(note).to receive(:noteable).and_return(commit)
        end

        subject { described_class.note_commit_email(recipient.id, note.id) }

        it_behaves_like 'a discussion note email', :discussion_note_on_commit
        it_behaves_like 'an answer to an existing thread with reply-by-email enabled' do
          let(:model) { commit }
        end
        it_behaves_like 'it should show Gmail Actions View Commit link'
        it_behaves_like 'a user cannot unsubscribe through footer link'

        it 'has the correct subject' 


        it 'contains a link to the commit' 

      end

      describe 'on a merge request' do
        let(:note) { create(:discussion_note_on_merge_request, noteable: merge_request, project: project, author: note_author) }
        let(:note_on_merge_request_path) { project_merge_request_path(project, merge_request, anchor: "note_#{note.id}") }

        before do
          allow(note).to receive(:noteable).and_return(merge_request)
        end

        subject { described_class.note_merge_request_email(recipient.id, note.id) }

        it_behaves_like 'a discussion note email', :discussion_note_on_merge_request
        it_behaves_like 'an answer to an existing thread with reply-by-email enabled' do
          let(:model) { merge_request }
        end
        it_behaves_like 'it should show Gmail Actions View Merge request link'
        it_behaves_like 'an unsubscribeable thread'

        it 'has the correct subject' 


        it 'contains a link to the merge request note' 

      end

      describe 'on an issue' do
        let(:note) { create(:discussion_note_on_issue, noteable: issue, project: project, author: note_author) }
        let(:note_on_issue_path) { project_issue_path(project, issue, anchor: "note_#{note.id}") }

        before do
          allow(note).to receive(:noteable).and_return(issue)
        end

        subject { described_class.note_issue_email(recipient.id, note.id) }

        it_behaves_like 'a discussion note email', :discussion_note_on_issue
        it_behaves_like 'an answer to an existing thread with reply-by-email enabled' do
          let(:model) { issue }
        end
        it_behaves_like 'it should show Gmail Actions View Issue link'
        it_behaves_like 'an unsubscribeable thread'

        it 'has the correct subject' 


        it 'contains a link to the issue note' 

      end
    end

    context 'items that are noteable, the email for a diff discussion note' do
      let(:note_author) { create(:user, name: 'author_name') }

      before do
        allow(Note).to receive(:find).with(note.id).and_return(note)
      end

      shared_examples 'an email for a note on a diff discussion' do  |model|
        let(:note) { create(model, author: note_author) }

        context 'when note is on image' do
          before do
            allow_any_instance_of(DiffDiscussion).to receive(:on_image?).and_return(true)
          end

          it 'does not include diffs with character-level highlighting' 


          it 'ends the intro with a dot' 

        end

        it 'ends the intro with a colon' 


        it 'includes diffs with character-level highlighting' 


        it 'contains a link to the diff file' 


        it_behaves_like 'it should have Gmail Actions links'

        it 'is sent to the given recipient as the author' 


        it 'contains the message from the note' 


        it 'contains an introduction' 


        context 'when a comment on an existing discussion' do
          let!(:second_note) { create(model, author: note_author, noteable: nil, in_reply_to: note) }

          it 'contains an introduction' 

        end
      end

      describe 'on a commit' do
        let(:commit) { project.commit }
        let(:note) { create(:diff_note_on_commit) }

        subject { described_class.note_commit_email(recipient.id, note.id) }

        it_behaves_like 'an email for a note on a diff discussion', :diff_note_on_commit
        it_behaves_like 'it should show Gmail Actions View Commit link'
        it_behaves_like 'a user cannot unsubscribe through footer link'
      end

      describe 'on a merge request' do
        let(:note) { create(:diff_note_on_merge_request) }

        subject { described_class.note_merge_request_email(recipient.id, note.id) }

        it_behaves_like 'an email for a note on a diff discussion', :diff_note_on_merge_request
        it_behaves_like 'it should show Gmail Actions View Merge request link'
        it_behaves_like 'an unsubscribeable thread'
      end
    end
  end

  context 'for a group' do
    set(:group) { create(:group) }

    describe 'group access requested' do
      let(:group) { create(:group, :public, :access_requestable) }
      let(:group_member) do
        group.request_access(user)
        group.requesters.find_by(user_id: user.id)
      end
      subject { described_class.member_access_requested_email('group', group_member.id, recipient.notification_email) }

      it_behaves_like 'an email sent from GitLab'
      it_behaves_like 'it should not have Gmail Actions links'
      it_behaves_like "a user cannot unsubscribe through footer link"

      it 'contains all the useful information' 

    end

    describe 'group access denied' do
      let(:group_member) do
        group.request_access(user)
        group.requesters.find_by(user_id: user.id)
      end
      subject { described_class.member_access_denied_email('group', group.id, user.id) }

      it_behaves_like 'an email sent from GitLab'
      it_behaves_like 'it should not have Gmail Actions links'
      it_behaves_like "a user cannot unsubscribe through footer link"

      it 'contains all the useful information' 

    end

    describe 'group access changed' do
      let(:group_member) { create(:group_member, group: group, user: user) }

      subject { described_class.member_access_granted_email('group', group_member.id) }

      it_behaves_like 'an email sent from GitLab'
      it_behaves_like 'it should not have Gmail Actions links'
      it_behaves_like "a user cannot unsubscribe through footer link"

      it 'contains all the useful information' 

    end

    def invite_to_group(group, inviter:)
      create(
        :group_member,
        :developer,
        group: group,
        invite_token: '1234',
        invite_email: 'toto@example.com',
        user: nil,
        created_by: inviter
      )
    end

    describe 'group invitation' do
      let(:owner) { create(:user).tap { |u| group.add_user(u, Gitlab::Access::OWNER) } }
      let(:group_member) { invite_to_group(group, inviter: owner) }

      subject { described_class.member_invited_email('group', group_member.id, group_member.invite_token) }

      it_behaves_like 'an email sent from GitLab'
      it_behaves_like 'it should not have Gmail Actions links'
      it_behaves_like "a user cannot unsubscribe through footer link"

      it 'contains all the useful information' 

    end

    describe 'group invitation accepted' do
      let(:invited_user) { create(:user, name: 'invited user') }
      let(:owner) { create(:user).tap { |u| group.add_user(u, Gitlab::Access::OWNER) } }
      let(:group_member) do
        invitee = invite_to_group(group, inviter: owner)
        invitee.accept_invite!(invited_user)
        invitee
      end

      subject { described_class.member_invite_accepted_email('group', group_member.id) }

      it_behaves_like 'an email sent from GitLab'
      it_behaves_like 'it should not have Gmail Actions links'
      it_behaves_like "a user cannot unsubscribe through footer link"

      it 'contains all the useful information' 

    end

    describe 'group invitation declined' do
      let(:owner) { create(:user).tap { |u| group.add_user(u, Gitlab::Access::OWNER) } }
      let(:group_member) do
        invitee = invite_to_group(group, inviter: owner)
        invitee.decline_invite!
        invitee
      end

      subject { described_class.member_invite_declined_email('group', group.id, group_member.invite_email, owner.id) }

      it_behaves_like 'an email sent from GitLab'
      it_behaves_like 'it should not have Gmail Actions links'
      it_behaves_like "a user cannot unsubscribe through footer link"

      it 'contains all the useful information' 

    end
  end

  describe 'confirmation if email changed' do
    let(:example_site_path) { root_path }
    let(:user) { create(:user, email: 'old-email@mail.com') }

    before do
      stub_config_setting(email_subject_suffix: 'A Nice Suffix')
      perform_enqueued_jobs do
        user.email = "new-email@mail.com"
        user.save
      end
    end

    subject { ActionMailer::Base.deliveries.last }

    it_behaves_like 'an email sent from GitLab'
    it_behaves_like "a user cannot unsubscribe through footer link"

    it 'is sent to the new user' 


    it 'has the correct subject and body' 

  end

  describe 'email on push for a created branch' do
    let(:example_site_path) { root_path }
    let(:tree_path) { project_tree_path(project, "empty-branch") }

    subject { described_class.repository_push_email(project.id, author_id: user.id, ref: 'refs/heads/empty-branch', action: :create) }

    it_behaves_like 'it should not have Gmail Actions links'
    it_behaves_like 'a user cannot unsubscribe through footer link'
    it_behaves_like 'an email with X-GitLab headers containing project details'
    it_behaves_like 'an email that contains a header with author username'

    it 'is sent as the author' 


    it 'has the correct subject and body' 

  end

  describe 'email on push for a created tag' do
    let(:example_site_path) { root_path }
    let(:tree_path) { project_tree_path(project, "v1.0") }

    subject { described_class.repository_push_email(project.id, author_id: user.id, ref: 'refs/tags/v1.0', action: :create) }

    it_behaves_like 'it should not have Gmail Actions links'
    it_behaves_like "a user cannot unsubscribe through footer link"
    it_behaves_like 'an email with X-GitLab headers containing project details'
    it_behaves_like 'an email that contains a header with author username'

    it 'is sent as the author' 


    it 'has the correct subject and body' 

  end

  describe 'email on push for a deleted branch' do
    let(:example_site_path) { root_path }

    subject { described_class.repository_push_email(project.id, author_id: user.id, ref: 'refs/heads/master', action: :delete) }

    it_behaves_like 'it should not have Gmail Actions links'
    it_behaves_like 'a user cannot unsubscribe through footer link'
    it_behaves_like 'an email with X-GitLab headers containing project details'
    it_behaves_like 'an email that contains a header with author username'

    it 'is sent as the author' 


    it 'has the correct subject' 

  end

  describe 'email on push for a deleted tag' do
    let(:example_site_path) { root_path }

    subject { described_class.repository_push_email(project.id, author_id: user.id, ref: 'refs/tags/v1.0', action: :delete) }

    it_behaves_like 'it should not have Gmail Actions links'
    it_behaves_like 'a user cannot unsubscribe through footer link'
    it_behaves_like 'an email with X-GitLab headers containing project details'
    it_behaves_like 'an email that contains a header with author username'

    it 'is sent as the author' 


    it 'has the correct subject' 

  end

  describe 'email on push with multiple commits' do
    let(:example_site_path) { root_path }
    let(:raw_compare) { Gitlab::Git::Compare.new(project.repository.raw_repository, sample_image_commit.id, sample_commit.id) }
    let(:compare) { Compare.decorate(raw_compare, project) }
    let(:commits) { compare.commits }
    let(:diff_path) { project_compare_path(project, from: Commit.new(compare.base, project), to: Commit.new(compare.head, project)) }
    let(:send_from_committer_email) { false }
    let(:diff_refs) { Gitlab::Diff::DiffRefs.new(base_sha: project.merge_base_commit(sample_image_commit.id, sample_commit.id).id, head_sha: sample_commit.id) }

    subject { described_class.repository_push_email(project.id, author_id: user.id, ref: 'refs/heads/master', action: :push, compare: compare, reverse_compare: false, diff_refs: diff_refs, send_from_committer_email: send_from_committer_email) }

    it_behaves_like 'it should not have Gmail Actions links'
    it_behaves_like 'a user cannot unsubscribe through footer link'
    it_behaves_like 'an email with X-GitLab headers containing project details'
    it_behaves_like 'an email that contains a header with author username'

    it 'is sent as the author' 


    it 'has the correct subject and body' 


    context "when set to send from committer email if domain matches" do
      let(:send_from_committer_email) { true }

      before do
        allow(Gitlab.config.gitlab).to receive(:host).and_return("gitlab.corp.company.com")
      end

      context "when the committer email domain is within the GitLab domain" do
        before do
          user.update_attribute(:email, "user@company.com")
          user.confirm
        end

        it "is sent from the committer email" 

      end

      context "when the committer email domain is not completely within the GitLab domain" do
        before do
          user.update_attribute(:email, "user@something.company.com")
          user.confirm
        end

        it "is sent from the default email" 

      end

      context "when the committer email domain is outside the GitLab domain" do
        before do
          user.update_attribute(:email, "user@mpany.com")
          user.confirm
        end

        it "is sent from the default email" 

      end
    end
  end

  describe 'email on push with a single commit' do
    let(:example_site_path) { root_path }
    let(:raw_compare) { Gitlab::Git::Compare.new(project.repository.raw_repository, sample_commit.parent_id, sample_commit.id) }
    let(:compare) { Compare.decorate(raw_compare, project) }
    let(:commits) { compare.commits }
    let(:diff_path) { project_commit_path(project, commits.first) }
    let(:diff_refs) { Gitlab::Diff::DiffRefs.new(base_sha: project.merge_base_commit(sample_image_commit.id, sample_commit.id).id, head_sha: sample_commit.id) }

    subject { described_class.repository_push_email(project.id, author_id: user.id, ref: 'refs/heads/master', action: :push, compare: compare, diff_refs: diff_refs) }

    it_behaves_like 'it should show Gmail Actions View Commit link'
    it_behaves_like 'a user cannot unsubscribe through footer link'
    it_behaves_like 'an email with X-GitLab headers containing project details'
    it_behaves_like 'an email that contains a header with author username'

    it 'is sent as the author' 


    it 'has the correct subject and body' 

  end

  describe 'HTML emails setting' do
    let(:multipart_mail) { described_class.project_was_moved_email(project.id, user.id, "gitlab/gitlab") }

    context 'when disabled' do
      it 'only sends the text template' 

    end

    context 'when enabled' do
      it 'sends a multipart message' 

    end

    matcher :have_part_with do |expected|
      match do |actual|
        actual.body.parts.any? { |part| part.content_type.try(:match, /#{expected}/) }
      end
    end
  end

  context 'for personal snippet notes' do
    let(:personal_snippet) { create(:personal_snippet) }
    let(:personal_snippet_note) { create(:note_on_personal_snippet, noteable: personal_snippet) }

    subject { described_class.note_personal_snippet_email(personal_snippet_note.author_id, personal_snippet_note.id) }

    it_behaves_like 'a user cannot unsubscribe through footer link'

    it 'has the correct subject and body' 

  end
end

