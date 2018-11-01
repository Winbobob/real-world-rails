require 'spec_helper'

describe Gitlab::BitbucketServerImport::Importer do
  include ImportSpecHelper

  let(:project) { create(:project, :repository, import_url: 'http://my-bitbucket') }
  let(:now) { Time.now.utc.change(usec: 0) }
  let(:project_key) { 'TEST' }
  let(:repo_slug) { 'rouge' }
  let(:sample) { RepoHelpers.sample_compare }

  subject { described_class.new(project, recover_missing_commits: true) }

  before do
    data = project.create_or_update_import_data(
      data: { project_key: project_key, repo_slug: repo_slug },
      credentials: { base_uri: 'http://my-bitbucket', user: 'bitbucket', password: 'test' }
    )
    data.save
    project.save
  end

  describe '#import_repository' do
    before do
      expect(subject).to receive(:import_pull_requests)
      expect(subject).to receive(:delete_temp_branches)
    end

    it 'adds a remote' 

  end

  describe '#import_pull_requests' do
    before do
      allow(subject).to receive(:import_repository)
      allow(subject).to receive(:delete_temp_branches)
      allow(subject).to receive(:restore_branches)

      pull_request = instance_double(
        BitbucketServer::Representation::PullRequest,
        iid: 10,
        source_branch_sha: sample.commits.last,
        source_branch_name: Gitlab::Git::BRANCH_REF_PREFIX + sample.source_branch,
        target_branch_sha: sample.commits.first,
        target_branch_name: Gitlab::Git::BRANCH_REF_PREFIX + sample.target_branch,
        title: 'This is a title',
        description: 'This is a test pull request',
        state: 'merged',
        author: 'Test Author',
        author_email: project.owner.email,
        created_at: Time.now,
        updated_at: Time.now,
        merged?: true)

      allow(subject.client).to receive(:pull_requests).and_return([pull_request])

      @merge_event = instance_double(
        BitbucketServer::Representation::Activity,
        comment?: false,
        merge_event?: true,
        committer_email: project.owner.email,
        merge_timestamp: now,
        merge_commit: '12345678'
      )

      @pr_note = instance_double(
        BitbucketServer::Representation::Comment,
        note: 'Hello world',
        author_email: 'unknown@gmail.com',
        author_username: 'The Flash',
        comments: [],
        created_at: now,
        updated_at: now,
        parent_comment: nil)

      @pr_comment = instance_double(
        BitbucketServer::Representation::Activity,
        comment?: true,
        inline_comment?: false,
        merge_event?: false,
        comment: @pr_note)
    end

    it 'imports merge event' 


    it 'imports comments' 


    it 'imports threaded discussions' 


    it 'falls back to comments if diff comments fail to validate' 

  end

  describe 'inaccessible branches' do
    let(:id) { 10 }
    let(:temp_branch_from) { "gitlab/import/pull-request/#{id}/from" }
    let(:temp_branch_to) { "gitlab/import/pull-request/#{id}/to" }

    before do
      pull_request = instance_double(
        BitbucketServer::Representation::PullRequest,
        iid: id,
        source_branch_sha: '12345678',
        source_branch_name: Gitlab::Git::BRANCH_REF_PREFIX + sample.source_branch,
        target_branch_sha: '98765432',
        target_branch_name: Gitlab::Git::BRANCH_REF_PREFIX + sample.target_branch,
        title: 'This is a title',
        description: 'This is a test pull request',
        state: 'merged',
        author: 'Test Author',
        author_email: project.owner.email,
        created_at: Time.now,
        updated_at: Time.now,
        merged?: true)

      expect(subject.client).to receive(:pull_requests).and_return([pull_request])
      expect(subject.client).to receive(:activities).and_return([])
      expect(subject).to receive(:import_repository).twice
    end

    it '#restore_branches' 


    it '#delete_temp_branches' 

  end
end

