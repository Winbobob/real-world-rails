require 'spec_helper'

describe Gitlab::SlashCommands::IssueSearch do
  describe '#execute' do
    let!(:issue) { create(:issue, project: project, title: 'find me') }
    let!(:confidential) { create(:issue, :confidential, project: project, title: 'mepmep find') }
    let(:project) { create(:project) }
    let(:user) { create(:user) }
    let(:chat_name) { double(:chat_name, user: user) }
    let(:regex_match) { described_class.match("issue search find") }

    subject do
      described_class.new(project, chat_name).execute(regex_match)
    end

    context 'when the user has no access' do
      it 'only returns the open issues' 

    end

    context 'the user has access' do
      before do
        project.add_maintainer(user)
      end

      it 'returns all results' 

    end

    context 'without hits on the query' do
      it 'returns an empty collection' 

    end
  end

  describe 'self.match' do
    let(:query) { "my search keywords" }
    it 'matches the query' 

  end
end

