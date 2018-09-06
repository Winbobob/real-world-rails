require 'spec_helper'

describe Gitlab::GithubImport::Importer::IssueImporter, :clean_gitlab_redis_cache do
  let(:project) { create(:project) }
  let(:client) { double(:client) }
  let(:user) { create(:user) }
  let(:milestone) { create(:milestone, project: project) }
  let(:created_at) { Time.new(2017, 1, 1, 12, 00) }
  let(:updated_at) { Time.new(2017, 1, 1, 12, 15) }

  let(:issue) do
    Gitlab::GithubImport::Representation::Issue.new(
      iid: 42,
      title: 'My Issue',
      description: 'This is my issue',
      milestone_number: 1,
      state: :opened,
      assignees: [
        Gitlab::GithubImport::Representation::User.new(id: 4, login: 'alice'),
        Gitlab::GithubImport::Representation::User.new(id: 5, login: 'bob')
      ],
      label_names: %w[bug],
      author: Gitlab::GithubImport::Representation::User.new(id: 4, login: 'alice'),
      created_at: created_at,
      updated_at: updated_at,
      pull_request: false
    )
  end

  describe '.import_if_issue' do
    it 'imports an issuable if it is a regular issue' 


    it 'does not import the issuable if it is a pull request' 

  end

  describe '#execute' do
    let(:importer) { described_class.new(issue, project, client) }

    it 'creates the issue and assignees' 

  end

  describe '#create_issue' do
    let(:importer) { described_class.new(issue, project, client) }

    before do
      allow(importer.milestone_finder)
        .to receive(:id_for)
        .with(issue)
        .and_return(milestone.id)
    end

    context 'when the issue author could be found' do
      it 'creates the issue with the found author as the issue author' 

    end

    context 'when the issue author could not be found' do
      it 'creates the issue with the project creator as the issue author' 

    end

    context 'when the import fails due to a foreign key error' do
      it 'does not raise any errors' 

    end

    it 'produces a valid Issue' 


    it 'returns the ID of the created issue' 

  end

  describe '#create_assignees' do
    it 'inserts the issue assignees in bulk' 

  end
end

