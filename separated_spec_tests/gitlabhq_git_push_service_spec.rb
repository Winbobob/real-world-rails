require 'spec_helper'

describe GitPushService, services: true do
  include RepoHelpers

  let(:user)     { create(:user) }
  let(:project)  { create(:project, :repository) }
  let(:blankrev) { Gitlab::Git::BLANK_SHA }
  let(:oldrev)   { sample_commit.parent_id }
  let(:newrev)   { sample_commit.id }
  let(:ref)      { 'refs/heads/master' }

  before do
    project.add_master(user)
  end

  describe 'with remote mirrors' do
    let(:project)  { create(:project, :repository, :remote_mirror) }

    subject do
      described_class.new(project, user, oldrev: oldrev, newrev: newrev, ref: ref)
    end

    context 'when remote mirror feature is enabled' do
      it 'fails stuck remote mirrors' 


      it 'updates remote mirrors' 

    end

    context 'when remote mirror feature is disabled' do
      before do
        stub_application_setting(mirror_available: false)
      end

      context 'with remote mirrors global setting overridden' do
        before do
          project.remote_mirror_available_overridden = true
        end

        it 'fails stuck remote mirrors' 


        it 'updates remote mirrors' 

      end

      context 'without remote mirrors global setting overridden' do
        before do
          project.remote_mirror_available_overridden = false
        end

        it 'does not fails stuck remote mirrors' 


        it 'does not updates remote mirrors' 

      end
    end
  end

  describe 'Push branches' do
    subject do
      execute_service(project, user, oldrev, newrev, ref)
    end

    context 'new branch' do
      let(:oldrev) { blankrev }

      it { is_expected.to be_truthy }

      it 'calls the after_push_commit hook' 


      it 'calls the after_create_branch hook' 

    end

    context 'existing branch' do
      it { is_expected.to be_truthy }

      it 'calls the after_push_commit hook' 

    end

    context 'rm branch' do
      let(:newrev) { blankrev }

      it { is_expected.to be_truthy }

      it 'calls the after_push_commit hook' 


      it 'calls the after_remove_branch hook' 

    end
  end

  describe "Git Push Data" do
    let(:commit) { project.commit(newrev) }

    subject { push_data_from_service(project, user, oldrev, newrev, ref) }

    it { is_expected.to include(object_kind: 'push') }
    it { is_expected.to include(before: oldrev) }
    it { is_expected.to include(after: newrev) }
    it { is_expected.to include(ref: ref) }
    it { is_expected.to include(user_id: user.id) }
    it { is_expected.to include(user_name: user.name) }
    it { is_expected.to include(project_id: project.id) }

    context "with repository data" do
      subject { push_data_from_service(project, user, oldrev, newrev, ref)[:repository] }

      it { is_expected.to include(name: project.name) }
      it { is_expected.to include(url: project.url_to_repo) }
      it { is_expected.to include(description: project.description) }
      it { is_expected.to include(homepage: project.web_url) }
    end

    context "with commits" do
      subject { push_data_from_service(project, user, oldrev, newrev, ref)[:commits] }

      it { is_expected.to be_an(Array) }
      it 'has 1 element' 


      context "the commit" do
        subject { push_data_from_service(project, user, oldrev, newrev, ref)[:commits].first }

        it { is_expected.to include(id: commit.id) }
        it { is_expected.to include(message: commit.safe_message) }
        it { expect(subject[:timestamp].in_time_zone).to eq(commit.date.in_time_zone) }
        it do
          is_expected.to include(
            url: [
              Gitlab.config.gitlab.url,
              project.namespace.to_param,
              project.to_param,
              'commit',
              commit.id
            ].join('/')
          )
        end

        context "with a author" do
          subject { push_data_from_service(project, user, oldrev, newrev, ref)[:commits].first[:author] }

          it { is_expected.to include(name: commit.author_name) }
          it { is_expected.to include(email: commit.author_email) }
        end
      end
    end
  end

  describe "Pipelines" do
    subject { execute_service(project, user, oldrev, newrev, ref) }

    before do
      stub_ci_pipeline_to_return_yaml_file
    end

    it "creates a new pipeline" 

  end

  describe "Push Event" do
    let!(:push_data) { push_data_from_service(project, user, oldrev, newrev, ref) }
    let(:event) { Event.find_by_action(Event::PUSHED) }

    it { expect(event).to be_an_instance_of(PushEvent) }
    it { expect(event.project).to eq(project) }
    it { expect(event.action).to eq(Event::PUSHED) }
    it { expect(event.push_event_payload).to be_an_instance_of(PushEventPayload) }
    it { expect(event.push_event_payload.commit_from).to eq(oldrev) }
    it { expect(event.push_event_payload.commit_to).to eq(newrev) }
    it { expect(event.push_event_payload.ref).to eq('master') }

    context "Updates merge requests" do
      it "when pushing a new branch for the first time" 

    end

    context "Sends System Push data" do
      it "when pushing on a branch" 

    end
  end

  describe "Updates git attributes" do
    context "for default branch" do
      it "calls the copy attributes method for the first push to the default branch" 


      it "calls the copy attributes method for changes to the default branch" 

    end

    context "for non-default branch" do
      before do
        # Make sure the "default" branch is different
        allow(project).to receive(:default_branch).and_return('not-master')
      end

      it "does not call copy attributes method" 

    end
  end

  describe "Webhooks" do
    context "execute webhooks" do
      it "when pushing a branch for the first time" 


      it "when pushing a branch for the first time with default branch protection disabled" 


      it "when pushing a branch for the first time with default branch protection set to 'developers can push'" 


      it "when pushing a branch for the first time with an existing branch permission configured" 


      it "when pushing a branch for the first time with default branch protection set to 'developers can merge'" 


      it "when pushing new commits to existing branch" 

    end
  end

  describe "cross-reference notes" do
    let(:issue) { create :issue, project: project }
    let(:commit_author) { create :user }
    let(:commit) { project.commit }

    before do
      project.add_developer(commit_author)
      project.add_developer(user)

      allow(commit).to receive_messages(
        safe_message: "this commit \n mentions #{issue.to_reference}",
        references: [issue],
        author_name: commit_author.name,
        author_email: commit_author.email
      )

      allow_any_instance_of(ProcessCommitWorker).to receive(:build_commit)
        .and_return(commit)

      allow(project.repository).to receive(:commits_between).and_return([commit])
    end

    it "creates a note if a pushed commit mentions an issue" 


    it "only creates a cross-reference note if one doesn't already exist" 


    it "defaults to the pushing user if the commit's author is not known" 


    it "finds references in the first push to a non-default branch" 

  end

  describe "issue metrics" do
    let(:issue) { create :issue, project: project }
    let(:commit_author) { create :user }
    let(:commit) { project.commit }
    let(:commit_time) { Time.now }

    before do
      project.add_developer(commit_author)
      project.add_developer(user)

      allow(commit).to receive_messages(
        safe_message: "this commit \n mentions #{issue.to_reference}",
        references: [issue],
        author_name: commit_author.name,
        author_email: commit_author.email,
        committed_date: commit_time
      )

      allow_any_instance_of(ProcessCommitWorker).to receive(:build_commit)
        .and_return(commit)

      allow(project.repository).to receive(:commits_between).and_return([commit])
    end

    context "while saving the 'first_mentioned_in_commit_at' metric for an issue" do
      it 'sets the metric for referenced issues' 


      it 'does not set the metric for non-referenced issues' 

    end
  end

  describe "closing issues from pushed commits containing a closing reference" do
    let(:issue) { create :issue, project: project }
    let(:other_issue) { create :issue, project: project }
    let(:commit_author) { create :user }
    let(:closing_commit) { project.commit }

    before do
      allow(closing_commit).to receive_messages(
        issue_closing_regex: /^([Cc]loses|[Ff]ixes) #\d+/,
        safe_message: "this is some work.\n\ncloses ##{issue.iid}",
        author_name: commit_author.name,
        author_email: commit_author.email
      )

      allow(project.repository).to receive(:commits_between)
        .and_return([closing_commit])

      allow_any_instance_of(ProcessCommitWorker).to receive(:build_commit)
        .and_return(closing_commit)

      project.add_master(commit_author)
    end

    context "to default branches" do
      it "closes issues" 


      it "adds a note indicating that the issue is now closed" 


      it "doesn't create additional cross-reference notes" 

    end

    context "to non-default branches" do
      before do
        # Make sure the "default" branch is different
        allow(project).to receive(:default_branch).and_return('not-master')
      end

      it "creates cross-reference notes" 


      it "doesn't close issues" 

    end

    context "for jira issue tracker" do
      include JiraServiceHelper

      let(:jira_tracker) { project.create_jira_service if project.jira_service.nil? }

      before do
        # project.create_jira_service doesn't seem to invalidate the cache here
        project.has_external_issue_tracker = true
        jira_service_settings
        stub_jira_urls("JIRA-1")

        allow(closing_commit).to receive_messages({
          issue_closing_regex: Regexp.new(Gitlab.config.gitlab.issue_closing_pattern),
          safe_message: message,
          author_name: commit_author.name,
          author_email: commit_author.email
        })

        allow(JIRA::Resource::Remotelink).to receive(:all).and_return([])

        allow(project.repository).to receive_messages(commits_between: [closing_commit])
      end

      after do
        jira_tracker.destroy!
      end

      context "mentioning an issue" do
        let(:message) { "this is some work.\n\nrelated to JIRA-1" }

        it "initiates one api call to jira server to mention the issue" 

      end

      context "closing an issue" do
        let(:message)         { "this is some work.\n\ncloses JIRA-1" }
        let(:comment_body) do
          {
            body: "Issue solved with [#{closing_commit.id}|http://#{Gitlab.config.gitlab.host}/#{project.full_path}/commit/#{closing_commit.id}]."
          }.to_json
        end

        before do
          open_issue   = JIRA::Resource::Issue.new(jira_tracker.client, attrs: { "id" => "JIRA-1" })
          closed_issue = open_issue.dup
          allow(open_issue).to receive(:resolution).and_return(false)
          allow(closed_issue).to receive(:resolution).and_return(true)
          allow(JIRA::Resource::Issue).to receive(:find).and_return(open_issue, closed_issue)

          allow_any_instance_of(JIRA::Resource::Issue).to receive(:key).and_return("JIRA-1")
        end

        context "using right markdown" do
          it "initiates one api call to jira server to close the issue" 


          it "initiates one api call to jira server to comment on the issue" 

        end

        context "using internal issue reference" do
          context 'when internal issues are disabled' do
            before do
              project.issues_enabled = false
              project.save!
            end
            let(:message) { "this is some work.\n\ncloses #1" }

            it "does not initiates one api call to jira server to close the issue" 


            it "does not initiates one api call to jira server to comment on the issue" 

          end

          context 'when internal issues are enabled' do
            let(:issue) { create(:issue, project: project) }
            let(:message) { "this is some work.\n\ncloses JIRA-1 \n\n closes #{issue.to_reference}" }

            it "initiates one api call to jira server to close the jira issue" 


            it "initiates one api call to jira server to comment on the jira issue" 


            it "closes the internal issue" 


            it "adds a note indicating that the issue is now closed" 

          end
        end
      end
    end
  end

  describe "empty project" do
    let(:project) { create(:project_empty_repo) }
    let(:new_ref) { 'refs/heads/feature' }

    before do
      allow(project).to receive(:default_branch).and_return('feature')
      expect(project).to receive(:change_head) { 'feature'}
    end

    it 'push to first branch updates HEAD' 

  end

  describe "housekeeping" do
    let(:housekeeping) { Projects::HousekeepingService.new(project) }

    before do
      # Flush any raw key-value data stored by the housekeeping code.
      Gitlab::Redis::Cache.with { |conn| conn.flushall }
      Gitlab::Redis::Queues.with { |conn| conn.flushall }
      Gitlab::Redis::SharedState.with { |conn| conn.flushall }

      allow(Projects::HousekeepingService).to receive(:new).and_return(housekeeping)
    end

    after do
      Gitlab::Redis::Cache.with { |conn| conn.flushall }
      Gitlab::Redis::Queues.with { |conn| conn.flushall }
      Gitlab::Redis::SharedState.with { |conn| conn.flushall }
    end

    it 'does not perform housekeeping when not needed' 


    context 'when housekeeping is needed' do
      before do
        allow(housekeeping).to receive(:needed?).and_return(true)
      end

      it 'performs housekeeping' 


      it 'does not raise an exception' 

    end

    it 'increments the push counter' 

  end

  describe '#update_caches' do
    let(:service) do
      described_class.new(project,
                          user,
                          oldrev: oldrev,
                          newrev: newrev,
                          ref: ref)
    end

    context 'on the default branch' do
      before do
        allow(service).to receive(:default_branch?).and_return(true)
      end

      it 'flushes the caches of any special files that have been changed' 

    end

    context 'on a non-default branch' do
      before do
        allow(service).to receive(:default_branch?).and_return(false)
      end

      it 'does not flush any conditional caches' 

    end
  end

  describe '#process_commit_messages' do
    let(:service) do
      described_class.new(project,
                          user,
                          oldrev: oldrev,
                          newrev: newrev,
                          ref: ref)
    end

    it 'only schedules a limited number of commits' 


    it "skips commits which don't include cross-references" 

  end

  describe '#update_signatures' do
    let(:service) do
      described_class.new(
        project,
        user,
        oldrev: oldrev,
        newrev: newrev,
        ref: 'refs/heads/master'
      )
    end

    context 'when the commit has a signature' do
      context 'when the signature is already cached' do
        before do
          create(:gpg_signature, commit_sha: sample_commit.id)
        end

        it 'does not queue a CreateGpgSignatureWorker' 

      end

      context 'when the signature is not yet cached' do
        it 'queues a CreateGpgSignatureWorker' 

      end
    end

    context 'when the commit does not have a signature' do
      before do
        allow(Gitlab::Git::Commit).to receive(:shas_with_signatures).with(project.repository, [sample_commit.id]).and_return([])
      end

      it 'does not queue a CreateGpgSignatureWorker' 

    end
  end

  def execute_service(project, user, oldrev, newrev, ref)
    service = described_class.new(project, user, oldrev: oldrev, newrev: newrev, ref: ref)
    service.execute
    service
  end

  def push_data_from_service(project, user, oldrev, newrev, ref)
    execute_service(project, user, oldrev, newrev, ref).push_data
  end
end

