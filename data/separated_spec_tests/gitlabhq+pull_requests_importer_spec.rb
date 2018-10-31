require 'spec_helper'

describe Gitlab::GithubImport::Importer::PullRequestsImporter do
  let(:project) { create(:project, import_source: 'foo/bar') }
  let(:client) { double(:client) }

  let(:pull_request) do
    double(
      :response,
      number: 42,
      title: 'My Pull Request',
      body: 'This is my pull request',
      state: 'closed',
      head: double(
        :head,
        sha: '123abc',
        ref: 'my-feature',
        repo: double(:repo, id: 400),
        user: double(:user, id: 4, login: 'alice')
      ),
      base: double(
        :base,
        sha: '456def',
        ref: 'master',
        repo: double(:repo, id: 200)
      ),
      milestone: double(:milestone, number: 4),
      user: double(:user, id: 4, login: 'alice'),
      assignee: double(:user, id: 4, login: 'alice'),
      created_at: 1.second.ago,
      updated_at: 1.second.ago,
      merged_at: 1.second.ago
    )
  end

  describe '#parallel?' do
    it 'returns true when running in parallel mode' 


    it 'returns false when running in sequential mode' 

  end

  describe '#execute' do
    context 'when running in parallel mode' do
      it 'imports pull requests in parallel' 

    end

    context 'when running in sequential mode' do
      it 'imports pull requests in sequence' 

    end
  end

  describe '#sequential_import' do
    it 'imports each pull request in sequence' 

  end

  describe '#parallel_import' do
    it 'imports each note in parallel' 

  end

  describe '#each_object_to_import', :clean_gitlab_redis_cache do
    let(:importer) { described_class.new(project, client) }

    before do
      page = double(:page, objects: [pull_request], number: 1)

      expect(client)
        .to receive(:each_page)
        .with(
          :pull_requests,
          'foo/bar',
          { state: 'all', sort: 'created', direction: 'asc', page: 1 }
        )
        .and_yield(page)
    end

    it 'yields every pull request to the supplied block' 


    it 'updates the repository if a pull request was updated after the last clone' 

  end

  describe '#update_repository' do
    it 'updates the repository' 

  end

  describe '#update_repository?' do
    let(:importer) { described_class.new(project, client) }

    context 'when the pull request was updated after the last update' do
      let(:pr) do
        double(
          :pr,
          updated_at: Time.zone.now,
          head: double(:head, sha: '123'),
          base: double(:base, sha: '456')
        )
      end

      before do
        allow(project)
          .to receive(:last_repository_updated_at)
          .and_return(1.year.ago)
      end

      it 'returns true when the head SHA is not present' 


      it 'returns true when the base SHA is not present' 


      it 'returns false if both the head and base SHAs are present' 

    end

    context 'when the pull request was updated before the last update' do
      it 'returns false' 

    end
  end

  describe '#commit_exists?' do
    let(:importer) { described_class.new(project, client) }

    it 'returns true when a commit exists' 


    it 'returns false when a commit does not exist' 

  end

  describe '#id_for_already_imported_cache' do
    it 'returns the PR number of the given PR' 

  end
end

