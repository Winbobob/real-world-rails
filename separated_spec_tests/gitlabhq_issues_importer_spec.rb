require 'spec_helper'

describe Gitlab::GithubImport::Importer::IssuesImporter do
  let(:project) { double(:project, id: 4, import_source: 'foo/bar') }
  let(:client) { double(:client) }
  let(:created_at) { Time.new(2017, 1, 1, 12, 00) }
  let(:updated_at) { Time.new(2017, 1, 1, 12, 15) }

  let(:github_issue) do
    double(
      :response,
      number: 42,
      title: 'My Issue',
      body: 'This is my issue',
      milestone: double(:milestone, number: 4),
      state: 'open',
      assignees: [double(:user, id: 4, login: 'alice')],
      labels: [double(:label, name: 'bug')],
      user: double(:user, id: 4, login: 'alice'),
      created_at: created_at,
      updated_at: updated_at,
      pull_request: false
    )
  end

  describe '#parallel?' do
    it 'returns true when running in parallel mode' 


    it 'returns false when running in sequential mode' 

  end

  describe '#execute' do
    context 'when running in parallel mode' do
      it 'imports issues in parallel' 

    end

    context 'when running in sequential mode' do
      it 'imports issues in sequence' 

    end
  end

  describe '#sequential_import' do
    it 'imports each issue in sequence' 

  end

  describe '#parallel_import' do
    it 'imports each issue in parallel' 

  end

  describe '#id_for_already_imported_cache' do
    it 'returns the issue number of the given issue' 

  end
end

