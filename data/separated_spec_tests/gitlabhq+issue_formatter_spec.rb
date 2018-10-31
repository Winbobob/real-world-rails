require 'spec_helper'

describe Gitlab::LegacyGithubImport::IssueFormatter do
  let(:client) { double }
  let!(:project) { create(:project, namespace: create(:namespace, path: 'octocat')) }
  let(:octocat) { double(id: 123456, login: 'octocat', email: 'octocat@example.com') }
  let(:created_at) { DateTime.strptime('2011-01-26T19:01:12Z') }
  let(:updated_at) { DateTime.strptime('2011-01-27T19:01:12Z') }

  let(:base_data) do
    {
      number: 1347,
      milestone: nil,
      state: 'open',
      title: 'Found a bug',
      body: "I'm having a problem with this.",
      assignee: nil,
      user: octocat,
      comments: 0,
      pull_request: nil,
      created_at: created_at,
      updated_at: updated_at,
      closed_at: nil
    }
  end

  subject(:issue) { described_class.new(project, raw_data, client) }

  before do
    allow(client).to receive(:user).and_return(octocat)
  end

  shared_examples 'Gitlab::LegacyGithubImport::IssueFormatter#attributes' do
    context 'when issue is open' do
      let(:raw_data) { double(base_data.merge(state: 'open')) }

      it 'returns formatted attributes' 

    end

    context 'when issue is closed' do
      let(:raw_data) { double(base_data.merge(state: 'closed')) }

      it 'returns formatted attributes' 

    end

    context 'when it is assigned to someone' do
      let(:raw_data) { double(base_data.merge(assignee: octocat)) }

      it 'returns nil as assignee_id when is not a GitLab user' 


      it 'returns GitLab user id associated with GitHub id as assignee_id' 


      it 'returns GitLab user id associated with GitHub email as assignee_id' 

    end

    context 'when it has a milestone' do
      let(:milestone) { double(id: 42, number: 42) }
      let(:raw_data) { double(base_data.merge(milestone: milestone)) }

      it 'returns nil when milestone does not exist' 


      it 'returns milestone when it exists' 

    end

    context 'when author is a GitLab user' do
      let(:raw_data) { double(base_data.merge(user: octocat)) }

      it 'returns project creator_id as author_id when is not a GitLab user' 


      it 'returns GitLab user id associated with GitHub id as author_id' 


      it 'returns GitLab user id associated with GitHub email as author_id' 


      it 'returns description without created at tag line' 

    end
  end

  shared_examples 'Gitlab::LegacyGithubImport::IssueFormatter#number' do
    let(:raw_data) { double(base_data.merge(number: 1347)) }

    it 'returns issue number' 

  end

  context 'when importing a GitHub project' do
    it_behaves_like 'Gitlab::LegacyGithubImport::IssueFormatter#attributes'
    it_behaves_like 'Gitlab::LegacyGithubImport::IssueFormatter#number'
  end

  context 'when importing a Gitea project' do
    before do
      project.update(import_type: 'gitea')
    end

    it_behaves_like 'Gitlab::LegacyGithubImport::IssueFormatter#attributes'
    it_behaves_like 'Gitlab::LegacyGithubImport::IssueFormatter#number'
  end

  describe '#has_comments?' do
    context 'when number of comments is greater than zero' do
      let(:raw_data) { double(base_data.merge(comments: 1)) }

      it 'returns true' 

    end

    context 'when number of comments is equal to zero' do
      let(:raw_data) { double(base_data.merge(comments: 0)) }

      it 'returns false' 

    end
  end

  describe '#pull_request?' do
    context 'when mention a pull request' do
      let(:raw_data) { double(base_data.merge(pull_request: double)) }

      it 'returns true' 

    end

    context 'when does not mention a pull request' do
      let(:raw_data) { double(base_data.merge(pull_request: nil)) }

      it 'returns false' 

    end
  end
end

